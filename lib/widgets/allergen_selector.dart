import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lime_based_application/data/allergens_provider.dart';
import 'package:lime_based_application/generated/l10n.dart';

Provider<List<String>> getAllergenName(BuildContext context) {
  final s = S.of(context);
  final allergensProvider = Provider<List<String>>((ref) {
    return [
      s.Milk,
      s.Eggs,
      s.Fish,
      s.Crustacean_shellfish,
      s.Tree_nuts,
      s.Peanuts,
      s.Wheat,
      s.Soybeans,
      s.Sesame,
      s.Mustard,
      s.Sulfites,
      s.Lupin,
      s.Mollusks,
      s.Celery,
      s.Sulphur_dioxide,
      s.Gluten,
      s.Corn,
      s.Kiwi,
      s.Pineapple,
      s.Avocado,
      s.Banana,
      s.Coconut,
      s.Strawberries,
      s.Raspberries,
      s.Blueberries,
      s.Blackberries,
      s.Mango,
      s.Peaches,
      s.Plums,
      s.Apples,
      s.Pears,
      s.Cherries,
      s.Grapes,
      s.Oranges,
      s.Lemons,
      s.Limes,
      s.Grapefruit,
      s.Tomatoes,
      s.Potatoes,
      s.Carrots,
      s.Cucumbers,
      s.Bell_peppers,
      s.Spinach,
      s.Broccoli,
      s.Cauliflower,
      s.Onions,
      s.Garlic,
      s.Almonds,
      s.Cashews,
      s.Walnuts,
      s.Pistachios,
      s.Crustaceans,
    ];
  });
  return allergensProvider;
}

class SelectorList extends ConsumerWidget {
  final String searchText;

  const SelectorList({super.key, required this.searchText});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allergens = ref.watch(getAllergenName(context));
    final selectedAllergens = ref.watch(selectedAllergensProvider) ?? [];

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

  Widget dynamicChips(BuildContext context, WidgetRef ref,
      List<String> filteredAllergens, List<String> selectedAllergens) {
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
            ref
                .read(selectedAllergensProvider.notifier)
                .setAllergens(newSelectedAllergens.toList());
          },
          backgroundColor: isSelected
              ? const Color(0xFFE8DEF8)
              : Theme.of(context).colorScheme.surface,
          label: Text(allergen),
        );
      }).toList(),
    );
  }
}
