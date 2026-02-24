import 'package:frontend/features/hero/domain/entity/hero.dart';
import 'package:frontend/features/hero/domain/usecase/port/hero_repository.dart';
import 'package:dio/dio.dart';
import 'package:frontend/features/hero/infrastructure/dto/hero_dto.dart';

class HeroRepositoryImpl implements HeroRepository {
  final Dio _dio;

  const HeroRepositoryImpl(this._dio);
  @override
  Future<List<Hero>> findAll() async {
    final response = await _dio.get('/heroes');
    return (response.data as List)
        .map((e) => HeroDto.fromJson(e as Map<String, dynamic>).toDomain())
        .toList();
  }
}
