import 'package:flutter/material.dart';
import 'package:fitnessapp/models/recipe.dart';
import 'package:provider/provider.dart';
import 'package:fitnessapp/screens/theme_model.dart';

class DetailsScreen extends StatelessWidget {
  final Recipe recipe;

  const DetailsScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ingredients',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(recipe.ingredients),
              const SizedBox(height: 24),
              Text(
                'Instructions',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(recipe.instructions),
            ],
          ),
        ),
      ),
    );
  }
}
