import 'package:flutter/material.dart';

/// Horizontally scrollable list of allergens represented with Material chips.
class AllergenList extends StatefulWidget {
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
    "Peanuts",
    "Shellfish",
    "Milk",
    "Eggs",
    "Wheat",
    "Soy",
    "Fish",
    "Tree nuts",
    "Sesame",
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

  bool _showAll = false;
  final int _maxRows = 12;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          dynamicChips(),
          if (allergens.length > _maxRows)
            TextButton(
              onPressed: () {
                setState(() {
                  _showAll = !_showAll;
                });
              },
              child: Text(_showAll ? 'Show Less' : 'Show More'),
            ),
        ],
      ),
    );
  }

  Widget dynamicChips() {
    int chipsToShow = _showAll ? allergens.length : (_maxRows > allergens.length ? allergens.length : _maxRows);

    return Wrap(
      spacing: 6.0,
      runSpacing: 6.0,
      children: List<Widget>.generate(chipsToShow, (int index) {
        return InkWell(
          onTap: () {
            // Handle tap event
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Tapped on ${allergens[index]}')),
            );
          },
          child: Chip(
            label: Text(allergens[index]),
          ),
        );
      }),
    );
  }
}
