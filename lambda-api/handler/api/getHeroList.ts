import { APIGatewayProxyEvent, APIGatewayProxyResult } from "aws-lambda";
import { HeroRepository } from "../../usecase/port/HeroRepository";
import { DynamoDbHeroRepository } from "../../infrastructure/dynamodb/DynamoDbHeroRepository";
import { getHeroList } from "../../usecase/getHeroList";

const repo: HeroRepository = new DynamoDbHeroRepository(process.env.TABLE_NAME ?? '');

export const handler = async (event: APIGatewayProxyEvent): Promise<APIGatewayProxyResult> => {
    try {
        const result = await getHeroList(repo);
        return {
            statusCode: 200,
            body: result ? JSON.stringify(result) : ""
        }
    } catch (e) {
        console.error(e);
        return {
            statusCode: 500,
            body: JSON.stringify({ message: "Internal Server Error" })
        }
    }
}