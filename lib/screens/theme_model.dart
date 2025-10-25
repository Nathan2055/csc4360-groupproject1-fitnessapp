import 'package:flutter/material.dart';

class ThemeModel extends ChangeNotifier {
  // Theme control variables
  ThemeMode _themeMode = ThemeMode.light;
  bool darkMode = false;

  ThemeMode getThemeMode() {
    return _themeMode;
  }

  Icon getThemeIcon() {
    if (_themeMode == ThemeMode.light) {
      return Icon(Icons.sunny);
    } else if (_themeMode == ThemeMode.dark) {
      return Icon(Icons.mode_night);
    }
    return Icon(Icons.sunny);
  }

  void toggleThemeMode() {
    if (_themeMode == ThemeMode.light) {
      _themeMode = ThemeMode.dark;
      darkMode = true;
    } else if (_themeMode == ThemeMode.dark) {
      _themeMode = ThemeMode.light;
      darkMode = false;
    }
    notifyListeners();
  }
}
