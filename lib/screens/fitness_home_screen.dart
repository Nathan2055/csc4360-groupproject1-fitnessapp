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
            onTap: () => _navigateWithZoom(context, WorkoutLogScreen()),
          ),
          const SizedBox(height: 16),
          FitnessCard(
            icon: Icons.local_fire_department,
            title: 'Calorie Tracker',
            subtitle: 'Track your calories',
            color: const Color(0xFFEC4899),
            onTap: () => _navigateWithZoom(context, CalorieTrackerScreen()),
          ),
          const SizedBox(height: 16),
          FitnessCard(
            icon: Icons.show_chart,
            title: 'Progress Reports',
            subtitle: 'View charts on your progress',
            color: const Color(0xFF10B981),
            onTap: () => _navigateWithZoom(context, ProgressReportsScreen()),
          ),
          const SizedBox(height: 16),
          FitnessCard(
            icon: Icons.sports_gymnastics,
            title: 'Preset Routines',
            subtitle: 'View info on preset workouts',
            color: const Color(0xFFF59E0B),
            onTap: () => _navigateWithZoom(context, PresetRoutinesScreen()),
          ),
          const SizedBox(height: 16),
          FitnessCard(
            icon: Icons.restaurant_menu,
            title: 'Recipe Book',
            subtitle: 'Explore healthy recipes',
            color: const Color(0xFF8B5CF6),
            onTap: () => _navigateWithZoom(context, RecipeListScreen()),
          ),
        ],
      ),
    );
  }

  void _navigateWithZoom(BuildContext context, Widget screen) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = 0.0;
          const end = 1.0;
          final tween = Tween(begin: begin, end: end);
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOutCubic,
          );

          return ScaleTransition(
            scale: tween.animate(curvedAnimation),
            child: FadeTransition(opacity: animation, child: child),
          );
        },
        transitionDuration: const Duration(milliseconds: 500),
      ),
    );
  }
}
