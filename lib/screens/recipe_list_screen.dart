import 'package:flutter/material.dart';
import 'package:fitnessapp/models/recipe_model.dart';
import 'package:fitnessapp/screens/recipe_details_screen.dart';
import 'package:fitnessapp/widgets/title_bar.dart';

class RecipeListScreen extends StatelessWidget {
  final List<RecipeModel> recipes = [
    RecipeModel(
      1,
      'Spaghetti Bolognese',
      'Spaghetti, ground beef, onion, garlic, tomato sauce, olive oil, salt, pepper, basil',
      '1) Boil spaghetti until al dente.\n'
          '2) Sauté onion and garlic in oil, add beef and brown.\n'
          '3) Stir in tomato sauce, season, and simmer 15 min.\n'
          '4) Toss with spaghetti and serve.',
    ),
    RecipeModel(
      2,
      'Chicken Alfredo',
      'Fettuccine, chicken breast, butter, heavy cream, garlic, parmesan, salt, pepper',
      '1) Cook fettuccine.\n'
          '2) Sear sliced chicken until cooked; set aside.\n'
          '3) Melt butter, add garlic, cream, and parmesan to make sauce.\n'
          '4) Combine pasta, chicken, and sauce.',
    ),
    RecipeModel(
      3,
      'Veggie Stir-Fry',
      'Broccoli, bell pepper, carrot, snap peas, soy sauce, garlic, ginger, sesame oil, rice',
      '1) Cook rice.\n'
          '2) Stir-fry veggies in sesame oil over high heat.\n'
          '3) Add garlic, ginger, and soy sauce; toss 2–3 min.\n'
          '4) Serve over rice.',
    ),
    RecipeModel(
      4,
      'Pancakes',
      'Flour, baking powder, sugar, salt, milk, egg, butter, vanilla',
      '1) Mix dry ingredients.\n'
          '2) Whisk wet ingredients separately.\n'
          '3) Combine and rest 5 min.\n'
          '4) Cook on greased skillet until golden.',
    ),
    RecipeModel(
      5,
      'Guacamole',
      'Avocados, lime juice, red onion, cilantro, jalapeño, salt',
      '1) Mash avocados.\n'
          '2) Stir in lime, onion, cilantro, and jalapeño.\n'
          '3) Season with salt to taste.',
    ),
  ];

  RecipeListScreen({super.key});

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
                    builder: (_) => RecipeDetailsScreen(recipe: recipe),
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
