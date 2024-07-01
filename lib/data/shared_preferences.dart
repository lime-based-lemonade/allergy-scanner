// TODO: Add a shared preferences provider
// TODO: Add methods to retrieve history and list of allergens from the provider
// TODO: Add method to add a new history item to the provider
// TODO: Add method to set the new list of allergens to the provider

import 'package:flutter_riverpod/flutter_riverpod.dart';

const List<String> allergens = [];

class AllergenListStateNotifier extends StateNotifier<List<String>?> {
  AllergenListStateNotifier([super.state]);

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

    // TODO: Save to shared preferences
  }

  void removeAllergen(String allergen) {
    if (state?.contains(allergen) != true) {
      return;
    }

    state!.remove(allergen);

    // TODO: Save to shared preferences
  }

  void _ensureState() {
    state ??= List.empty();
  }
}
