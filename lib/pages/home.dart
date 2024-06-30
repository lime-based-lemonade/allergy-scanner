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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'My allergens',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  AllergenList(),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'History',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ScanHistoryTable(),
                        const SizedBox(height: 70.0), // Add empty space below the table
                      ],
                    ),
                  ),
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
                    foregroundColor: Color.fromARGB(255, 60, 115, 37),
                    side: const BorderSide(
                      color: Color.fromARGB(255, 60, 115, 37), // Green border color
                      width: 2.0, // Border width
                    ),
                  ),
                  child: const Text('Scan'),
                ),
              ),
            ),
            Positioned(
              top: 16.0,
              right: 16.0,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, ApplicationRoutes.allergenSelector);
                },
                child: const Icon(Icons.edit),
                backgroundColor: Color.fromARGB(200, 175, 203, 163),
              ),
            ),
          ],
        ),
      ),
    );
  }
}