import { HeroList } from "../entity/hero";
import { HeroRepository } from "./port/HeroRepository";

export const getHeroList = async (
    repo: HeroRepository
): Promise<HeroList> => {
    return await repo.getHeroList();
}