import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lime_based_application/theme/theme.dart';

class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeNotifier() : super(lightTheme);

  void toggleTheme() {
    state = state == lightTheme ? darkTheme : lightTheme;
  }
}

final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, ThemeData>((ref) {
  return ThemeNotifier();
});
