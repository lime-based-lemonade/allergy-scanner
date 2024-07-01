// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
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
  String get localeName => 'ru';

  static String m0(allergen) => "Аллерген ${allergen} найден в: ";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "AllergenScanner":
            MessageLookupByLibrary.simpleMessage("Сканер Аллергенов"),
        "Allergenfound": m0,
        "Allsafe": MessageLookupByLibrary.simpleMessage("Безопасно!"),
        "Enterallergenscommaseparated": MessageLookupByLibrary.simpleMessage(
            "Введите аллергены (через запятую)"),
        "Enterfoodname":
            MessageLookupByLibrary.simpleMessage("Введите имя продукта"),
        "FindIngredients":
            MessageLookupByLibrary.simpleMessage("Найти Ингредиенты"),
        "History": MessageLookupByLibrary.simpleMessage("История"),
        "Myallergens": MessageLookupByLibrary.simpleMessage("Мои аллергены"),
        "Noallergensselected": MessageLookupByLibrary.simpleMessage(
            "Ни одного аллергена не выбрано"),
        "ProductName": MessageLookupByLibrary.simpleMessage("Имя продукта"),
        "Scan": MessageLookupByLibrary.simpleMessage("Сканировать"),
        "Search": MessageLookupByLibrary.simpleMessage("Поиск"),
        "SelectAllergens":
            MessageLookupByLibrary.simpleMessage("Выбор аллергенов"),
        "Showless": MessageLookupByLibrary.simpleMessage("Скрыть"),
        "Showmore": MessageLookupByLibrary.simpleMessage("Ещё"),
        "Warning": MessageLookupByLibrary.simpleMessage("Внимание"),
        "WarningMessageAboutIngredient": MessageLookupByLibrary.simpleMessage(
            "Внимание: Следующие ингредиенты совпадают с вашими аллергенами:"),
        "compatibleL": MessageLookupByLibrary.simpleMessage("безопасно"),
        "compatibleU": MessageLookupByLibrary.simpleMessage("Безопасно"),
        "product": MessageLookupByLibrary.simpleMessage("продукт"),
        "timestamp": MessageLookupByLibrary.simpleMessage("Дата и время")
      };
}
