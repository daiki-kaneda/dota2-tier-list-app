import 'package:frontend/features/hero/domain/entity/hero.dart';
import 'package:frontend/features/hero/domain/usecase/port/hero_repository.dart';

class GetHeroes {
  final HeroRepository _heroRepository;

  const GetHeroes(this._heroRepository);

  Future<List<Hero>> call() {
    return _heroRepository.findAll();
  }
}
