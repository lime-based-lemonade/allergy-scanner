import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lime_based_application/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_scanner/mobile_scanner.dart';

enum _DataFetchingState {
  Idle,
  Fetching,
  Done
}

class FoodSearchScreen extends StatefulWidget {
  final List<String> allergens = ['milk', 'soy', 'bean'];

  FoodSearchScreen({super.key});

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
  Barcode? _barcode;
  _DataFetchingState _fetchingState = _DataFetchingState.Idle;

  Future<void> _fetchFoodData(String foodName) async {
    print('Fetching data about $foodName');

    final url = Uri.https('api.edamam.com', '/api/food-database/v2/parser', {
      'upc': foodName,
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

  Widget _buildBarcode(Barcode? value) {
    if (value == null) {
      return const Text(
        'Scan something!',
        overflow: TextOverflow.fade,
        style: TextStyle(color: Colors.white),
      );
    }

    return Text(
      value.displayValue ?? 'No display value.',
      overflow: TextOverflow.fade,
      style: const TextStyle(color: Colors.white),
    );
  }

  void _handleBarcode(BarcodeCapture barcodes) {
    if (mounted) {
      setState(() {
        _barcode = barcodes.barcodes.firstOrNull;
        print('barcode state updated ${barcodes.barcodes.firstOrNull?.displayValue}');
        if (_barcode?.displayValue != null) {
          _fetchFoodData(_barcode!.displayValue!);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple scanner')),
      backgroundColor: Colors.black,
      body: 
    );
  }

    Widget _buildBody() {
      switch (_fetchingState) {
        case _DataFetchingState.Idle:
          return _buildWidgetIdle();
      }
    }

    Widget _buildWidgetIdle() {
      return Stack(
        children: [
          MobileScanner(
            onDetect: _handleBarcode,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.bottomCenter,
              height: 100,
              color: Colors.black.withOpacity(0.4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: Center(
                        // child: _buildBarcode(_barcode),))
                          child: Text(_barcode == null
                              ? 'barcode is null'
                              : 'Error: $_error \n Warning: $_warning\nIngredients: ${_ingredients.toString()}'))),
                ],
              ),
            ),
          ),
        ],
      );
    }

    Widget _buildWidgetFetching() {
      return Placeholder();
    }

    Widget _buildWidgetDone() {
      return Placeholder();
    }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text(S.of(context).FindIngredients),
  //     ),
  //     body: Padding(
  //       padding: const EdgeInsets.all(16.0),
  //       child: Column(
  //         children: [
  //           TextField(
  //             controller: _foodController,
  //             decoration: InputDecoration(
  //               labelText: S.of(context).Enterfoodname,
  //               border: OutlineInputBorder(),
  //             ),
  //           ),
  //           SizedBox(height: 16),
  //           TextField(
  //             // controller: _allergenController,
  //             decoration: InputDecoration(
  //               labelText: S.of(context).Enterallergenscommaseparated,
  //               border: OutlineInputBorder(),
  //             ),
  //           ),
  //           SizedBox(height: 16),
  //           ElevatedButton(
  //             onPressed: () {
  //               _fetchFoodData(_foodController.text);
  //             },
  //             child: Text(S.of(context).Search),
  //           ),
  //           const SizedBox(height: 16),
  //           _error.isNotEmpty
  //               ? Text(
  //                   _error,
  //                   style: TextStyle(color: Colors.red),
  //                 )
  //               : Expanded(
  //                   child: Column(
  //                     children: [
  //                       Expanded(
  //                         child: ListView.builder(
  //                           itemCount: _ingredients.length,
  //                           itemBuilder: (context, index) {
  //                             return ListTile(
  //                               title: Text(_ingredients[index]),
  //                             );
  //                           },
  //                         ),
  //                       ),
  //                       SizedBox(height: 16),
  //                       Text(
  //                         _warning,
  //                         style: TextStyle(
  //                           color: _warning.contains(S.of(context).Warning)
  //                               ? Colors.red
  //                               : Colors.green,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
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