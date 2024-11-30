import 'package:flutter/material.dart';
import '../models/project.dart';
import '../utils/helpers.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (project.imageUrl != null) ...[
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  project.imageUrl!,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ],
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 10),
                  Text(
                    project.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 15),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: project.technologies.map((tech) {
                      return Chip(
                        label: Text(
                          tech,
                          style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        backgroundColor:
                            Theme.of(context).primaryColor.withOpacity(0.1),
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (project.liveUrl != null)
                        IconButton(
                          icon: Icon(Icons.launch),
                          onPressed: () => Helpers.launchURL(project.liveUrl!),
                          tooltip: 'Live Demo',
                        ),
                      if (project.githubUrl != null)
                        IconButton(
                          icon: Icon(Icons.code),
                          onPressed: () =>
                              Helpers.launchURL(project.githubUrl!),
                          tooltip: 'View Code',
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
