import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lime_based_application/providers/theme_provider.dart';
import 'package:lime_based_application/routes.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeNotifierProvider);

    return MaterialApp(
      routes: ApplicationRoutes.getRoutesMap(),
      initialRoute: ApplicationRoutes.home,
      theme: theme,
    );
  }
}
