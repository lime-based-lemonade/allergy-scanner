import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lime_based_application/pages/scanner.dart';
import 'package:lime_based_application/routes.dart';
import 'package:lime_based_application/widgets/allergen_list.dart';
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
            Padding(
              padding: const EdgeInsets.only(top: 72.0), // Adjusted padding to create space for the button
              child: const AllergenList(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ApplicationRoutes.scanner);
                  },
                  child: const Text('Scan'),
                ),
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, ApplicationRoutes.allergenSelector);
                },
                child: const Icon(Icons.edit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
