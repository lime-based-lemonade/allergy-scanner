import 'package:shared_preferences/shared_preferences.dart';

const List<String> allergens = [];

class LocalStorageService {
  static const String _keyHistory = "history";
  static const String _keyAllergens = "allergens";

  static Future<String> getAllergens() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(_keyAllergens) ?? "[]";
  }

  static Future<void> setAllergens(String allergens) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setString(_keyAllergens, allergens);
  }

  static Future<String> getHistory() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(_keyHistory) ?? "[]";
  }

  static Future<void> setHistory(String history) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setString(_keyHistory, history);
  }
}
