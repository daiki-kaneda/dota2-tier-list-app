import {APIGatewayProxyEvent,APIGatewayProxyResult} from "aws-lambda";
import { HeroRepository } from "../../usecase/port/HeroRepository";
import { DynamoDbHeroRepository } from "../../infrastructure/dynamodb/DynamoDbHeroRepository";

const repo:HeroRepository = new DynamoDbHeroRepository(process.env.TABLE_NAME ?? '');
export const handler = async (event:APIGatewayProxyEvent):Promise<APIGatewayProxyResult>=>{

}