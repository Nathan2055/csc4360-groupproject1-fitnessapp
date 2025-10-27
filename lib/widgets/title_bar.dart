import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitnessapp/models/theme_model.dart';

// TitleBar is an implementation/constructor for AppBar that includes
// the button to toggle light mode and dark mode globally using ThemeModel
//
// It accepts two parameters:
// title: a Text widget for compatibility with AppBar
// isHome: an option boolean to set home screen specific AppBar settings
class TitleBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final bool isHome;
  final List<Widget>? actions;

  const TitleBar({
    super.key,
    required this.title,
    this.isHome = false,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // This is needed on the home screen, but disabled on other screens
      automaticallyImplyLeading: !isHome,
      // This accepts a Text widget for compatibility with AppBar
      title: title,
      // As noted in main.dart's MaterialApp():
      // The current theme mode is provided by the ThemeModel
      // ThemeModel will flag the UI for update when the theme is toggled
      actions: isHome
          ? [
              // This button is where the magic happens
              IconButton(
                // The icon and tooltip is also provided by the theme model
                icon: Provider.of<ThemeModel>(context).themeIcon,
                tooltip: Provider.of<ThemeModel>(context).themeText,
                // toggleThemeMode is called to globally update the current theme
                onPressed: () {
                  var model = context.read<ThemeModel>();
                  model.toggleThemeMode();
                },
              ),
            ]
          : actions,
    );
  }

  // This is needed to implement PreferredSizeWidget, which is a requirement
  // for appBar parameters passed to Scaffolds, even though we're not using
  // any features that require this. Thus, we're free to hard code it.
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
