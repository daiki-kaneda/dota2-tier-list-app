import * as cdk from 'aws-cdk-lib/core';
import { Construct } from 'constructs';
import * as ec2 from 'aws-cdk-lib/aws-ec2';
import * as iam from 'aws-cdk-lib/aws-iam';
import * as dynamodb from 'aws-cdk-lib/aws-dynamodb'

export class InfraStack extends cdk.Stack {
  constructor(scope: Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    // === DynamoDB ===
    const heroTable = new dynamodb.Table(this,"HeroTable",{
      tableName:'HeroRankings',
      partitionKey:{name:'pk',type:dynamodb.AttributeType.STRING},
      sortKey:{name:'sk',type:dynamodb.AttributeType.STRING},
      billingMode:dynamodb.BillingMode.PAY_PER_REQUEST,
      removalPolicy:cdk.RemovalPolicy.DESTROY
    });

    heroTable.addGlobalSecondaryIndex({
      indexName:'gsi1',
      partitionKey:{name:'gsi1pk',type:dynamodb.AttributeType.STRING},
      sortKey:{name:'gsi1sk',type:dynamodb.AttributeType.STRING},
      projectionType:dynamodb.ProjectionType.ALL
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

  }
}
