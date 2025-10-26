import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitnessapp/models/theme_model.dart';
import 'package:fitnessapp/widgets/title_bar.dart';

class PresetRoutinesScreen extends StatelessWidget {
  const PresetRoutinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar(title: const Text('Preset Routines')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.sports_gymnastics, size: 80, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              'Explore workout routines',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Coming soon...',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
