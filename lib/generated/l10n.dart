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
  String get AllergenMilk {
    return Intl.message(
      'Milk',
      name: 'AllergenMilk',
      desc: '',
      args: [],
    );
  }

  /// `Cereals`
  String get AllergenCereals {
    return Intl.message(
      'Cereals',
      name: 'AllergenCereals',
      desc: '',
      args: [],
    );
  }

  /// `Eggs`
  String get AllergenEggs {
    return Intl.message(
      'Eggs',
      name: 'AllergenEggs',
      desc: '',
      args: [],
    );
  }

  /// `Fish`
  String get AllergenFish {
    return Intl.message(
      'Fish',
      name: 'AllergenFish',
      desc: '',
      args: [],
    );
  }

  /// `Gluten`
  String get AllergenGluten {
    return Intl.message(
      'Gluten',
      name: 'AllergenGluten',
      desc: '',
      args: [],
    );
  }

  /// `Nuts`
  String get AllergenNuts {
    return Intl.message(
      'Nuts',
      name: 'AllergenNuts',
      desc: '',
      args: [],
    );
  }

  /// `Peanuts`
  String get AllergenPeanuts {
    return Intl.message(
      'Peanuts',
      name: 'AllergenPeanuts',
      desc: '',
      args: [],
    );
  }

  /// `Soybeans`
  String get AllergenSoybeans {
    return Intl.message(
      'Soybeans',
      name: 'AllergenSoybeans',
      desc: '',
      args: [],
    );
  }

  /// `Wheat`
  String get AllergenWheat {
    return Intl.message(
      'Wheat',
      name: 'AllergenWheat',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get AllergenOther {
    return Intl.message(
      'Other',
      name: 'AllergenOther',
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
