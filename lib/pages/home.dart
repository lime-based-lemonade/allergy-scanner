import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lime_based_application/pages/scanner.dart';
import 'package:lime_based_application/routes.dart';
import 'package:lime_based_application/widgets/allergen_list.dart';
import 'package:lime_based_application/widgets/history_table.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Allergen Scanner'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                AllergenList(),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      Navigator.pushNamed(context, ApplicationRoutes.allergenSelector);
                    },
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ScanHistoryTable(),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ApplicationRoutes.scanner);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                    textStyle: const TextStyle(fontSize: 24),
                  ),
                  child: const Text('Scan'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
    // Add more data here
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header row
        Container(
          color: Colors.grey[300],
          child: Row(
            children: const [
              Expanded(flex: 2, child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(child: Text('Timestamp', style: TextStyle(fontWeight: FontWeight.bold))),
              )),
              Expanded(flex: 3, child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(child: Text('Product Name', style: TextStyle(fontWeight: FontWeight.bold))),
              )),
              Expanded(flex: 2, child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(child: Text('Compatible', style: TextStyle(fontWeight: FontWeight.bold))),
              )),
            ],
          ),
        ),
        // Data rows
        Expanded(
          child: ShaderMask(
            shaderCallback: (rect) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black],
                stops: [0.9, 1.0],
              ).createShader(rect);
            },
            blendMode: BlendMode.dstOut,
            child: ListView.builder(
              itemCount: _scanHistory.length,
              itemBuilder: (context, index) {
                final entry = _scanHistory[index];
                return Row(
                  children: [
                    Expanded(flex: 2, child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text(entry['timestamp'] ?? '')),
                    )),
                    Expanded(flex: 3, child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text(entry['product'] ?? '')),
                    )),
                    Expanded(flex: 2, child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text(entry['compatible'] ?? '')),
                    )),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}