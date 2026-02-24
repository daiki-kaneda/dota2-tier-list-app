import 'package:frontend/features/hero/domain/entity/hero.dart';

abstract class HeroRepository {
  Future<List<Hero>> findAll();
}