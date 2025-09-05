class Project {
  final String title;
  final String description;
  final List<String> technologies;
  final String? githubUrl;
  final String? liveUrl;
  final String? imageUrl;
  final String? category;

  Project({
    required this.title,
    required this.description,
    required this.technologies,
    this.githubUrl,
    this.liveUrl,
    this.imageUrl,
    this.category,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      title: json['title'] as String,
      description: json['description'] as String,
      technologies: List<String>.from(json['technologies'] as List),
      githubUrl: json['githubUrl'] as String?,
      liveUrl: json['liveUrl'] as String?,
      imageUrl: json['imageUrl'] as String?,
      category: json['category'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'technologies': technologies,
      'githubUrl': githubUrl,
      'liveUrl': liveUrl,
      'imageUrl': imageUrl,
      'category': category,
    };
  }
}
