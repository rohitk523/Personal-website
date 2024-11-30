class BlogPost {
  final String title;
  final String excerpt;
  final String? content;
  final DateTime date;
  final String? imageUrl;
  final String? author;
  final List<String> tags;
  final int readTime;

  BlogPost({
    required this.title,
    required this.excerpt,
    this.content,
    required this.date,
    this.imageUrl,
    this.author,
    this.tags = const [],
    this.readTime = 5,
  });

  factory BlogPost.fromJson(Map<String, dynamic> json) {
    return BlogPost(
      title: json['title'] as String,
      excerpt: json['excerpt'] as String,
      content: json['content'] as String?,
      date: DateTime.parse(json['date'] as String),
      imageUrl: json['imageUrl'] as String?,
      author: json['author'] as String?,
      tags: List<String>.from(json['tags'] as List? ?? []),
      readTime: json['readTime'] as int? ?? 5,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'excerpt': excerpt,
      'content': content,
      'date': date.toIso8601String(),
      'imageUrl': imageUrl,
      'author': author,
      'tags': tags,
      'readTime': readTime,
    };
  }
}
