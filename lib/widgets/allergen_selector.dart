import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lime_based_application/pages/allergen_selector.dart';

final allergensProvider = Provider<List<String>>((ref) {
  return [
    "Calcium", "Carbohydrate (net)", "Carbohydrate, by difference", "Cholesterol", "Energy",
    "Fatty acids, total monounsaturated", "Fatty acids, total polyunsaturated", "Fatty acids, total saturated",
    "Fatty acids, total trans", "Fiber, total dietary", "Folate, DFE", "Folate, food", "Folic acid", "Iron, Fe",
    "Magnesium", "Niacin", "Phosphorus, P", "Potassium, K", "Protein", "Riboflavin", "Sodium, Na", "Sugar alcohols",
    "Sugars, total", "Thiamin", "Total lipid (fat)", "Vitamin A, RAE", "Vitamin B-12", "Vitamin B-6",
    "Vitamin C, total ascorbic acid", "Vitamin D (D2 + D3)", "Vitamin E (alpha-tocopherol)", "Vitamin K (phylloquinone)",
    "Water", "Zinc, Zn"
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
