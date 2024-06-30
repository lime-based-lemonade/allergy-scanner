import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lime_based_application/generated/l10n.dart';

class ScanHistoryTable extends StatefulWidget {
  const ScanHistoryTable({super.key});

  @override
  State<ScanHistoryTable> createState() => ScanHistoryTableState();
}

class ScanHistoryTableState extends State<ScanHistoryTable> {
  // Sample data
  final List<Map<String, String>> _scanHistory = [
    {'timestamp': '2024-06-28 14:35', 'product': 'Product 1', 'compatible': 'Yes'},
    {'timestamp': '2024-06-28 14:36', 'product': 'Product 2', 'compatible': 'No'},
    {'timestamp': '2024-06-28 14:37', 'product': 'Product 3', 'compatible': 'Yes'},
    {'timestamp': '2024-06-28 14:38', 'product': 'Product 4', 'compatible': 'Yes'},
    {'timestamp': '2024-06-28 14:39', 'product': 'Product 5', 'compatible': 'No'},
    {'timestamp': '2024-06-28 14:40', 'product': 'Product 6', 'compatible': 'Yes'},
    {'timestamp': '2024-06-28 14:45', 'product': 'Product 7', 'compatible': 'No'},
    {'timestamp': '2024-06-28 14:46', 'product': 'Product 8', 'compatible': 'Yes'},
    {'timestamp': '2024-06-28 14:49', 'product': 'Product 9', 'compatible': 'Yes'},
    {'timestamp': '2024-06-28 14:52', 'product': 'Product 10', 'compatible': 'No'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header row
        Container(
          color: Colors.grey[300],
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(S.of(context).timestamp, style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(S.of(context).ProductName, style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(S.of(context).compatibleU, style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Data rows
        Column(
          children: _scanHistory.map((entry) {
            return Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(entry["timestamp"] ?? '')),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(entry["product"] ?? '')),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(entry["compatible"] ?? '')),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
