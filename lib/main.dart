import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lime_based_application/generated/l10n.dart';
import 'package:lime_based_application/routes.dart';

void main() {
  // Run application with ProviderScope for Riverpod state management
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      routes: ApplicationRoutes.getRoutesMap(),
      initialRoute: ApplicationRoutes.home,
      // We don't have much time to play with theming. Use Material 3.
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 149, 0, 255)),
          useMaterial3: true),
    );
  }
}