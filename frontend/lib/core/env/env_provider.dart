import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'env_provider.g.dart';

@Riverpod(keepAlive: true)
FutureOr<String?> env(Ref ref, String key) async {
  if (!dotenv.isInitialized) {
    await dotenv.load(fileName: ".env");
  }
  if (dotenv.isEveryDefined([key])) {
    return dotenv.env[key];
  }
  return null;
}
