// challenge_model.dart
class Challenge {
  final String title;
  final String description;
  final int goal;

  Challenge({
    required this.title,
    required this.description,
    required this.goal,
  });
  factory Challenge.fromJson(Map<String, dynamic> json) {
    return Challenge(
      title: json['title'],
      description: json['description'],
      goal: json['goal'],
    );
  }
}
