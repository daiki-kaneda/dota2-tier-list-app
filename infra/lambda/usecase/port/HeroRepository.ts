import { HeroList } from "../../entity/hero";

export interface HeroRepository{
    getHeroList():Promise<HeroList>;
}