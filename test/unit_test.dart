import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lime_based_application/pages/allergen_selector.dart';
import 'package:lime_based_application/pages/home.dart';
import 'package:lime_based_application/pages/scanner.dart';
import 'package:lime_based_application/routes.dart';
import 'package:lime_based_application/widgets/allergen_list.dart';
import 'package:lime_based_application/widgets/allergen_selector.dart';
import 'package:lime_based_application/widgets/history_table.dart';

void main() {
  testWidgets('AllergenSelectorPage displays search field and allergen list',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: AllergenSelectorPage(),
        ),
      ),
    );


    expect(find.byType(TextField), findsOneWidget);

    expect(find.byType(SelectorList), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'peanut');
    expect(find.text('peanut'), findsOneWidget);
  });

  testWidgets('HomePage displays allergens and history sections',
      (WidgetTester tester) async {
    final navigatorKey = GlobalKey<NavigatorState>();

    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          navigatorKey: navigatorKey,
          routes: {
            ApplicationRoutes.scanner: (context) => ScannerPage(),
            ApplicationRoutes.allergenSelector: (context) =>
                AllergenSelectorPage(),
          },
          home: HomePage(),
        ),
      ),
    );

    expect(find.text('My allergens'), findsOneWidget);
    expect(find.byType(AllergenList), findsOneWidget);

    expect(find.text('History'), findsOneWidget);
    expect(find.byType(ScanHistoryTable), findsOneWidget);

    final scanButton = find.text('Scan');
    expect(scanButton, findsOneWidget);
    await tester.tap(scanButton);
    await tester.pumpAndSettle();

    expect(find.byType(ScannerPage), findsOneWidget);

    navigatorKey.currentState!.pop();
    await tester.pumpAndSettle();

    final fab = find.byType(FloatingActionButton);
    expect(fab, findsOneWidget);
    await tester.tap(fab);
    await tester.pumpAndSettle();
    
    expect(find.byType(AllergenSelectorPage), findsOneWidget);
  });
}