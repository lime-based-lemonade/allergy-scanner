import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lime_based_application/data/history_provider.dart';
import 'package:lime_based_application/generated/l10n.dart';

class ScanHistoryTable extends ConsumerWidget {
  const ScanHistoryTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scanHistory = ref.watch(scanHistoryProvider);

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
                    child: Text(S.of(context).timestamp,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(S.of(context).ProductName,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(S.of(context).compatibleU,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ],
          ),
        ),
        scanHistory.isEmpty
            ? const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    // S.of(context).nothingToShow,
                    'Nothing to show',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              )
            : Column(
                children: scanHistory.map((entry) {
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
