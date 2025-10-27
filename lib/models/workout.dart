/// Workout model class for storing exercise session data
/// This model is designed to work with SQLite database
class Workout {
  final int? id; // Primary key - null when creating new workouts
  final DateTime date;
  final String exerciseType; // e.g., "Running", "Weightlifting", "Yoga"
  final int durationMinutes;
  final String intensity; // "Light", "Moderate", "Intense"
  final int caloriesBurned;
  final String? notes; // Optional notes about the workout
  final bool isCompleted;

  Workout({
    this.id,
    required this.date,
    required this.exerciseType,
    required this.durationMinutes,
    required this.intensity,
    required this.caloriesBurned,
    this.notes,
    this.isCompleted = false,
  });

  /// Convert Workout to JSON for database storage
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'exercise_type': exerciseType,
      'duration_minutes': durationMinutes,
      'intensity': intensity,
      'calories_burned': caloriesBurned,
      'notes': notes,
      'is_completed': isCompleted ? 1 : 0,
    };
  }

  /// Create Workout from database JSON
  factory Workout.fromMap(Map<String, dynamic> map) {
    return Workout(
      id: map['id'] as int?,
      date: DateTime.parse(map['date'] as String),
      exerciseType: map['exercise_type'] as String,
      durationMinutes: map['duration_minutes'] as int,
      intensity: map['intensity'] as String,
      caloriesBurned: map['calories_burned'] as int,
      notes: map['notes'] as String?,
      isCompleted: (map['is_completed'] as int) == 1,
    );
  }

  /// Create a copy of this workout with optional field updates
  Workout copyWith({
    int? id,
    DateTime? date,
    String? exerciseType,
    int? durationMinutes,
    String? intensity,
    int? caloriesBurned,
    String? notes,
    bool? isCompleted,
  }) {
    return Workout(
      id: id ?? this.id,
      date: date ?? this.date,
      exerciseType: exerciseType ?? this.exerciseType,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      intensity: intensity ?? this.intensity,
      caloriesBurned: caloriesBurned ?? this.caloriesBurned,
      notes: notes ?? this.notes,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  String toString() {
    return 'Workout(id: $id, date: $date, exercise: $exerciseType, duration: $durationMinutes min, intensity: $intensity, calories: $caloriesBurned)';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Workout &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          date == other.date &&
          exerciseType == other.exerciseType &&
          durationMinutes == other.durationMinutes &&
          intensity == other.intensity &&
          caloriesBurned == other.caloriesBurned;

  @override
  int get hashCode =>
      id.hashCode ^
      date.hashCode ^
      exerciseType.hashCode ^
      durationMinutes.hashCode ^
      intensity.hashCode ^
      caloriesBurned.hashCode;
}
