import 'package:flutter/material.dart';
import 'package:fitnessapp/screens/fitness_home_screen.dart';
import 'package:provider/provider.dart';
import 'package:fitnessapp/models/theme_model.dart';
import 'package:fitnessapp/widgets/title_bar.dart';

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

class _MyAppState extends State<MyApp> {
  // Navigation is handled by FitnessHomeScreen routing to feature screens

  // App builder
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      // The current theme mode is provided by the ThemeModel
      // ThemeModel will flag the UI for update when the theme is toggled
      themeMode: Provider.of<ThemeModel>(context).themeMode,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: TitleBar(title: const Text('Fitness Tracker'), isHome: true),
        body: FitnessHomeScreen(),
      ),
    );
  }
}
