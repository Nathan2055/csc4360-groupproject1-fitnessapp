import 'package:provider/provider.dart';
import 'package:fitnessapp/models/theme_model.dart';

// Recipe model definition
class Recipe {
  final int id;
  final String name;
  final String ingredients;
  final String instructions;

  const Recipe(this.id, this.name, this.ingredients, this.instructions);
}
