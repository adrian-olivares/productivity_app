class Plan {
  final String name;
  final String description;
  final int duration;

  Plan({required this.name, this.description = '', this.duration = 1});

  factory Plan.fromJson(Map<String, dynamic> json)
  /*: name = json['name'],
        description = json['description'],
        duration = json['duration'];*/
  {
    return Plan(
      name: json['name'],
      description: json['description'],
      duration: json['duration'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'duration': duration,
    };
  }
}
