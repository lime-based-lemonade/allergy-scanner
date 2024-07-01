import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lime_based_application/widgets/allergen_selector.dart';
import 'package:lime_based_application/generated/l10n.dart';

class AllergenSelectorPage extends ConsumerStatefulWidget {
  const AllergenSelectorPage({super.key});

  @override
  ConsumerState<AllergenSelectorPage> createState() =>
      _AllergenSelectorPageState();
}

class _AllergenSelectorPageState extends ConsumerState<AllergenSelectorPage> {
  String searchText = '';
  final TextEditingController _controller = TextEditingController();

  void searchAndHighlight(String text) {
    setState(() {
      searchText = text.toLowerCase();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).SelectAllergens,
          style: const TextStyle(fontSize: 30),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      onChanged: (text) {
                        setState(() {
                          searchText = text.toLowerCase();
                        });
                      },
                      onSubmitted: (text) {
                        searchAndHighlight(text);
                      },
                      decoration: InputDecoration(
                        labelText: S.of(context).Search,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () => searchAndHighlight(_controller.text),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SelectorList(searchText: searchText),
            ),
          ],
        ),
      ),
    );
  }
}
