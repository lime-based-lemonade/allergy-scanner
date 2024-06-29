import 'package:flutter/material.dart';

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
                child: Text('Timestamp', style: TextStyle(fontWeight: FontWeight.bold)),
              )),
              Expanded(flex: 3, child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Product Name', style: TextStyle(fontWeight: FontWeight.bold)),
              )),
              Expanded(flex: 2, child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Compatible', style: TextStyle(fontWeight: FontWeight.bold)),
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
                      child: Text(entry['timestamp'] ?? ''),
                    )),
                    Expanded(flex: 3, child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(entry['product'] ?? ''),
                    )),
                    Expanded(flex: 2, child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(entry['compatible'] ?? ''),
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

