import 'package:flutter/material.dart';
import 'package:fitnessapp/models/preset_model.dart';
import 'package:fitnessapp/widgets/title_bar.dart';

class PresetRoutineDetailsScreen extends StatelessWidget {
  final PresetModel routine;

  const PresetRoutineDetailsScreen({super.key, required this.routine});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar(title: Text(routine.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Difficulty',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(routine.difficulty),
              const SizedBox(height: 24),
              Text(
                'Description',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(routine.description),
              const SizedBox(height: 24),
              Text(
                'Exercises',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(routine.exercises),
            ],
          ),
        ),
      ),
    );
  }
}