import 'package:freezed_annotation/freezed_annotation.dart';

part 'hero.freezed.dart';

@freezed
abstract class Hero with _$Hero {
  factory Hero({
    required String createdAt,
    required String name,
    required int picks,
    required int wins,
    required Tier tier,
    required double winRate,
  }) = _Hero;

  factory Hero.create({
    required String createdAt,
    required String name,
    required int picks,
    required int wins,
    required Tier tier,
    required double winRate,
  }) {

    if(name.isEmpty){
      throw ArgumentError("名前は必須です。");
    }
    if(picks<0){
      throw ArgumentError("ピック数は０以上でないといけません。");
    }
    if(wins<0){
      throw ArgumentError("勝利数は0以上でないといけません。");
    }
    if(winRate<0 || winRate>100){
      throw ArgumentError("勝率は0以上、100以下でないといけません。");
    }
    return Hero(
      createdAt: createdAt,
      name: name,
      picks: picks,
      wins: wins,
      tier: tier,
      winRate: winRate,
    );
  }
}

enum Tier{
  S,A,B,C;
}
