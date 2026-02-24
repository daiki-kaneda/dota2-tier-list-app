// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'heroes_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(heroes)
final heroesProvider = HeroesProvider._();

final class HeroesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Hero>>,
          List<Hero>,
          FutureOr<List<Hero>>
        >
    with $FutureModifier<List<Hero>>, $FutureProvider<List<Hero>> {
  HeroesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'heroesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$heroesHash();

  @$internal
  @override
  $FutureProviderElement<List<Hero>> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Hero>> create(Ref ref) {
    return heroes(ref);
  }
}

String _$heroesHash() => r'206137691f86a2233051d3069f01ee4d0d6c5bc7';
