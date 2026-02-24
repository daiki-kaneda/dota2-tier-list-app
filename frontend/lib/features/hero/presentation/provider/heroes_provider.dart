import 'package:frontend/features/hero/domain/entity/hero.dart';
import 'package:frontend/features/hero/domain/usecase/get_heroes.dart';
import 'package:frontend/features/hero/presentation/provider/hero_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'heroes_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<Hero>> heroes(Ref ref) async {
  final repo = await ref.read(heroRepositoryProvider.future);
  return GetHeroes(repo)();
}
