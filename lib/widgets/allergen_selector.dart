import 'package:flutter/material.dart';

class SelectorList extends StatefulWidget {
  final String searchText;

  SelectorList({required this.searchText});

  @override
  AllergenListState createState() => AllergenListState();
}

class AllergenListState extends State<SelectorList> {
  List<String> allergens = [
    "Calcium", "Carbohydrate (net)", "Carbohydrate, by difference", "Cholesterol", "Energy",
    "Fatty acids, total monounsaturated", "Fatty acids, total polyunsaturated", "Fatty acids, total saturated",
    "Fatty acids, total trans", "Fiber, total dietary", "Folate, DFE", "Folate, food", "Folic acid", "Iron, Fe",
    "Magnesium", "Niacin", "Phosphorus, P", "Potassium, K", "Protein", "Riboflavin", "Sodium, Na", "Sugar alcohols",
    "Sugars, total", "Thiamin", "Total lipid (fat)", "Vitamin A, RAE", "Vitamin B-12", "Vitamin B-6",
    "Vitamin C, total ascorbic acid", "Vitamin D (D2 + D3)", "Vitamin E (alpha-tocopherol)", "Vitamin K (phylloquinone)",
    "Water", "Zinc, Zn"
  ];

  Set<String> _selectedAllergens = Set<String>();

  @override
  Widget build(BuildContext context) {
    List<String> filteredAllergens = allergens.where((allergen) {
      return allergen.toLowerCase().contains(widget.searchText);
    }).toList();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              dynamicChips(filteredAllergens),
            ],
          ),
        ],
      ),
    );
  }

  Widget dynamicChips(List<String> filteredAllergens) {
    return Wrap(
      spacing: 6.0,
      runSpacing: 6.0,
      children: filteredAllergens.map((allergen) {
        bool isSelected = _selectedAllergens.contains(allergen);
        return FilterChip(
          selected: isSelected,
          onSelected: (bool selected) {
            setState(() {
              if (selected) {
                _selectedAllergens.add(allergen);
              } else {
                _selectedAllergens.remove(allergen);
              }
            });
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
