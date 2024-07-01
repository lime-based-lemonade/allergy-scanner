import 'package:flutter/material.dart';
import 'package:lime_based_application/pages/allergen_selector.dart';
import 'package:lime_based_application/pages/food_search.dart';
import 'package:lime_based_application/pages/home.dart';


/// Simple static data class containing information about app routes
class ApplicationRoutes {
  static const String home = '/';
  static const String allergenSelector = '/selector';
  static const String scanner = '/scanner';
  static const String foodSearch = '/food_search';

  static  Map<String, WidgetBuilder> getRoutesMap() => {
    home: (context) => const HomePage(),
    foodSearch: (context) => FoodSearchScreen(),
    allergenSelector: (context) => AllergenSelectorPage(),
  };
}
