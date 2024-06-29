import 'package:flutter/material.dart';

/// Horizontally scrollable list of allergens represented with Material chips.
class AllergenList extends StatefulWidget {
  // Implement the widget
  // Useful link https://api.flutter.dev/flutter/material/Chip-class.html

  const AllergenList({super.key});

  @override
  State<AllergenList> createState() => _AllergenListState();
}

class _AllergenListState extends State<AllergenList> {
   List<String> allergens = [
    "Peanuts",
    "Shellfish",
    "Milk",
    "Eggs",
    "Wheat",
    "Soy",
    "Fish",
    "Tree nuts",
    "Sesame",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: dynamicChips(),
    );
  }

  Widget dynamicChips() {
    return Wrap(
      spacing: 6.0,
      runSpacing: 6.0,
      children: List<Widget>.generate(allergens.length, (int index) {
        return InkWell(
          onTap: () {
            // Handle tap event
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Tapped on ${allergens[index]}')),
            );
          },
          child: Chip(
            label: Text(allergens[index]),
            onDeleted: () {
              setState(() {
                allergens.removeAt(index);
              });
            },
          ),
        );
      }),
    );
  }
}
