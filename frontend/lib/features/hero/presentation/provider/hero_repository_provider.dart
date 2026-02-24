import 'package:dio/dio.dart';
import 'package:frontend/core/env/env_provider.dart';
import 'package:frontend/features/hero/domain/usecase/port/hero_repository.dart';
import 'package:frontend/features/hero/infrastructure/hero_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hero_repository_provider.g.dart';

@Riverpod(keepAlive: true)
FutureOr<HeroRepository> heroRepository(Ref ref) async {
  final baseUrl = await ref.read(envProvider("BASE_URL").future);
  if (baseUrl == null) {
    throw ArgumentError("環境変数にBASE_URLがありません");
  }
  final dio = Dio(BaseOptions(baseUrl: baseUrl));
  return HeroRepositoryImpl(dio);
}
