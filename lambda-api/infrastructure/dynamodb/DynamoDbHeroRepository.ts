import { HeroList, HeroListSchema } from "../../entity/hero";
import { HeroRepository } from "../../usecase/port/HeroRepository";
import { DynamoDBDocumentClient, QueryCommand } from "@aws-sdk/lib-dynamodb";
import { DynamoDBClient } from "@aws-sdk/client-dynamodb"

export class DynamoDbHeroRepository implements HeroRepository {
    private readonly client: DynamoDBDocumentClient;
    private readonly tableName;

    public constructor(tableName: string) {
        this.tableName = tableName;
        const ddbClient = new DynamoDBClient({});
        this.client = DynamoDBDocumentClient.from(ddbClient);
    }

    async getHeroList(): Promise<HeroList> {
        const command = new QueryCommand({
            TableName: this.tableName,
            IndexName: "gsi1",
            KeyConditionExpression: "gsi1pk = :pk",
            ExpressionAttributeValues: {
                ":pk": "RANKING#LATEST",
            },
            ScanIndexForward: false,
        });

        const response = await this.client.send(command);
        return HeroListSchema.parse(response.Items ?? []);
    }
}