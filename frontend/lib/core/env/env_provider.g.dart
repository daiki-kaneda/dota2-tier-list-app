// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(env)
final envProvider = EnvFamily._();

final class EnvProvider
    extends $FunctionalProvider<AsyncValue<String?>, String?, FutureOr<String?>>
    with $FutureModifier<String?>, $FutureProvider<String?> {
  EnvProvider._({required EnvFamily super.from, required String super.argument})
    : super(
        retry: null,
        name: r'envProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$envHash();

  @override
  String toString() {
    return r'envProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String?> create(Ref ref) {
    final argument = this.argument as String;
    return env(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is EnvProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$envHash() => r'299b38652728cc953152767cc2bb7cfe9ea97431';

final class EnvFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<String?>, String> {
  EnvFamily._()
    : super(
        retry: null,
        name: r'envProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  EnvProvider call(String key) => EnvProvider._(argument: key, from: this);

  @override
  String toString() => r'envProvider';
}
