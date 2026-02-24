import * as cdk from 'aws-cdk-lib/core';
import { Construct } from 'constructs';
import * as ec2 from 'aws-cdk-lib/aws-ec2';
import * as iam from 'aws-cdk-lib/aws-iam';
import * as dynamodb from 'aws-cdk-lib/aws-dynamodb';
import * as autoscaling from 'aws-cdk-lib/aws-autoscaling';
import * as s3 from 'aws-cdk-lib/aws-s3';
import * as lambda from 'aws-cdk-lib/aws-lambda';
import { NodejsFunction } from 'aws-cdk-lib/aws-lambda-nodejs';
import * as apigateway from 'aws-cdk-lib/aws-apigateway';

export class InfraStack extends cdk.Stack {
  constructor(scope: Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    // === S3 ===
    const assetBucket = new s3.Bucket(this, 'WokerAssetBucket', {
      encryption: s3.BucketEncryption.S3_MANAGED,
      removalPolicy: cdk.RemovalPolicy.DESTROY,
      autoDeleteObjects: true
    });

    // === DynamoDB ===
    const heroTable = new dynamodb.Table(this, "HeroTable", {
      tableName: 'HeroRankings',
      partitionKey: { name: 'pk', type: dynamodb.AttributeType.STRING },
      sortKey: { name: 'sk', type: dynamodb.AttributeType.STRING },
      billingMode: dynamodb.BillingMode.PAY_PER_REQUEST,
      removalPolicy: cdk.RemovalPolicy.DESTROY
    });

    heroTable.addGlobalSecondaryIndex({
      indexName: 'gsi1',
      partitionKey: { name: 'gsi1pk', type: dynamodb.AttributeType.STRING },
      sortKey: { name: 'gsi1sk', type: dynamodb.AttributeType.STRING },
      projectionType: dynamodb.ProjectionType.ALL
    });

    // === VPC ===
    const vpc = new ec2.Vpc(this, 'MyVPC', {
      natGateways: 0,
      subnetConfiguration: [
        {
          name: 'public',
          subnetType: ec2.SubnetType.PUBLIC
        }
      ]
    });
    vpc.addGatewayEndpoint("DynamoDBEndpoint", {
      service: ec2.GatewayVpcEndpointAwsService.DYNAMODB
    });

    const workerSg = new ec2.SecurityGroup(
      this, "WorkerSg", {
      vpc: vpc,
      allowAllOutbound: true,
      description: "Security Group for tier list making worker"
    }
    );

    const wokerRole = new iam.Role(this, "WorkerRole", {
      assumedBy: new iam.ServicePrincipal('ec2.amazonaws.com'),
      managedPolicies: [
        // Session Manager を使ってブラウザからログインできるようにする
        iam.ManagedPolicy.fromAwsManagedPolicyName('AmazonSSMManagedInstanceCore')
      ]
    });

    heroTable.grantReadWriteData(wokerRole);
    assetBucket.grantRead(wokerRole);

    const asg = new autoscaling.AutoScalingGroup(
      this, "WorkerAsg", {
      vpc,
      instanceType: ec2.InstanceType.of(ec2.InstanceClass.T3, ec2.InstanceSize.MICRO),
      machineImage: ec2.MachineImage.latestAmazonLinux2023(),
      role: wokerRole,
      securityGroup: workerSg,
      minCapacity: 0,
      maxCapacity: 1,
      desiredCapacity: 0,
      spotPrice: '0.015',
    });

    const jarName = 'spring-boot-woker.jar';
    asg.addUserData(
      // パッケージマネージャの更新
      'dnf update -y',
      // Amazon Corretto 21をインストール
      'dnf install java-21-amazon-corretto-devel -y',
      // S3からJARファイルをダウンロード
      `aws s3 cp s3://${assetBucket.bucketName}/${jarName} /home/ec2-user/app.jar`,
      // 実行権限の付与とユーザーの変更
      'chown ec2-user:ec2-user /home/ec2-user/app.jar',
      // Spring Bootアプリの実行
      'sudo -u ec2-user java -jar /home/ec2-user/app.jar'
    );

    asg.scaleOnSchedule("ScaleOutAtScheduleTime", {
      schedule: autoscaling.Schedule.cron({ hour: '0', minute: '0' }), // UTC 0:00 (日本時間 9:00)
      desiredCapacity: 1,
      minCapacity: 1,
      maxCapacity: 1,
    });

    asg.scaleOnSchedule("ScaleInAtScheduleTime", {
      schedule: autoscaling.Schedule.cron({ hour: '1', minute: '0' }), // UTC 1:00 (日本時間 10:00)
      desiredCapacity: 0,
      minCapacity: 0,
      maxCapacity: 0,
    });

    // === Lambda ===
    const getHeroListHandler = new NodejsFunction(
      this,
      'GetHeroListHandler', {
      runtime: lambda.Runtime.NODEJS_22_X,
      entry: 'lambda/handler/api/getHeroList.ts',
      handler: 'handler',
      
      environment: {
        TABLE_NAME: heroTable.tableName
      }
    });

    heroTable.grantReadData(getHeroListHandler);

    // === API Gateway ===
    const api = new apigateway.RestApi(
      this, 'HeroApi',
      {
        restApiName: 'Dota2 Hero Tier API',
        deployOptions: {
          stageName:'prod'
        },
        defaultCorsPreflightOptions: {
          allowOrigins: apigateway.Cors.ALL_ORIGINS,
          allowMethods: apigateway.Cors.ALL_METHODS,
          allowHeaders: apigateway.Cors.DEFAULT_HEADERS
        },
      }
    );

    const heroes = api.root.addResource("heroes");
    heroes.addMethod('GET',new apigateway.LambdaIntegration(getHeroListHandler));

  }
}
