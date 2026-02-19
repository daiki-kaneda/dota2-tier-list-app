import { z } from 'zod';

export const HeroSchema = z.object({
    createdAt: z.string(),
    name: z.string().min(1, '名前は必須です'),
    picks: z.number().min(0, 'ピック数は0以上である必要があります'),
    wins: z.number().min(0, '勝利数は0以上である必要があります'),
    tier: z.enum(["S", "A", "B", "C"], 'ティアはS,A,B,Cのいずれかです。'),
    winRate: z.number()
        .min(0, '勝率は0以上である必要があります。')
        .max(100, '勝率は100以下である必要があります。')
});
export const HeroListSchema = z.array(HeroSchema);

export type Hero = z.infer<typeof HeroSchema>;
export type HeroList = z.infer<typeof HeroListSchema>;
