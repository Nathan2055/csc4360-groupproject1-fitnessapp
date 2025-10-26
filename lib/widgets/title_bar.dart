import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitnessapp/models/theme_model.dart';

/*
class _PreferredTitleBarSize extends Size {
  _PreferredTitleBarSize(this.toolbarHeight, this.bottomHeight)
    : super.fromHeight((toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}
*/

class TitleBar extends StatelessWidget implements PreferredSizeWidget {
  final Text title;
  final bool isHome;

  //final preferredSize = _PreferredTitleBarSize(toolbarHeight, bottom?.preferredSize.height)

  const TitleBar({super.key, required this.title, this.isHome = false});

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

  @override
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

  @override
  Size get preferredSize => _PreferredTitleBarSize(kToolbarHeight, null);
}

class _PreferredTitleBarSize extends Size {
  _PreferredTitleBarSize(this.toolbarHeight, this.bottomHeight)
    : super.fromHeight((toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}
