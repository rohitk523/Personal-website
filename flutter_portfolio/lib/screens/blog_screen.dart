import 'package:flutter/material.dart';
import '../models/blog_post.dart';
import '../utils/constants.dart';
import '../utils/helpers.dart';

// blog_screen.dart
class BlogScreen extends StatelessWidget {
  final List<BlogPost> posts = [
    BlogPost(
      title: 'Getting Started with Machine Learning',
      excerpt:
          'A comprehensive guide to understanding machine learning concepts, algorithms, and practical implementation steps for beginners.',
      date: DateTime.now().subtract(Duration(days: 5)),
      imageUrl: 'assets/images/ml-blog.jpg',
      author: 'Rohit Kale',
      tags: ['Machine Learning', 'AI', 'Tutorial', 'Python'],
      readTime: 8,
    ),
    BlogPost(
      title: 'Flutter Web Development Best Practices',
      excerpt:
          'Learn the essential tips, tricks, and best practices for developing high-performance web applications using Flutter.',
      date: DateTime.now().subtract(Duration(days: 10)),
      imageUrl: 'assets/images/flutter-blog.jpg',
      author: 'Rohit Kale',
      tags: ['Flutter', 'Web Development', 'Best Practices'],
      readTime: 6,
    ),
    // Add more blog posts as needed
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          SizedBox(height: 40),
          _buildFeaturedPost(context, posts.first),
          SizedBox(height: 40),
          _buildBlogPosts(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Blog',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Latest Articles',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(height: 16),
          Text(
            'Sharing my thoughts and experiences on Machine Learning, Flutter development, and more.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedPost(BuildContext context, BlogPost post) {
    return Container(
      padding: EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Featured Post',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            post.title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: 12),
          Text(
            post.excerpt,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6),
          ),
          SizedBox(height: 20),
          _buildPostMetadata(context, post),
        ],
      ),
    );
  }

  Widget _buildBlogPosts(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: posts.length,
      separatorBuilder: (context, index) => SizedBox(height: 24),
      itemBuilder: (context, index) {
        return _buildBlogCard(context, posts[index]);
      },
    );
  }

  Widget _buildBlogCard(BuildContext context, BlogPost post) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 12),
          Text(
            post.excerpt,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(height: 16),
          _buildPostMetadata(context, post),
        ],
      ),
    );
  }

  Widget _buildPostMetadata(BuildContext context, BlogPost post) {
    return Row(
      children: [
        Icon(
          Icons.access_time,
          size: 16,
          color: Theme.of(context).textTheme.bodyMedium?.color,
        ),
        SizedBox(width: 4),
        Text(
          '${post.readTime} min read',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(width: 16),
        Icon(
          Icons.calendar_today,
          size: 16,
          color: Theme.of(context).textTheme.bodyMedium?.color,
        ),
        SizedBox(width: 4),
        Text(
          Helpers.getTimeAgo(post.date),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Spacer(),
        TextButton(
          onPressed: () {
            // Navigate to blog post
          },
          child: Row(
            children: [
              Text(
                'Read More',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 4),
              Icon(
                Icons.arrow_forward,
                size: 16,
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
