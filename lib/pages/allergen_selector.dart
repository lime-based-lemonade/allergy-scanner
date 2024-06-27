import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllergenProvider extends ChangeNotifier {
  final Set<String> _selectedAllergens = <String>{};

  Set<String> get selectedAllergens => _selectedAllergens;

  void toggleAllergen(String allergen) {
    if (_selectedAllergens.contains(allergen)) {
      _selectedAllergens.remove(allergen);
    } else {
      _selectedAllergens.add(allergen);
    }
    notifyListeners();
  }
}

class AllergenSelectorPage extends ConsumerWidget {
  final List<String> allergens;

  final allergenProvider = ChangeNotifierProvider((ref) => AllergenProvider());

  AllergenSelectorPage({super.key, required this.allergens});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedAllergens = ref.watch<Set<String>>(allergenProvider as ProviderListenable<Set<String>>);

    return Scaffold(
      appBar: AppBar(
        title: Text('Allergen Selector'),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 0, 0),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: allergens.length,
          itemBuilder: (context, index) {
            final allergen = allergens[index];
            final isSelected = selectedAllergens.contains(allergen);

            return GestureDetector(
              onTap: () {
                ref.read(allergenProvider).toggleAllergen(allergen);
              },
              child: Container(
                margin: EdgeInsets.only(right: 16.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected
                      ? Colors.grey[700]
                      : Colors.grey[300],
                ),
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    allergen,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
