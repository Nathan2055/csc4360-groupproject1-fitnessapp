import 'package:flutter/material.dart';
import 'package:fitnessapp/models/recipe.dart';
import 'package:fitnessapp/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:fitnessapp/screens/theme_model.dart';

// Main method
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeModel(),
      child: const MyApp(),
    ),
  );
}

// Constructor
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// Recipe model definition is now in lib/models/recipe.dart

class _MyAppState extends State<MyApp> {
  // Navigation is handled by HomeScreen routing to DetailsScreen

  // Recipe list definition
  final List<Recipe> recipeList = [
    Recipe(
      1,
      'Spaghetti Bolognese',
      'Spaghetti, ground beef, onion, garlic, tomato sauce, olive oil, salt, pepper, basil',
      '1) Boil spaghetti until al dente.\n'
          '2) Sauté onion and garlic in oil, add beef and brown.\n'
          '3) Stir in tomato sauce, season, and simmer 15 min.\n'
          '4) Toss with spaghetti and serve.',
    ),
    Recipe(
      2,
      'Chicken Alfredo',
      'Fettuccine, chicken breast, butter, heavy cream, garlic, parmesan, salt, pepper',
      '1) Cook fettuccine.\n'
          '2) Sear sliced chicken until cooked; set aside.\n'
          '3) Melt butter, add garlic, cream, and parmesan to make sauce.\n'
          '4) Combine pasta, chicken, and sauce.',
    ),
    Recipe(
      3,
      'Veggie Stir-Fry',
      'Broccoli, bell pepper, carrot, snap peas, soy sauce, garlic, ginger, sesame oil, rice',
      '1) Cook rice.\n'
          '2) Stir-fry veggies in sesame oil over high heat.\n'
          '3) Add garlic, ginger, and soy sauce; toss 2–3 min.\n'
          '4) Serve over rice.',
    ),
    Recipe(
      4,
      'Pancakes',
      'Flour, baking powder, sugar, salt, milk, egg, butter, vanilla',
      '1) Mix dry ingredients.\n'
          '2) Whisk wet ingredients separately.\n'
          '3) Combine and rest 5 min.\n'
          '4) Cook on greased skillet until golden.',
    ),
    Recipe(
      5,
      'Guacamole',
      'Avocados, lime juice, red onion, cilantro, jalapeño, salt',
      '1) Mash avocados.\n'
          '2) Stir in lime, onion, cilantro, and jalapeño.\n'
          '3) Season with salt to taste.',
    ),
  ];

  // App builder
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      // The current theme mode is provided by the theme model
      // The theme model will flag the UI for update when the theme is toggled
      themeMode: Provider.of<ThemeModel>(context).themeMode,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Recipe Book'),
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
        body: HomeScreen(recipes: recipeList),
      ),
    );
  }
}
