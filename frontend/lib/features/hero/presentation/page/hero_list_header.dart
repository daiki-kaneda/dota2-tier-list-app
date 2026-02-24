import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/hero/presentation/provider/heroes_provider.dart';

class HeroListHeader extends StatelessWidget {
  const HeroListHeader(this.createdAt, {super.key});

  final String createdAt;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [Text('集計日時: $createdAt'), RefreshButton()],
    );
  }
}

class RefreshButton extends ConsumerWidget {
  const RefreshButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        ref.invalidate(heroesProvider);
      },
      icon: Icon(Icons.refresh),
    );
  }
}
