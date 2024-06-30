import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lime_based_application/widgets/allergen_selector.dart';

class AllergenSelectorPage extends StatefulWidget {
  @override
  _AllergenSelectorPageState createState() => _AllergenSelectorPageState();
}

class _AllergenSelectorPageState extends State<AllergenSelectorPage> {
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
          'Do you have any allergies?',
          style: TextStyle(fontSize: 30),
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
                        labelText: 'Search',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    icon: Icon(Icons.search),
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
