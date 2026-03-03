import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/features/hero/domain/entity/hero.dart';
import 'package:frontend/features/hero/domain/usecase/get_heroes.dart';
import 'package:frontend/features/hero/domain/usecase/port/hero_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockHeroRepository extends Mock implements HeroRepository {}

void main() {
  late MockHeroRepository mockRepository;
  late GetHeroes useCase;

  setUp(() {
    mockRepository = MockHeroRepository();
    useCase = GetHeroes(mockRepository);
  });

  group('GetHeroes UseCase', () {
    final tHeroList = [
      Hero(
        createdAt: '2026',
        name: 'Mars',
        picks: 10,
        wins: 5,
        tier: Tier.S,
        winRate: 50.0,
      ),
    ];

    test('リポジトリから正常にデータが取得されること', () async {
      when(() => mockRepository.findAll()).thenAnswer((_) async => tHeroList);

      final result = await useCase.call();

      expect(result, tHeroList);
      verify(() => mockRepository.findAll()).called(1);
    });
  });
}