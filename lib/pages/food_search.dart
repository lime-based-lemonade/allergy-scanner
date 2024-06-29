import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FoodSearchScreen extends StatefulWidget {
  @override
  _FoodSearchScreenState createState() => _FoodSearchScreenState();
}

class _FoodSearchScreenState extends State<FoodSearchScreen> {
  final TextEditingController _foodController = TextEditingController();
  final TextEditingController _allergenController = TextEditingController();
  final String _appId = '19a79a7f';
  final String _appKey = '27976be65f8cf6a04d18861a6c4d1146';
  List<String> _ingredients = [];
  String _error = '';
  String _warning = '';

  Future<void> _fetchFoodData(String foodName) async {
    final url = Uri.https('api.edamam.com', '/api/food-database/v2/parser', {
      'ingr': foodName,
      'app_id': _appId,
      'app_key': _appKey,
    });

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          if (data['parsed'] != null && data['parsed'].isNotEmpty) {
            _ingredients = (data['parsed'][0]['food']['foodContentsLabel'] as String)
                .split(';')
                .map((ingredient) => ingredient.trim().toLowerCase())
                .toList();
            _error = '';
          } else if (data['hints'] != null && data['hints'].isNotEmpty) {
            _ingredients = (data['hints'][0]['food']['foodContentsLabel'] as String)
                .split(';')
                .map((ingredient) => ingredient.trim().toLowerCase())
                .toList();
            _error = '';
          } else {
            _error = 'No ingredients found for this product';
            _ingredients = [];
          }
          _checkForAllergens();
        });
      } else {
        setState(() {
          _error = 'Failed to fetch data, status code: ${response.statusCode}';
          _ingredients = [];
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Network error occurred: $e';
        _ingredients = [];
      });
    }
  }

  void _checkForAllergens() {
    List<String> allergens = _allergenController.text
        .split(',')
        .map((allergen) => allergen.trim().toLowerCase())
        .toList();

    Map<String, List<String>> allergenMatches = {};

    for (var allergen in allergens) {
      for (var ingredient in _ingredients) {
        if (ingredient.contains(allergen)) {
          if (!allergenMatches.containsKey(allergen)) {
            allergenMatches[allergen] = [];
          }
          allergenMatches[allergen]!.add(ingredient);
        }
      }
    }

    if (allergenMatches.isNotEmpty) {
      _warning = 'Warning: The following ingredients match your allergens:\n';
      allergenMatches.forEach((allergen, ingredients) {
        _warning += '- Allergen "$allergen" found in: ${ingredients.join(', ')}\n';
      });
    } else {
      _warning = 'All safe!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Ingredients'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _foodController,
              decoration: const InputDecoration(
                labelText: 'Enter food name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _allergenController,
              decoration: const InputDecoration(
                labelText: 'Enter allergens (comma separated)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _fetchFoodData(_foodController.text);
              },
              child: const Text('Search'),
            ),
            SizedBox(height: 16),
            _error.isNotEmpty
                ? Text(
                    _error,
                    style: TextStyle(color: Colors.red),
                  )
                : Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: _ingredients.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(_ingredients[index]),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          _warning,
                          style: TextStyle(
                            color: _warning.contains('Warning') ? Colors.red : Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
