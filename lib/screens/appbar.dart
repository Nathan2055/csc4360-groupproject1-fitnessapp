import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeModel extends ChangeNotifier {
  // Theme control variables
  ThemeMode _themeMode = ThemeMode.light;
  bool darkMode = false;
}

// Constructor
class AppBar extends StatefulWidget {
  const AppBar({super.key});

  @override
  State<AppBar> createState() => _AppBarState();
}

class _AppBarState extends State<AppBar> {
  // Title variable
  Text _titleBar = Text('Recipe Book');

  // Theme control variables
  ThemeMode _themeMode = ThemeMode.light;
  bool darkMode = false;

  // Theme control functions; needed since we do the call from another file
  void _updateThemeMode(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
  }

  bool _getThemeMode() {
    return darkMode;
  }

  void _updateTitleBar(String newtitle) {
    setState(() {
      _titleBar = Text(newtitle);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
