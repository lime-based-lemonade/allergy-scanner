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
            SingleChildScrollView(
              child: Column(
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 400, // Adjust the height as needed
                      child: ScanHistoryTable(),
                    ),
                  ),
                  SizedBox(height: 80), // To prevent the button from covering content
                ],
              ),
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
