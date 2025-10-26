import 'package:flutter/material.dart';

// ThemeModel is a data model and ChangeNotifier for managing persistance
// of light mode and dark mode and its associated toggles between
// different screens of the app
class ThemeModel extends ChangeNotifier {
  // Internal state representation
  ThemeMode _themeMode = ThemeMode.light;

  // Getter for the currently active theme mode
  ThemeMode get themeMode => _themeMode;

  // Getter for the theme toggle icon to display
  // This is the opposite of the current theme mode
  Icon get themeIcon => (_themeMode == ThemeMode.dark)
      ? const Icon(Icons.sunny)
      : const Icon(Icons.mode_night);

  // Getter for the theme toggle tooltip text to display
  // This is the opposite of the current theme mode
  String get themeText =>
      (_themeMode == ThemeMode.dark) ? 'Light Mode' : 'Dark Mode';

  // Method for toggling between theme modes
  // Calling this switches the internal state and then flags the UI for update
  void toggleThemeMode() {
    if (_themeMode == ThemeMode.light) {
      _themeMode = ThemeMode.dark;
    } else if (_themeMode == ThemeMode.dark) {
      _themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}
