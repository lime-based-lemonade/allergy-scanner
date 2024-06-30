import 'package:flutter/material.dart';
import 'package:lime_based_application/pages/allergen_selector.dart';
import 'package:lime_based_application/pages/food_search.dart';
import 'package:lime_based_application/pages/home.dart';
import 'package:lime_based_application/pages/scanner.dart';


/// Simple static data class containing information about app routes
class ApplicationRoutes {
  static const String home = '/';
  static const String allergenSelector = '/selector';
  static const String scanner = '/scanner';
  static const String foodSearch = '/food_search';

  /// Get the map of application routes with widget builder functions
  static  Map<String, WidgetBuilder> getRoutesMap() => {
    home: (context) => const HomePage(),

    scanner: (context) => const ScannerPage(),
    foodSearch: (context) => FoodSearchScreen(),

    allergenSelector: (context) => AllergenSelectorPage(),
    scanner: (context) => const ScannerPage()
  };
}
