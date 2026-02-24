import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/features/hero/domain/entity/hero.dart';

part 'hero_dto.freezed.dart';
part 'hero_dto.g.dart';

@freezed
abstract class HeroDto with _$HeroDto {
  const HeroDto._();

  factory HeroDto({
    required String createdAt,
    required String name,
    required int picks,
    required int wins,
    required String tier,
    required double winRate,
  }) = _HeroDto;

  factory HeroDto.fromJson(Map<String, dynamic> json) =>
      _$HeroDtoFromJson(json);

  Hero toDomain() {
    return Hero.create(
      createdAt: createdAt,
      name: name,
      picks: picks,
      wins: wins,
      tier: Tier.fromString(tier),
      winRate: winRate,
    );
  }
}
