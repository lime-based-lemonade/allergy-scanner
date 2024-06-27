import 'package:flutter/material.dart';
import 'package:lime_based_application/pages/allergen_selector.dart';
import 'package:lime_based_application/pages/home.dart';
import 'package:lime_based_application/pages/scanner.dart';

/// Simple static data class containing information about app routes
class ApplicationRoutes {
  static const String home = '/';
  static const String allergenSelector = '/selector';
  static const String scanner = '/scanner';

  /// Get the map of application routes with widget builder functions
  static  Map<String, WidgetBuilder> getRoutesMap() => {
    home: (context) => const HomePage(),
    allergenSelector: (context) => AllergenSelectorPage(allergens: ['Apples', 'edjc', 'snjdj']),
    scanner: (context) => const ScannerPage()
  };
}
