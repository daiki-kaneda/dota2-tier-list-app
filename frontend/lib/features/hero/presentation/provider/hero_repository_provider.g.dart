// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(heroRepository)
final heroRepositoryProvider = HeroRepositoryProvider._();

final class HeroRepositoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<HeroRepository>,
          HeroRepository,
          FutureOr<HeroRepository>
        >
    with $FutureModifier<HeroRepository>, $FutureProvider<HeroRepository> {
  HeroRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'heroRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$heroRepositoryHash();

  @$internal
  @override
  $FutureProviderElement<HeroRepository> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<HeroRepository> create(Ref ref) {
    return heroRepository(ref);
  }
}

String _$heroRepositoryHash() => r'840e2097ff6a69eceeff9cabaff56245db904fe6';
