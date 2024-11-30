import 'package:flutter/material.dart';
import '../models/blog_post.dart';
import '../utils/constants.dart';
import '../utils/helpers.dart';

class BlogScreen extends StatelessWidget {
  final List<BlogPost> posts = [
    BlogPost(
      title: 'Getting Started with Machine Learning',
      excerpt:
          'A beginner\'s guide to understanding machine learning concepts and implementation.',
      date: DateTime.now().subtract(Duration(days: 5)),
      imageUrl: 'assets/images/ml-blog.jpg',
    ),
    BlogPost(
      title: 'Flutter Web Development Tips',
      excerpt:
          'Best practices and tips for developing web applications using Flutter.',
      date: DateTime.now().subtract(Duration(days: 10)),
      imageUrl: 'assets/images/flutter-blog.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Constants.blogTitle,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(height: 30),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return _buildBlogCard(context, posts[index]);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBlogCard(BuildContext context, BlogPost post) {
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {
          // Navigate to blog post
        },
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: 10),
              Text(
                post.excerpt,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 10),
              Text(
                Helpers.getTimeAgo(post.date),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
