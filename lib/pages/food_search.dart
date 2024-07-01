import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lime_based_application/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FoodSearchScreen extends StatefulWidget {
  final Set<String> allergens;

  const FoodSearchScreen({super.key, required this.allergens});

  @override
  _FoodSearchScreenState createState() => _FoodSearchScreenState();
}

class _FoodSearchScreenState extends State<FoodSearchScreen> {
  final TextEditingController _foodController = TextEditingController();
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
          FoodData foodData = FoodData.fromJson(data);
          if (foodData.ingredients.isNotEmpty) {
            _ingredients = foodData.ingredients;
            _error = '';
          } else {
            _error = S.of(context).Noingredientsfound;
            _ingredients = [];
          }
          _checkForAllergens();
        });
      } else {
        setState(() {
          _error =
              '${S.of(context).Failedtofetchdatastatuscode}${response.statusCode}';
          _ingredients = [];
        });
      }
    } catch (e) {
      setState(() {
        _error = '${S.of(context).Networkerroroccurred}$e';
        _ingredients = [];
      });
    }
  }

  void _checkForAllergens() {
    Map<String, List<String>> allergenMatches = {};

    for (var allergen in widget.allergens) {
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
      _warning = '${S.of(context).WarningMessageAboutIngredient}\n';
      allergenMatches.forEach((allergen, ingredients) {
        _warning +=
            '- ${S.of(context).Allergenfound(allergen)}${ingredients.join(', ')}\n';
      });
    } else {
      _warning = S.of(context).Allsafe;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).FindIngredients),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _foodController,
              decoration: InputDecoration(
                labelText: S.of(context).Enterfoodname,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              // controller: _allergenController,
              decoration: InputDecoration(
                labelText: S.of(context).Enterallergenscommaseparated,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _fetchFoodData(_foodController.text);
              },
              child: Text(S.of(context).Search),
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
                            color: _warning.contains(S.of(context).Warning)
                                ? Colors.red
                                : Colors.green,
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

class FoodData {
  final List<String> ingredients;

  FoodData({required this.ingredients});

  factory FoodData.fromJson(Map<String, dynamic> json) {
    List<String> ingredients = [];
    if (json['parsed'] != null && json['parsed'].isNotEmpty) {
      ingredients = (json['parsed'][0]['food']['foodContentsLabel'] as String)
          .split(';')
          .map((ingredient) => ingredient.trim().toLowerCase())
          .toList();
    } else if (json['hints'] != null && json['hints'].isNotEmpty) {
      ingredients = (json['hints'][0]['food']['foodContentsLabel'] as String)
          .split(';')
          .map((ingredient) => ingredient.trim().toLowerCase())
          .toList();
    }
    return FoodData(ingredients: ingredients);
  }
}
