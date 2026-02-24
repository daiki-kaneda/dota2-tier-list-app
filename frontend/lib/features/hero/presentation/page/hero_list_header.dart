import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/hero/presentation/provider/heroes_provider.dart';
import 'package:intl/intl.dart';

class HeroListHeader extends StatelessWidget {
  const HeroListHeader(this.createdAt, {super.key});

  final String createdAt;

  @override
  Widget build(BuildContext context) {
    final createdAtDateTime = DateTime.parse(createdAt);
    final formatter = DateFormat("yyyy/MM/dd HH:mm:ss");
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [SelectableText('集計日時: ${formatter.format(createdAtDateTime.toLocal())}'), RefreshButton()],
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
