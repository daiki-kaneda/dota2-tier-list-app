import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/hero/presentation/page/hero_list_page.dart';

void main() {
  runApp(ProviderScope(child: const Dota2TierApp()));
}

class Dota2TierApp extends StatelessWidget {
  const Dota2TierApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: HeroListPage()
    );
  }
}
