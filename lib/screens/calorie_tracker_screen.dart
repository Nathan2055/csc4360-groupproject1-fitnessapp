import 'package:flutter/material.dart';
import 'package:fitnessapp/models/database_helper.dart';
import 'package:fitnessapp/widgets/title_bar.dart';

class CalorieTrackerScreen extends StatefulWidget {
  const CalorieTrackerScreen({super.key});

  @override
  State<CalorieTrackerScreen> createState() => _CalorieTrackerScreenState();
}

class _CalorieTrackerScreenState extends State<CalorieTrackerScreen> {
  late List<CalorieEntry> entries = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCalories();
  }

  Future<void> _loadCalories() async {
    try {
      final loadedEntries = await DBHelper.instance.getCalories();
      setState(() {
        entries = loadedEntries;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading calories: $e')),
        );
      }
    }
  }

  void _showAddCalorieDialog() {
    showDialog(
      context: context,
      builder: (context) => _AddCalorieDialog(
        onSave: (calories) async {
          final entry = CalorieEntry(
            date: DateTime.now(),
            total: calories,
          );
          await DBHelper.instance.insertCalories(entry);
          _loadCalories();
        },
      ),
    );
  }

  Future<void> _deleteCalorie(int id) async {
    await DBHelper.instance.deleteCalories(id);
    _loadCalories();
  }

  int _getTotalCalories() {
    return entries.fold(0, (sum, entry) => sum + entry.total);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar(title: const Text('Calorie Tracker')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                if (entries.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.all(16),
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total Calories Today',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${_getTotalCalories()} kcal',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.local_fire_department,
                          size: 48,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                  ),
                Expanded(
                  child: entries.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.local_fire_department,
                                size: 80,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'No calories logged',
                                style:
                                    Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Start by logging your first meal',
                                style:
                                    Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.all(12),
                          itemCount: entries.length,
                          itemBuilder: (context, index) {
                            final entry = entries[index];
                            return CalorieCard(
                              entry: entry,
                              onDelete: () => _deleteCalorie(entry.id!),
                            );
                          },
                        ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddCalorieDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CalorieCard extends StatelessWidget {
  final CalorieEntry entry;
  final VoidCallback? onDelete;

  const CalorieCard({
    super.key,
    required this.entry,
    this.onDelete,
  });

  String _formatDate(DateTime date) {
    return '${date.month}/${date.day}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.local_fire_department,
                  color: Colors.red[400],
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${entry.total} kcal',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        _formatDate(entry.date),
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (onDelete != null) ...[
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: onDelete,
                  child: const Text(
                    'Delete',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _AddCalorieDialog extends StatefulWidget {
  final Function(int) onSave;

  const _AddCalorieDialog({required this.onSave});

  @override
  State<_AddCalorieDialog> createState() => _AddCalorieDialogState();
}

class _AddCalorieDialogState extends State<_AddCalorieDialog> {
  late TextEditingController _caloriesController;

  @override
  void initState() {
    super.initState();
    _caloriesController = TextEditingController();
  }

  @override
  void dispose() {
    _caloriesController.dispose();
    super.dispose();
  }

  void _submitCalories() {
    if (_caloriesController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter calorie amount')),
      );
      return;
    }

    try {
      final calories = int.parse(_caloriesController.text);
      widget.onSave(calories);
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid calorie amount')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Log Calories'),
      content: TextField(
        controller: _caloriesController,
        decoration: const InputDecoration(
          labelText: 'Calories (kcal)',
        ),
        keyboardType: TextInputType.number,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submitCalories,
          child: const Text('Log Calories'),
        ),
      ],
    );
  }
}
