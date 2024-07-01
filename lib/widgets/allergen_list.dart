import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lime_based_application/widgets/allergen_selector.dart'; // Ensure this imports the SelectorList with providers
import 'package:lime_based_application/generated/l10n.dart';

class AllergenList extends ConsumerStatefulWidget {
  @override
  _AllergenListState createState() => _AllergenListState();
}

class _AllergenListState extends ConsumerState<AllergenList> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final selectedAllergens = ref.watch(selectedAllergensProvider);
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    
    final buttonStyle = TextButton.styleFrom(
      foregroundColor: isDarkMode ? Colors.white : Colors.black, textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (selectedAllergens.isEmpty)
            Text(S.of(context).Noallergensselected)
          else
            dynamicChips(selectedAllergens),
          if (selectedAllergens.length > 10)
            TextButton(
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Text(_isExpanded ? S.of(context).Showless : S.of(context).Showmore),
            ),
        ],
      ),
    );
  }

  Widget dynamicChips(Set<String> selectedAllergens) {
    final allergensToShow = _isExpanded
        ? selectedAllergens
        : selectedAllergens.take(10);

    return Wrap(
      spacing: 6.0,
      runSpacing: 6.0,
      children: allergensToShow.map((allergen) {
        return Chip(
          label: Text(allergen),
        );
      }).toList(),
    );
  }
}
