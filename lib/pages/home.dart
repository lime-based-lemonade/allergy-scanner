import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lime_based_application/routes.dart';
import 'package:lime_based_application/widgets/allergen_list.dart';
import 'package:lime_based_application/widgets/history_table.dart';
import 'package:lime_based_application/generated/l10n.dart';
import 'package:lime_based_application/providers/theme_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).AllergenScanner),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              ref.read(themeNotifierProvider.notifier).toggleTheme();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      S.of(context).Myallergens,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AllergenList(),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(
                              200, 175, 203, 163), // Background color
                          shape: BoxShape.circle, // Circular shape
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.edit),
                          color: Colors.white,
                          iconSize: 24.0,
                          onPressed: () {
                            Navigator.pushNamed(
                                context, ApplicationRoutes.allergenSelector);
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      S.of(context).History,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ScanHistoryTable(),
                          SizedBox(
                              height: 70.0), // Add empty space below the table
                        ],
                      )),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ApplicationRoutes.foodSearch);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50.0, vertical: 20.0),
                    textStyle: const TextStyle(fontSize: 24),
                    foregroundColor: const Color.fromARGB(255, 60, 115, 37),
                    side: const BorderSide(
                      color: Color.fromARGB(255, 60, 115, 37),
                      width: 2.0,
                    ),
                  ),
                  child: Text(S.of(context).Scan),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
