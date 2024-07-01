import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lime_based_application/data/history_provider.dart';
import 'package:lime_based_application/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lime_based_application/routes.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

enum _DataFetchingState { idle, fetching, done, error }

class FoodSearchScreen extends ConsumerStatefulWidget {
  final List<String> allergens = ['milk', 'soy', 'bean'];

  FoodSearchScreen({super.key});

  @override
  _FoodSearchScreenState createState() => _FoodSearchScreenState();
}

class _FoodSearchScreenState extends ConsumerState<FoodSearchScreen> {
  final TextEditingController _foodController = TextEditingController();
  final String _appId = '19a79a7f';
  final String _appKey = '27976be65f8cf6a04d18861a6c4d1146';

  List<String> _ingredients = [];
  String _error = '';
  String _warning = '';
  Barcode? _barcode;
  _DataFetchingState _fetchingState = _DataFetchingState.idle;

  void _writeIntoHistory(WidgetRef ref, FoodData data, bool compatible) {
    final timestamp = DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
    final entry = {
      "timestamp": timestamp,
      "product": data.ingredients.join(', '),
      "compatible": compatible ? "Yes" : "No"
    };

    ref.read(scanHistoryProvider.notifier).addEntry(entry);
  }

  Future<void> _fetchFoodData(String foodName, WidgetRef ref) async {
    print('Fetching data about $foodName');

    final url = Uri.https('api.edamam.com', '/api/food-database/v2/parser', {
      'upc': foodName,
      'app_id': _appId,
      'app_key': _appKey,
    });

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        print('status code 200');
        final data = json.decode(response.body);

        setState(() {
          _fetchingState = _DataFetchingState.done;
          FoodData foodData = FoodData.fromJson(data);

          if (foodData.ingredients.isNotEmpty) {
            _ingredients = foodData.ingredients;
            _error = '';
          } else {
            print('bad code: ${response.statusCode}');
            _error = S.of(context).Noingredientsfound;
            _ingredients = [];
          }

          _checkForAllergens(ref, foodData);
        });
      } else {
        setState(() {
          _fetchingState = _DataFetchingState.error;
          _error =
              '${S.of(context).Failedtofetchdatastatuscode}${response.statusCode}';
          _ingredients = [];
        });
      }
    } catch (exception) {
      print('catch: ${S.of(context).Networkerroroccurred}');
      setState(() {
        _fetchingState = _DataFetchingState.error;
        _error = '${S.of(context).Networkerroroccurred}$exception';
        _ingredients = [];
      });
    }
  }

  void _checkForAllergens(WidgetRef ref, FoodData data) {
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

    _writeIntoHistory(ref, data, allergenMatches.isEmpty);

    setState(() {
      if (allergenMatches.isNotEmpty) {
        _warning = '${S.of(context).WarningMessageAboutIngredient}\n';
        allergenMatches.forEach((allergen, ingredients) {
          _warning +=
              '- ${S.of(context).Allergenfound(allergen)}${ingredients.join(', ')}\n';
        });
      } else {
        _warning = S.of(context).Allsafe;
      }
    });
  }

  void _handleBarcode(BarcodeCapture barcodes) {
    if (mounted) {
      setState(() {
        _barcode = barcodes.barcodes.firstOrNull;
        print(
            'barcode state updated ${barcodes.barcodes.firstOrNull?.displayValue}');
        if (_barcode?.displayValue != null) {
          _fetchingState = _DataFetchingState.fetching;
          _fetchFoodData(_barcode!.displayValue!, ref);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Simple scanner')),
        body: _buildBody());
  }

  Widget _buildBody() {
    switch (_fetchingState) {
      case _DataFetchingState.idle:
        return _buildWidgetIdle();
      case _DataFetchingState.fetching:
        return _buildWidgetFetching();
      case _DataFetchingState.done:
        return _buildWidgetDone();
      case _DataFetchingState.error:
        return _buildWidgetError();
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
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Center(child: Text('Scan the barcode'))),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWidgetFetching() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(
            height: 16,
          ),
          Text('Fetching data...')
        ],
      ),
    );
  }

  Widget _buildWidgetDone() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Data successfully fetched!',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(_warning),
          const SizedBox(
            height: 16,
          ),
          FilledButton(
              onPressed: () =>
                  Navigator.pushNamed(context, ApplicationRoutes.home),
              child: const Text('Go back')),
        ],
      ),
    );
  }

  Widget _buildWidgetError() {
    return Center(
      child: Column(
        children: [
          Text(
            'Error fetching data',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(_error),
          const SizedBox(
            height: 16,
          ),
          FilledButton(
              onPressed: () =>
                  Navigator.pushNamed(context, ApplicationRoutes.home),
              child: const Text('Go back')),
        ],
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
