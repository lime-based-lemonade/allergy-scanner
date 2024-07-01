import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lime_based_application/data/local_storage.dart';

final selectedAllergensProvider =
    StateNotifierProvider<AllergenListStateNotifier, List<String>?>(
        (ref) => AllergenListStateNotifier());

class AllergenListStateNotifier extends StateNotifier<List<String>?> {
  AllergenListStateNotifier() : super(null) {
    _loadAllergens();
  }

  Future<void> _loadAllergens() async {
    String allergensJson = await LocalStorageService.getAllergens();
    List<String> allergens = List<String>.from(json.decode(allergensJson));
    state = allergens;
  }

  List<String> getNonNullState() {
    _ensureState();
    return state!;
  }

  void addAllergen(String allergen) {
    if (state?.contains(allergen) == true) {
      return;
    }

    _ensureState();
    state!.add(allergen);
    _saveAllergens();
  }

  void removeAllergen(String allergen) {
    if (state?.contains(allergen) != true) {
      return;
    }

    state!.remove(allergen);
    _saveAllergens();
  }

  // TODO: Remove this in the future, widgets should update allergens on at a time
  void setAllergens(List<String> allergens) {
    state = allergens;
  }

  void _ensureState() {
    state ??= List.empty();
  }

  Future<void> _saveAllergens() async {
    String allergensJson = json.encode(state);
    await LocalStorageService.setAllergens(allergensJson);
  }
}
