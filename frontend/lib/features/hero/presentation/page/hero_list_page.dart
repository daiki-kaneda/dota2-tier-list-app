import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/hero/presentation/page/hero_list_header.dart';
import 'package:frontend/features/hero/presentation/page/hero_list_widget.dart';
import 'package:frontend/features/hero/presentation/provider/heroes_provider.dart';

class HeroListPage extends ConsumerWidget {
  const HeroListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final heroes = ref.watch(heroesProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Dota2 Tier List")),
      body: Builder(
        builder: (context) {
          return heroes.when(
            data: (heroes) {
              return Column(
                children: [
                  HeroListHeader(heroes.first.createdAt),
                  Expanded(child: HeroListWidget(heroes)),
                ],
              );
            },
            error: (e, s) => Center(
              child: SelectableText("予期せぬエラーが発生しました。$e,$s", textAlign: TextAlign.center),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
