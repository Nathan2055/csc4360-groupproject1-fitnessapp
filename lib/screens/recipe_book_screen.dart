import 'package:flutter/material.dart';
import 'package:fitnessapp/models/recipe.dart';
import 'package:fitnessapp/screens/details_screen.dart';
import 'package:fitnessapp/widgets/title_bar.dart';

class RecipeBookScreen extends StatelessWidget {
  final List<Recipe> recipes;

  const RecipeBookScreen({super.key, required this.recipes});

  String _truncate(int cutoff, String value) {
    if (value.length <= cutoff) return value;
    return '${value.substring(0, cutoff)}...';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar(title: const Text('Recipe Book')),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.restaurant),
              title: Text(_truncate(20, recipe.name)),
              subtitle: Text(_truncate(25, recipe.ingredients)),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => DetailsScreen(recipe: recipe),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
