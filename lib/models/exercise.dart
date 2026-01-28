class Exercise {
  final String name;
  final String sets;
  final String reps;
  final String muscleGroup;

  Exercise({
    required this.name,
    required this.sets,
    required this.reps,
    required this.muscleGroup
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      name: json['name'] ?? 'Exercise',
      sets: json['sets']?.toString() ?? '3',
      reps: json['reps']?.toString() ?? '12',
      muscleGroup: json['muscleGroup'] ?? 'General',
    );
  }
}