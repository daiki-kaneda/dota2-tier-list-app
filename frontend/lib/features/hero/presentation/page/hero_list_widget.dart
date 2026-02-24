import 'package:flutter/material.dart' hide Hero;
import 'package:frontend/features/hero/domain/entity/hero.dart';

class HeroListWidget extends StatelessWidget {
  const HeroListWidget(this.heroes, {super.key});

  final List<Hero> heroes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return HeroListTile(heroes[index]);
      },
      itemCount: heroes.length,
    );
  }
}

class HeroListTile extends StatelessWidget {
  const HeroListTile(this.hero, {super.key});

  final Hero hero;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(hero.name),
      subtitle: Text("ピック数: ${hero.picks},勝利数: ${hero.wins},勝率: ${hero.winRate}"),
    );
  }
}
