import 'package:flutter/material.dart';
import 'package:fitnessapp/screens/recipe_list_screen.dart';
import 'package:fitnessapp/screens/workout_log_screen.dart';
import 'package:fitnessapp/screens/calorie_tracker_screen.dart';
import 'package:fitnessapp/screens/progress_reports_screen.dart';
import 'package:fitnessapp/screens/preset_routines_screen.dart';
import 'package:fitnessapp/widgets/fitness_card.dart';

class FitnessHomeScreen extends StatelessWidget {
  const FitnessHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Fitness Tracker',
            style: Theme.of(
              context,
            ).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          FitnessCard(
            icon: Icons.fitness_center,
            title: 'Workout Log',
            subtitle: 'Track your workouts',
            color: const Color(0xFF6366F1),
            targetScreen: WorkoutLogScreen(),
          ),
          const SizedBox(height: 16),
          FitnessCard(
            icon: Icons.local_fire_department,
            title: 'Calorie Tracker',
            subtitle: 'Track your calories',
            color: const Color(0xFFEC4899),
            targetScreen: CalorieTrackerScreen(),
          ),
          const SizedBox(height: 16),
          FitnessCard(
            icon: Icons.show_chart,
            title: 'Progress Reports',
            subtitle: 'View charts on your progress',
            color: const Color(0xFF10B981),
            targetScreen: ProgressReportsScreen(),
          ),
          const SizedBox(height: 16),
          FitnessCard(
            icon: Icons.sports_gymnastics,
            title: 'Preset Routines',
            subtitle: 'View info on preset workouts',
            color: const Color(0xFFF59E0B),
            targetScreen: PresetRoutinesScreen(),
          ),
          const SizedBox(height: 16),
          FitnessCard(
            icon: Icons.restaurant_menu,
            title: 'Recipe Book',
            subtitle: 'Explore healthy recipes',
            color: const Color(0xFF8B5CF6),
            targetScreen: RecipeListScreen(),
          ),
        ],
      ),
    );
  }
}
