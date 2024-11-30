import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../widgets/project_card.dart';
import '../models/project.dart';
import '../utils/constants.dart';

class PortfolioScreen extends StatelessWidget {
  final List<Project> projects = [
    Project(
      title: 'Object Detection using Roboflow and YOLOv8',
      description:
          'Built an object detection system to identify hand gestures in real-time or using uploaded photos.',
      technologies: ['Python', 'YOLOv8', 'Roboflow', 'Computer Vision'],
      githubUrl: 'https://github.com/yourusername/object-detection',
    ),
    Project(
      title: 'Medilink Application',
      description:
          'Full-stack application to manage patient data securely for doctors, patients, and pharmacists.',
      technologies: ['Flutter', 'FastAPI', 'PostgreSQL', 'Docker'],
      githubUrl: 'https://github.com/yourusername/medilink',
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
            Constants.projectsTitle,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(height: 30),
          MasonryGridView.count(
            crossAxisCount: _getCrossAxisCount(context),
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: projects.length,
            itemBuilder: (context, index) {
              return ProjectCard(project: projects[index]);
            },
          ),
        ],
      ),
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width > 1200) return 3;
    if (width > 800) return 2;
    return 1;
  }
}
