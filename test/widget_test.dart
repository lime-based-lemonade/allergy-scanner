import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:lime_based_application/pages/home.dart';
import 'package:lime_based_application/routes.dart';
import 'package:lime_based_application/pages/scanner.dart';
import 'package:lime_based_application/pages/allergen_selector.dart';
import 'package:lime_based_application/generated/l10n.dart';

void main() {
  setUpAll(() {
    HttpOverrides.global = null;
  });

  testWidgets('HomePage displays elements and responds to interactions', (WidgetTester tester) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: HomePage(),
            routes: {
              ApplicationRoutes.scanner: (context) => ScannerPage(),
              ApplicationRoutes.allergenSelector: (context) => AllergenSelectorPage(),
            },
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
          ),
        ),
      );

      expect(find.text('Allergen Scanner'), findsOneWidget);
      expect(find.text('My allergens'), findsOneWidget);
      expect(find.text('History'), findsOneWidget);
      expect(find.text('Scan'), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);

      await tester.tap(find.text('Scan'));
      await tester.pumpAndSettle();
      expect(find.byType(ScannerPage), findsOneWidget);

      Navigator.pop(tester.element(find.byType(ScannerPage)));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();
      expect(find.byType(AllergenSelectorPage), findsOneWidget);

      Navigator.pop(tester.element(find.byType(AllergenSelectorPage)));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.brightness_6));
      await tester.pump();
    });
  });

  testWidgets('AllergenSelectorPage displays elements and responds to interactions', (WidgetTester tester) async {
    await mockNetworkImagesFor(() async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Builder(
              builder: (BuildContext context) {
                return AllergenSelectorPage();
              },
            ),
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
          ),
        ),
      );

      await tester.pumpAndSettle(); 


      expect(find.byType(TextField), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);

      await tester.tap(find.byIcon(Icons.search));
      await tester.pump();

    });
  });
}
