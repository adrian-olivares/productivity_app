class Plan {
  final String name;
  final String description;
  final int duration;
  final int difficulty;

  Plan({
    required this.name,
    this.description = '',
    this.duration = 1,
    this.difficulty = 1,
  });

  factory Plan.fromJson(Map<String, dynamic> json) {
    return Plan(
      name: json['name'],
      description: json['description'],
      duration: json['duration'],
      difficulty: json['difficulty'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'duration': duration,
      'difficulty': difficulty,
    };
  }
}
