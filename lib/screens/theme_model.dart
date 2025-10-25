import 'package:flutter/material.dart';

class ThemeModel extends ChangeNotifier {
  /*
  final ThemeMode _lightMode = ThemeMode.light;
  final ThemeMode _darkMode = ThemeMode.dark;
  final Icon _lightIcon = const Icon(Icons.sunny);
  final Icon _darkIcon = const Icon(Icons.mode_night);
  */

  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;
  Icon get themeIcon => (_themeMode == ThemeMode.dark)
      ? const Icon(Icons.sunny)
      : const Icon(Icons.mode_night);

  //set _themeMode(ThemeMode newMode) => newMode;

  //Icon get _themeIcon => lightIcon;
  //set _themeIcon(Icon newIcon) => newIcon;

  /*
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
  */

  void toggleThemeMode() {
    if (_themeMode == ThemeMode.light) {
      _themeMode = ThemeMode.dark;
    } else if (_themeMode == ThemeMode.dark) {
      _themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}
