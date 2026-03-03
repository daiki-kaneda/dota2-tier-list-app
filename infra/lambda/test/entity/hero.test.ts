import { HeroSchema } from "../../entity/hero";

const createHero = ()=>({
    createdAt: '2026-01-01',
    name: 'Invoker',
    picks: 10,
    wins: 6,
    tier: 'S',
    winRate: 60
});
test('HeroSchema 正常データ', () => {

    const parsed = HeroSchema.parse(createHero());

    expect(parsed).toEqual(createHero());
});

test('名前が空の時エラーを返すこと', () => {
    const heroWithInvalidName = {
        ...createHero(),
        name:'',
    }

    expect(() => HeroSchema.parse(heroWithInvalidName))
        .toThrow();
});

test('ピック数、勝利数が０未満の時にエラーを返すこと',()=>{
    const heroWithInvalidPicks = {
        ...createHero(),
        picks:-1
    };
    const heroWithInvalidWins = {
        ...createHero(),
        wins:-1
    };

    expect(()=>HeroSchema.parse(heroWithInvalidPicks))
    .toThrow();
    expect(()=>HeroSchema.parse(heroWithInvalidWins))
    .toThrow();
    
});

test('ティアがS,A,B,Cのいずれかでない時にエラーを返すこと',()=>{
    const heroWithInvalidTier = {
        ...createHero(),
        tier:'D'
    };

    expect(()=>HeroSchema.parse(heroWithInvalidTier))
    .toThrow();
    
});

test('勝率が不適切な場合はエラーを返すこと',()=>{
    const heroWithInvalidWinRate1 = {
        ...createHero(),
        winRate:-1
    };
    const heroWithInvalidWinRate2 = {
        ...createHero(),
        winRate:120
    };

    expect(()=>HeroSchema.parse(heroWithInvalidWinRate1))
    .toThrow();
    expect(()=>HeroSchema.parse(heroWithInvalidWinRate2))
    .toThrow();
    
});