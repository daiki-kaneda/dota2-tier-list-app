import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/features/hero/domain/entity/hero.dart';

void main(){
  group('Hero.create (Entity Validation)', (){
    final validDate = '2036-03-03';

    test('正常な入力でインスタンスが生成されること',(){
      final hero = Hero.create(
        createdAt: validDate, 
        name: 'Mars', 
        picks: 100, 
        wins: 60, 
        tier: Tier.S, 
        winRate: 60);

      expect(hero.name, 'Mars');
    });
    test('名前が空の時にエラーを投げること', (){
        expect(()=>Hero.create(
        createdAt: validDate, 
        name: '', 
        picks: 100, 
        wins: 60, 
        tier: Tier.S, 
        winRate: 60), throwsA(isA<ArgumentError>()));
    });
    test('ピック数または勝利数が負の時にエラーを投げること', (){
        expect(()=>Hero.create(
        createdAt: validDate, 
        name: 'Mars', 
        picks: -1, 
        wins: 60, 
        tier: Tier.S, 
        winRate: 60), throwsA(isA<ArgumentError>()));

        expect(()=>Hero.create(
        createdAt: validDate, 
        name: 'Mars', 
        picks: 100, 
        wins: -1, 
        tier: Tier.S, 
        winRate: 60), throwsA(isA<ArgumentError>()));
    });
    test('勝率が0未満または100より大きい時にエラーを投げること', (){
        expect(()=>Hero.create(
        createdAt: validDate, 
        name: 'Mars', 
        picks: 100, 
        wins: 60, 
        tier: Tier.S, 
        winRate: 101), throwsA(isA<ArgumentError>()));

        expect(()=>Hero.create(
        createdAt: validDate, 
        name: 'Mars', 
        picks: 100, 
        wins: 60, 
        tier: Tier.S, 
        winRate: -1), throwsA(isA<ArgumentError>()));
    });
  });
}