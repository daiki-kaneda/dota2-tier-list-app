
import { jest } from '@jest/globals';
import { Hero, HeroList, HeroListSchema } from '../../../../lambda/entity/hero';
import { getHeroList } from '../../../../lambda/usecase/getHeroList';
import { HeroRepository } from '../../../../lambda/usecase/port/HeroRepository';

describe('getHeroList', () => {

  test('repoから取得した値をそのまま返す', async () => {

    const mockHeroes: HeroList = HeroListSchema.parse([
      {
        createdAt: '2026-01-01',
        name: 'Invoker',
        picks: 100,
        wins: 55,
        tier: 'S',
        winRate: 55
      }
    ]);
    const mockRepo:jest.Mocked<HeroRepository> = {
      getHeroList: jest.fn()
    };
    mockRepo.getHeroList.mockResolvedValue(mockHeroes);

    const result = await getHeroList(mockRepo);

    expect(result).toEqual(mockHeroes); 
    expect(mockRepo.getHeroList).toHaveBeenCalledTimes(1); 
  });

});