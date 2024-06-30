import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lime_based_application/pages/allergen_selector.dart';

final allergensProvider = Provider<List<String>>((ref) {
  return [
    "Milk", "Eggs", "Fish", "Crustacean shellfish", "Tree nuts",
    "Peanuts", "Wheat", "Soybeans", "Sesame", "Mustard", "Sulfites",
    "Lupin", "Mollusks", "Celery", "Sulphur dioxide", "Gluten", "Corn",
    "Kiwi", "Pineapple", "Avocado", "Banana", "Coconut", "Strawberries",
    "Raspberries", "Blueberries", "Blackberries", "Mango", "Peaches", "Plums",
    "Apples", "Pears", "Cherries", "Grapes", "Oranges", "Lemons", "Limes", "Grapefruit",
    "Tomatoes", "Potatoes", "Carrots", "Cucumbers", "Bell peppers", "Spinach", "Broccoli",
    "Cauliflower", "Onions", "Garlic", "Almonds", "Cashews", "Walnuts", "Pistachios"
  ];
});

final selectedAllergensProvider = StateProvider<Set<String>>((ref) {
  return <String>{};
});

class SelectorList extends ConsumerWidget {
  final String searchText;

  SelectorList({required this.searchText});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allergens = ref.watch(allergensProvider);
    final selectedAllergens = ref.watch(selectedAllergensProvider);

    List<String> filteredAllergens = allergens.where((allergen) {
      return allergen.toLowerCase().contains(searchText.toLowerCase());
    }).toList();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              dynamicChips(context, ref, filteredAllergens, selectedAllergens),
            ],
          ),
        ],
      ),
    );
  }

  Widget dynamicChips(BuildContext context, WidgetRef ref, List<String> filteredAllergens, Set<String> selectedAllergens) {
    return Wrap(
      spacing: 6.0,
      runSpacing: 6.0,
      children: filteredAllergens.map((allergen) {
        bool isSelected = selectedAllergens.contains(allergen);
        return FilterChip(
          selected: isSelected,
          onSelected: (bool selected) {
            final newSelectedAllergens = Set<String>.from(selectedAllergens);
            if (selected) {
              newSelectedAllergens.add(allergen);
            } else {
              newSelectedAllergens.remove(allergen);
            }
            ref.read(selectedAllergensProvider.notifier).state = newSelectedAllergens;
          },
          backgroundColor: isSelected
              ? Color(0xFFE8DEF8)
              : Theme.of(context).colorScheme.surface,
          label: Text(allergen),
        );
      }).toList(),
    );
  }
}
