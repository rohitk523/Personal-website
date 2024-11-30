class Skill {
  final String name;
  final String category;
  final double proficiency; // 0.0 to 1.0
  final String? iconPath;
  final String? description;

  Skill({
    required this.name,
    required this.category,
    required this.proficiency,
    this.iconPath,
    this.description,
  });

  factory Skill.fromJson(Map<String, dynamic> json) {
    return Skill(
      name: json['name'] as String,
      category: json['category'] as String,
      proficiency: (json['proficiency'] as num).toDouble(),
      iconPath: json['iconPath'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'category': category,
      'proficiency': proficiency,
      'iconPath': iconPath,
      'description': description,
    };
  }

  // Helper method to get color based on proficiency
  static List<Skill> get defaultSkills => [
        Skill(
          name: 'Python',
          category: 'Programming & Tools',
          proficiency: 0.9,
          description:
              'Advanced Python programming with focus on ML/AI applications',
        ),
        Skill(
          name: 'Flutter',
          category: 'Programming & Tools',
          proficiency: 0.8,
          description: 'Cross-platform app development with Flutter/Dart',
        ),
        Skill(
          name: 'Machine Learning',
          category: 'Machine Learning Techniques',
          proficiency: 0.85,
          description:
              'Deep understanding of ML algorithms and implementations',
        ),
        Skill(
          name: 'AWS',
          category: 'Cloud & Deployment',
          proficiency: 0.75,
          description: 'Experience with AWS services and cloud deployment',
        ),
        Skill(
          name: 'Docker',
          category: 'Cloud & Deployment',
          proficiency: 0.8,
          description: 'Container creation and orchestration',
        ),
        // Add more skills as needed
      ];

  static Map<String, List<Skill>> groupByCategory(List<Skill> skills) {
    Map<String, List<Skill>> grouped = {};
    for (var skill in skills) {
      if (!grouped.containsKey(skill.category)) {
        grouped[skill.category] = [];
      }
      grouped[skill.category]!.add(skill);
    }
    return grouped;
  }
}
