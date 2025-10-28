import 'package:flutter/material.dart';
import 'package:fitnessapp/models/preset_model.dart';
import 'package:fitnessapp/screens/preset_routine_details_screen.dart';
import 'package:fitnessapp/widgets/title_bar.dart';
import 'package:fitnessapp/widgets/fitness_card.dart';


class PresetRoutinesScreen extends StatelessWidget {
  static const List<PresetModel> presets = [
    PresetModel(1, 'Full Body Beginner',
      'Beginner',
      'Perfect for those just starting their fitness journey. Low impact, builds foundation.',
      '1) Warm-up: 5 min walk\n'
          '2) Squats: 3 sets x 10 reps\n'
          '3) Push-ups: 3 sets x 5 reps\n'
          '4) Plank: 3 sets x 20 sec\n'
          '5) Cool-down: 5 min stretch',
          ),
    PresetModel(2, 'HIIT Cardio',
          'Intermediate',
          'High-intensity interval training to boost cardio and burn calories fast.',
          '1) Warm-up: 2 min jog\n'
          '2) Burpees: 30 sec on, 30 sec rest x 6\n'
          '3) Jump squats: 30 sec on, 30 sec rest x 6\n'
          '4) Mountain climbers: 30 sec on, 30 sec rest x 6\n'
          '5) Cool-down: 3 min walk',
          ),
    PresetModel(3, 'Strength Builder',
      'Intermediate',
      'Build muscle and increase strength with compound movements.',
      '1) Warm-up: Light cardio\n'
          '2) Deadlifts: 4 sets x 6 reps\n'
          '3) Bench press: 4 sets x 8 reps\n'
          '4) Bent rows: 3 sets x 8 reps\n'
          '5) Cool-down: Stretching',
          ),
    PresetModel(4, 'Advanced Crossfit',
      'Advanced',
      'Challenging functional fitness routine combining weightlifting, gymnastics, and cardio.',
      '1) Warm-up: 5 min mixed\n'
          '2) Snatch: 5 sets x 3 reps\n'
          '3) 21-15-9 rep scheme: Thrusters + Pull-ups\n'
          '4) Run 400m\n'
          '5) Cool-down: Foam roll',),
    PresetModel(5, 'Yoga Flow',
      'Beginner',
      'Gentle yoga routine for flexibility and mental clarity.',
      '1) Child\'s pose: 1 min\n'
          '2) Cat-cow stretch: 2 min\n'
          '3) Downward dog: 1 min\n'
          '4) Warrior poses: 3 min\n'
          '5) Savasana: 5 min',
          ),
  ];
  const PresetRoutinesScreen({super.key});

  String _truncate(String value, int cutoff) {
    if (value.length <= cutoff) return value;
    return '${value.substring(0, cutoff)}...';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar(title: const Text('Preset Routines')),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: presets.length,
          itemBuilder: (context, index) {
            final preset = presets[index];
            return FitnessCard(
              icon: Icons.sports_gymnastics,
              title: _truncate(preset.name, 20),
              subtitle: _truncate(preset.description, 50),
              color: const Color(0xFFF59E0B),
              targetScreen: PresetRoutineDetailsScreen(routine: preset),
            );
          },
        ),
      ),
    );
  }
}
