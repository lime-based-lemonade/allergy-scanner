// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `timestamp`
  String get timestamp {
    return Intl.message(
      'timestamp',
      name: 'timestamp',
      desc: '',
      args: [],
    );
  }

  /// `product`
  String get product {
    return Intl.message(
      'product',
      name: 'product',
      desc: '',
      args: [],
    );
  }

  /// `Compatible`
  String get compatibleU {
    return Intl.message(
      'Compatible',
      name: 'compatibleU',
      desc: '',
      args: [],
    );
  }

  /// `Product Name`
  String get ProductName {
    return Intl.message(
      'Product Name',
      name: 'ProductName',
      desc: '',
      args: [],
    );
  }

  /// `compatible`
  String get compatibleL {
    return Intl.message(
      'compatible',
      name: 'compatibleL',
      desc: '',
      args: [],
    );
  }

  /// `No allergens selected`
  String get Noallergensselected {
    return Intl.message(
      'No allergens selected',
      name: 'Noallergensselected',
      desc: '',
      args: [],
    );
  }

  /// `Show less`
  String get Showless {
    return Intl.message(
      'Show less',
      name: 'Showless',
      desc: '',
      args: [],
    );
  }

  /// `Show more`
  String get Showmore {
    return Intl.message(
      'Show more',
      name: 'Showmore',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get History {
    return Intl.message(
      'History',
      name: 'History',
      desc: '',
      args: [],
    );
  }

  /// `Scan`
  String get Scan {
    return Intl.message(
      'Scan',
      name: 'Scan',
      desc: '',
      args: [],
    );
  }

  /// `Allergen Scanner`
  String get AllergenScanner {
    return Intl.message(
      'Allergen Scanner',
      name: 'AllergenScanner',
      desc: '',
      args: [],
    );
  }

  /// `My allergens`
  String get Myallergens {
    return Intl.message(
      'My allergens',
      name: 'Myallergens',
      desc: '',
      args: [],
    );
  }

  /// `Warning: The following ingredients match your allergens:`
  String get WarningMessageAboutIngredient {
    return Intl.message(
      'Warning: The following ingredients match your allergens:',
      name: 'WarningMessageAboutIngredient',
      desc: '',
      args: [],
    );
  }

  /// `Allergen {allergen} found in: `
  String Allergenfound(Object allergen) {
    return Intl.message(
      'Allergen $allergen found in: ',
      name: 'Allergenfound',
      desc: '',
      args: [allergen],
    );
  }

  /// `All safe!`
  String get Allsafe {
    return Intl.message(
      'All safe!',
      name: 'Allsafe',
      desc: '',
      args: [],
    );
  }

  /// `Find Ingredients`
  String get FindIngredients {
    return Intl.message(
      'Find Ingredients',
      name: 'FindIngredients',
      desc: '',
      args: [],
    );
  }

  /// `Enter food name`
  String get Enterfoodname {
    return Intl.message(
      'Enter food name',
      name: 'Enterfoodname',
      desc: '',
      args: [],
    );
  }

  /// `Enter allergens (comma separated)`
  String get Enterallergenscommaseparated {
    return Intl.message(
      'Enter allergens (comma separated)',
      name: 'Enterallergenscommaseparated',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get Search {
    return Intl.message(
      'Search',
      name: 'Search',
      desc: '',
      args: [],
    );
  }

  /// `Warning`
  String get Warning {
    return Intl.message(
      'Warning',
      name: 'Warning',
      desc: '',
      args: [],
    );
  }

  /// `Select Allergens`
  String get SelectAllergens {
    return Intl.message(
      'Select Allergens',
      name: 'SelectAllergens',
      desc: '',
      args: [],
    );
  }

  /// `Network error occurred: `
  String get Networkerroroccurred {
    return Intl.message(
      'Network error occurred: ',
      name: 'Networkerroroccurred',
      desc: '',
      args: [],
    );
  }

  /// `Failed to fetch data, status code: `
  String get Failedtofetchdatastatuscode {
    return Intl.message(
      'Failed to fetch data, status code: ',
      name: 'Failedtofetchdatastatuscode',
      desc: '',
      args: [],
    );
  }

  /// `No ingredients found for this product`
  String get Noingredientsfound {
    return Intl.message(
      'No ingredients found for this product',
      name: 'Noingredientsfound',
      desc: '',
      args: [],
    );
  }

  /// `Milk`
  String get Milk {
    return Intl.message(
      'Milk',
      name: 'Milk',
      desc: '',
      args: [],
    );
  }

  /// `Eggs`
  String get Eggs {
    return Intl.message(
      'Eggs',
      name: 'Eggs',
      desc: '',
      args: [],
    );
  }

  /// `Fish`
  String get Fish {
    return Intl.message(
      'Fish',
      name: 'Fish',
      desc: '',
      args: [],
    );
  }

  /// `Crustacean shellfish`
  String get Crustacean_shellfish {
    return Intl.message(
      'Crustacean shellfish',
      name: 'Crustacean_shellfish',
      desc: '',
      args: [],
    );
  }

  /// `Tree nuts`
  String get Tree_nuts {
    return Intl.message(
      'Tree nuts',
      name: 'Tree_nuts',
      desc: '',
      args: [],
    );
  }

  /// `Peanuts`
  String get Peanuts {
    return Intl.message(
      'Peanuts',
      name: 'Peanuts',
      desc: '',
      args: [],
    );
  }

  /// `Wheat`
  String get Wheat {
    return Intl.message(
      'Wheat',
      name: 'Wheat',
      desc: '',
      args: [],
    );
  }

  /// `Soybeans`
  String get Soybeans {
    return Intl.message(
      'Soybeans',
      name: 'Soybeans',
      desc: '',
      args: [],
    );
  }

  /// `Sesame`
  String get Sesame {
    return Intl.message(
      'Sesame',
      name: 'Sesame',
      desc: '',
      args: [],
    );
  }

  /// `Mustard`
  String get Mustard {
    return Intl.message(
      'Mustard',
      name: 'Mustard',
      desc: '',
      args: [],
    );
  }

  /// `Sulfites`
  String get Sulfites {
    return Intl.message(
      'Sulfites',
      name: 'Sulfites',
      desc: '',
      args: [],
    );
  }

  /// `Lupin`
  String get Lupin {
    return Intl.message(
      'Lupin',
      name: 'Lupin',
      desc: '',
      args: [],
    );
  }

  /// `Mollusks`
  String get Mollusks {
    return Intl.message(
      'Mollusks',
      name: 'Mollusks',
      desc: '',
      args: [],
    );
  }

  /// `Celery`
  String get Celery {
    return Intl.message(
      'Celery',
      name: 'Celery',
      desc: '',
      args: [],
    );
  }

  /// `Sulphur dioxide`
  String get Sulphur_dioxide {
    return Intl.message(
      'Sulphur dioxide',
      name: 'Sulphur_dioxide',
      desc: '',
      args: [],
    );
  }

  /// `Gluten`
  String get Gluten {
    return Intl.message(
      'Gluten',
      name: 'Gluten',
      desc: '',
      args: [],
    );
  }

  /// `Corn`
  String get Corn {
    return Intl.message(
      'Corn',
      name: 'Corn',
      desc: '',
      args: [],
    );
  }

  /// `Kiwi`
  String get Kiwi {
    return Intl.message(
      'Kiwi',
      name: 'Kiwi',
      desc: '',
      args: [],
    );
  }

  /// `Pineapple`
  String get Pineapple {
    return Intl.message(
      'Pineapple',
      name: 'Pineapple',
      desc: '',
      args: [],
    );
  }

  /// `Avocado`
  String get Avocado {
    return Intl.message(
      'Avocado',
      name: 'Avocado',
      desc: '',
      args: [],
    );
  }

  /// `Banana`
  String get Banana {
    return Intl.message(
      'Banana',
      name: 'Banana',
      desc: '',
      args: [],
    );
  }

  /// `Coconut`
  String get Coconut {
    return Intl.message(
      'Coconut',
      name: 'Coconut',
      desc: '',
      args: [],
    );
  }

  /// `Strawberries`
  String get Strawberries {
    return Intl.message(
      'Strawberries',
      name: 'Strawberries',
      desc: '',
      args: [],
    );
  }

  /// `Raspberries`
  String get Raspberries {
    return Intl.message(
      'Raspberries',
      name: 'Raspberries',
      desc: '',
      args: [],
    );
  }

  /// `Blueberries`
  String get Blueberries {
    return Intl.message(
      'Blueberries',
      name: 'Blueberries',
      desc: '',
      args: [],
    );
  }

  /// `Blackberries`
  String get Blackberries {
    return Intl.message(
      'Blackberries',
      name: 'Blackberries',
      desc: '',
      args: [],
    );
  }

  /// `Mango`
  String get Mango {
    return Intl.message(
      'Mango',
      name: 'Mango',
      desc: '',
      args: [],
    );
  }

  /// `Peaches`
  String get Peaches {
    return Intl.message(
      'Peaches',
      name: 'Peaches',
      desc: '',
      args: [],
    );
  }

  /// `Plums`
  String get Plums {
    return Intl.message(
      'Plums',
      name: 'Plums',
      desc: '',
      args: [],
    );
  }

  /// `Apples`
  String get Apples {
    return Intl.message(
      'Apples',
      name: 'Apples',
      desc: '',
      args: [],
    );
  }

  /// `Pears`
  String get Pears {
    return Intl.message(
      'Pears',
      name: 'Pears',
      desc: '',
      args: [],
    );
  }

  /// `Cherries`
  String get Cherries {
    return Intl.message(
      'Cherries',
      name: 'Cherries',
      desc: '',
      args: [],
    );
  }

  /// `Grapes`
  String get Grapes {
    return Intl.message(
      'Grapes',
      name: 'Grapes',
      desc: '',
      args: [],
    );
  }

  /// `Oranges`
  String get Oranges {
    return Intl.message(
      'Oranges',
      name: 'Oranges',
      desc: '',
      args: [],
    );
  }

  /// `Lemons`
  String get Lemons {
    return Intl.message(
      'Lemons',
      name: 'Lemons',
      desc: '',
      args: [],
    );
  }

  /// `Limes`
  String get Limes {
    return Intl.message(
      'Limes',
      name: 'Limes',
      desc: '',
      args: [],
    );
  }

  /// `Grapefruit`
  String get Grapefruit {
    return Intl.message(
      'Grapefruit',
      name: 'Grapefruit',
      desc: '',
      args: [],
    );
  }

  /// `Tomatoes`
  String get Tomatoes {
    return Intl.message(
      'Tomatoes',
      name: 'Tomatoes',
      desc: '',
      args: [],
    );
  }

  /// `Potatoes`
  String get Potatoes {
    return Intl.message(
      'Potatoes',
      name: 'Potatoes',
      desc: '',
      args: [],
    );
  }

  /// `Carrots`
  String get Carrots {
    return Intl.message(
      'Carrots',
      name: 'Carrots',
      desc: '',
      args: [],
    );
  }

  /// `Cucumbers`
  String get Cucumbers {
    return Intl.message(
      'Cucumbers',
      name: 'Cucumbers',
      desc: '',
      args: [],
    );
  }

  /// `Bell peppers`
  String get Bell_peppers {
    return Intl.message(
      'Bell peppers',
      name: 'Bell_peppers',
      desc: '',
      args: [],
    );
  }

  /// `Spinach`
  String get Spinach {
    return Intl.message(
      'Spinach',
      name: 'Spinach',
      desc: '',
      args: [],
    );
  }

  /// `Broccoli`
  String get Broccoli {
    return Intl.message(
      'Broccoli',
      name: 'Broccoli',
      desc: '',
      args: [],
    );
  }

  /// `Cauliflower`
  String get Cauliflower {
    return Intl.message(
      'Cauliflower',
      name: 'Cauliflower',
      desc: '',
      args: [],
    );
  }

  /// `Onions`
  String get Onions {
    return Intl.message(
      'Onions',
      name: 'Onions',
      desc: '',
      args: [],
    );
  }

  /// `Garlic`
  String get Garlic {
    return Intl.message(
      'Garlic',
      name: 'Garlic',
      desc: '',
      args: [],
    );
  }

  /// `Almonds`
  String get Almonds {
    return Intl.message(
      'Almonds',
      name: 'Almonds',
      desc: '',
      args: [],
    );
  }

  /// `Cashews`
  String get Cashews {
    return Intl.message(
      'Cashews',
      name: 'Cashews',
      desc: '',
      args: [],
    );
  }

  /// `Walnuts`
  String get Walnuts {
    return Intl.message(
      'Walnuts',
      name: 'Walnuts',
      desc: '',
      args: [],
    );
  }

  /// `Pistachios`
  String get Pistachios {
    return Intl.message(
      'Pistachios',
      name: 'Pistachios',
      desc: '',
      args: [],
    );
  }

  /// `Crustaceans`
  String get Crustaceans {
    return Intl.message(
      'Crustaceans',
      name: 'Crustaceans',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
