// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HeroDto _$HeroDtoFromJson(Map<String, dynamic> json) => _HeroDto(
  createdAt: json['createdAt'] as String,
  name: json['name'] as String,
  picks: (json['picks'] as num).toInt(),
  wins: (json['wins'] as num).toInt(),
  tier: json['tier'] as String,
  winRate: (json['winRate'] as num).toDouble(),
);

Map<String, dynamic> _$HeroDtoToJson(_HeroDto instance) => <String, dynamic>{
  'createdAt': instance.createdAt,
  'name': instance.name,
  'picks': instance.picks,
  'wins': instance.wins,
  'tier': instance.tier,
  'winRate': instance.winRate,
};
