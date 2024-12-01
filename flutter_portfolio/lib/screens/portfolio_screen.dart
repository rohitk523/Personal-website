// portfolio_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/widgets/github_contributions.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../widgets/project_card.dart';
import '../models/project.dart';
import '../utils/constants.dart';

class PortfolioScreen extends StatelessWidget {
  final List<Project> projects = [
    Project(
      title: 'DocNest',
      description:
          'Cross-platform document management system for storing and organizing various types of documents (government, medical, educational) securely.',
      technologies: [
        'Python',
        'FastAPI',
        'Flutter',
        'AWS',
        'GitHub Actions',
        'Docker',
        'PostgreSQL'
      ],
      githubUrl: 'https://github.com/rohitk523/DocNest',
      imageUrl: 'assets/images/DocNest.png',
    ),
    Project(
      title: 'FastAPI-Render',
      description:
          'A template project demonstrating secure API deployment using FastAPI and Render. Features include API key authentication, environment variable configuration, and automated Docker deployments.',
      technologies: [
        'FastAPI',
        'Python',
        'Docker',
        'Render',
        'GitHub',
        'REST API'
      ],
      githubUrl: 'https://github.com/rohitk523/fastapi-render',
      imageUrl: 'assets/images/fastapi-render.png',
    ),
    Project(
      title: 'Object Detection using Roboflow and YOLOv8',
      description:
          'Built an object detection system to identify hand gestures in real-time or using uploaded photos. Implemented state-of-the-art YOLOv8 model with Roboflow for training and deployment.',
      technologies: [
        'Python',
        'YOLOv8',
        'Roboflow',
        'Computer Vision',
        'OpenCV'
      ],
      githubUrl: 'https://github.com/rohitk523/Object-detection--Roboflow',
      imageUrl: 'assets/images/object-detection.png',
    ),
    Project(
      title: 'Medilink Application',
      description:
          'Full-stack application to manage patient data securely for doctors, patients, and pharmacists. Features include appointment scheduling, prescription management, and medical history tracking.',
      technologies: ['Flutter', 'FastAPI', 'PostgreSQL', 'Docker', 'AWS'],
      githubUrl: 'https://github.com/rohitk523/Medilink',
      // liveUrl: 'https://medilink-demo.com',
      imageUrl: 'assets/images/medilink.png',
    ),
    Project(
      title: 'Personal Portfolio Website',
      description:
          'A modern, responsive portfolio website built with Flutter web. Features dark/light theme switching, responsive design, animated components, and a clean, professional interface.',
      technologies: [
        'Flutter',
        'Dart',
        'GitHub Pages',
        'Provider',
        'GitHub Actions',
        'Responsive Design'
      ],
      githubUrl: 'https://github.com/rohitk523/Personal-website',
      imageUrl: 'assets/images/personal-website.png',
    ),
    Project(
      title: 'ML Library',
      description:
          'A comprehensive web application showcasing real-world machine learning applications. Features interactive demonstrations of various ML capabilities including object detection, image classification, and image segmentation.',
      technologies: [
        'Flutter',
        'FastAPI',
        'PyTorch',
        'Machine Learning',
        'Docker',
        'AWS'
      ],
      githubUrl: 'https://github.com/rohitk523/ml-library',
      imageUrl: 'assets/images/ml-library.png',
    ),

    // Add more projects as needed
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
          // _buildGitHubSection(context), // Add this new section
          // SizedBox(height: 40),
          // _buildProjectCategories(context),
          // SizedBox(height: 40),
          _buildProjectsGrid(context),
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
                  'My Work',
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
            Constants.projectsTitle,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(height: 16),
          Text(
            'A collection of my most recent projects showcasing my expertise in Machine Learning, Flutter, and Full-stack development.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6),
          ),
        ],
      ),
    );
  }

  // Widget _buildGitHubSection(BuildContext context) {
  //   return Container(
  //     padding: EdgeInsets.all(32),
  //     decoration: BoxDecoration(
  //       color: Theme.of(context).cardColor,
  //       borderRadius: BorderRadius.circular(20),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.black.withOpacity(0.05),
  //           blurRadius: 20,
  //           offset: Offset(0, 4),
  //         ),
  //       ],
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           'GitHub Contributions',
  //           style: Theme.of(context).textTheme.headlineMedium,
  //         ),
  //         SizedBox(height: 20),
  //         Text(
  //           'My open source contribution activity over the past year',
  //           style: Theme.of(context).textTheme.bodyLarge,
  //         ),
  //         SizedBox(height: 24),
  //         GithubContributions(username: 'rohitk523'),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildProjectCategories(BuildContext context) {
  //   final categories = [
  //     'All',
  //     'Machine Learning',
  //     'Web Development',
  //     'Mobile Apps'
  //   ];

  //   return Container(
  //     height: 40,
  //     child: ListView.separated(
  //       scrollDirection: Axis.horizontal,
  //       itemCount: categories.length,
  //       separatorBuilder: (context, index) => SizedBox(width: 12),
  //       itemBuilder: (context, index) {
  //         return Container(
  //           padding: EdgeInsets.symmetric(horizontal: 20),
  //           decoration: BoxDecoration(
  //             color: index == 0
  //                 ? Theme.of(context).primaryColor
  //                 : Theme.of(context).cardColor,
  //             borderRadius: BorderRadius.circular(20),
  //             border: Border.all(
  //               color: Theme.of(context).primaryColor.withOpacity(0.2),
  //             ),
  //           ),
  //           child: Center(
  //             child: Text(
  //               categories[index],
  //               style: TextStyle(
  //                 color: index == 0
  //                     ? Colors.white
  //                     : Theme.of(context).textTheme.bodyLarge?.color,
  //                 fontWeight: FontWeight.w500,
  //               ),
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  Widget _buildProjectsGrid(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: _getCrossAxisCount(context),
      mainAxisSpacing: 30,
      crossAxisSpacing: 30,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return ProjectCard(project: projects[index]);
      },
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width > 1400) return 3;
    if (width > 800) return 2;
    return 1;
  }
}
