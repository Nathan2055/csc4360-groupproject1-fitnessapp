import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitnessapp/models/theme_model.dart';

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
      automaticallyImplyLeading: !isHome,
      title: title,
      actions: isHome
          ? [
              IconButton(
                icon: Provider.of<ThemeModel>(context).themeIcon,
                tooltip: Provider.of<ThemeModel>(context).themeText,
                onPressed: () {
                  var model = context.read<ThemeModel>();
                  model.toggleThemeMode();
                },
              ),
            ]
          : actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
