import 'package:flutter/material.dart' hide Hero;
import 'package:frontend/features/hero/domain/entity/hero.dart';
import 'package:frontend/features/hero/presentation/extension/tier_color.dart';

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
      leading: Container(width: 10,color: hero.tier.color,),
      title: Text(hero.name),
      subtitle: Text("勝率: ${hero.winRate}"),
    );
  }
}
