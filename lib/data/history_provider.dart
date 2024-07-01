import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lime_based_application/data/local_storage.dart';

// Define a provider for the scan history
final scanHistoryProvider =
    StateNotifierProvider<ScanHistoryNotifier, List<Map<String, String>>>(
  (ref) => ScanHistoryNotifier(),
);

class ScanHistoryNotifier extends StateNotifier<List<Map<String, String>>> {
  ScanHistoryNotifier() : super([]) {
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    String historyJson = await LocalStorageService.getHistory();
    List<dynamic> historyList = json.decode(historyJson);
    List<Map<String, String>> history =
        historyList.map((item) => Map<String, String>.from(item)).toList();
    state = history;
  }

  Future<void> addEntry(Map<String, String> entry) async {
    state = [...state, entry];
    _saveHistory();
  }

  Future<void> removeEntry(Map<String, String> entry) async {
    state = state.where((e) => e != entry).toList();
    _saveHistory();
  }

  Future<void> _saveHistory() async {
    String historyJson = json.encode(state);
    await LocalStorageService.setHistory(historyJson);
  }
}
