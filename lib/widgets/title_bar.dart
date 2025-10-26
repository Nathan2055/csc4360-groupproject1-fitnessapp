import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitnessapp/models/theme_model.dart';

class TitleBar extends AppBar {
  @override
  final Text title;
  final bool isHome;

  TitleBar({super.key, required this.title, this.isHome = false});

  /*
  AppBar buildTitleBar({
    required BuildContext context,
    required String title,
    bool isHome = false,
  }) {
    return AppBar(
      automaticallyImplyLeading: !isHome,
      title: Text(title),
      actions: <Widget>[
        IconButton(
          // The icon and tooltip is also provided by the theme model
          icon: Provider.of<ThemeModel>(context).themeIcon,
          tooltip: Provider.of<ThemeModel>(context).themeText,
          // toggleThemeMode is called to update the current theme
          onPressed: () {
            var model = context.read<ThemeModel>();
            model.toggleThemeMode();
          },
        ),
      ],
    );
  }
  */

  Widget build(BuildContext context) {
    /*
    // TODO: implement build
    throw UnimplementedError();
    */
    return AppBar(
      automaticallyImplyLeading: !isHome,
      title: title,
      actions: <Widget>[
        IconButton(
          // The icon and tooltip is also provided by the theme model
          icon: Provider.of<ThemeModel>(context).themeIcon,
          tooltip: Provider.of<ThemeModel>(context).themeText,
          // toggleThemeMode is called to update the current theme
          onPressed: () {
            var model = context.read<ThemeModel>();
            model.toggleThemeMode();
          },
        ),
      ],
    );
  }
}
