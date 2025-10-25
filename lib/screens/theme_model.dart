import 'package:flutter/material.dart';

class ThemeModel extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;
  Icon get themeIcon => (_themeMode == ThemeMode.dark)
      ? const Icon(Icons.sunny)
      : const Icon(Icons.mode_night);
  String get themeText =>
      (_themeMode == ThemeMode.dark) ? 'Light Mode' : 'Dark Mode';

  void toggleThemeMode() {
    if (_themeMode == ThemeMode.light) {
      _themeMode = ThemeMode.dark;
    } else if (_themeMode == ThemeMode.dark) {
      _themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}
