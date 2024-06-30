// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(allergen) => "Allergen ${allergen} found in: ";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "AllergenScanner":
            MessageLookupByLibrary.simpleMessage("Allergen Scanner"),
        "Allergenfound": m0,
        "Allsafe": MessageLookupByLibrary.simpleMessage("All safe!"),
        "Enterallergenscommaseparated": MessageLookupByLibrary.simpleMessage(
            "Enter allergens (comma separated)"),
        "Enterfoodname":
            MessageLookupByLibrary.simpleMessage("Enter food name"),
        "Failedtofetchdatastatuscode": MessageLookupByLibrary.simpleMessage(
            "Failed to fetch data, status code: "),
        "FindIngredients":
            MessageLookupByLibrary.simpleMessage("Find Ingredients"),
        "History": MessageLookupByLibrary.simpleMessage("History"),
        "Myallergens": MessageLookupByLibrary.simpleMessage("My allergens"),
        "Networkerroroccurred":
            MessageLookupByLibrary.simpleMessage("Network error occurred: "),
        "Noallergensselected":
            MessageLookupByLibrary.simpleMessage("No allergens selected"),
        "Noingredientsfound": MessageLookupByLibrary.simpleMessage(
            "No ingredients found for this product"),
        "ProductName": MessageLookupByLibrary.simpleMessage("Product Name"),
        "Scan": MessageLookupByLibrary.simpleMessage("Scan"),
        "Search": MessageLookupByLibrary.simpleMessage("Search"),
        "SelectAllergens":
            MessageLookupByLibrary.simpleMessage("Select Allergens"),
        "Showless": MessageLookupByLibrary.simpleMessage("Show less"),
        "Showmore": MessageLookupByLibrary.simpleMessage("Show more"),
        "Warning": MessageLookupByLibrary.simpleMessage("Warning"),
        "WarningMessageAboutIngredient": MessageLookupByLibrary.simpleMessage(
            "Warning: The following ingredients match your allergens:"),
        "compatibleL": MessageLookupByLibrary.simpleMessage("compatible"),
        "compatibleU": MessageLookupByLibrary.simpleMessage("Compatible"),
        "product": MessageLookupByLibrary.simpleMessage("product"),
        "timestamp": MessageLookupByLibrary.simpleMessage("timestamp")
      };
}
