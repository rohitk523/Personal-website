// portfolio_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/widgets/github_contributions.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../widgets/project_card.dart';
import '../models/project.dart';
import '../data/projects.dart';
import '../utils/constants.dart';

class PortfolioScreen extends StatefulWidget {
  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  String selectedCategory = 'All';
  
  List<Project> get filteredProjects {
    if (selectedCategory == 'All') {
      return projects;
    }
    return projects.where((project) => _projectBelongsToCategory(project, selectedCategory)).toList();
  }
  
  bool _projectBelongsToCategory(Project project, String category) {
    final techs = project.technologies.map((t) => t.toLowerCase()).toList();
    
    switch (category) {
      case 'Mobile Apps':
        return techs.any((t) => ['flutter', 'dart', 'react native', 'expo', 'mobile'].contains(t));
      case 'AI & Computer Vision':
        return techs.any((t) => ['machine learning', 'computer vision', 'deep learning', 'reinforcement learning', 'dqn', 'cnn', 'rnn', 'yolo', 'detectron2', 'pytorch', 'tensorflow', 'keras', 'deepsort', 'object detection', 'opencv', 'yolov8', 'yolov11', 'yolo11', 'yolo26', 'rf-detr', 'rtmpose', 'parseq ocr', 'kalman filter', 'roboflow', 'ultralytics', 'sam2', 'sam 3', 'bytetrack', 'vlm', 'homography', 'uwb', 'edge computing', 'nvidia jetson', 'scikit-learn'].contains(t));
      case 'GenAI & Agents':
        return techs.any((t) => ['langgraph', 'langchain', 'rag', 'google adk', 'mcp', 'llm', 'ollama', 'openai api', 'chatgpt api', 'openai realtime api', 'gemini', 'gemini ai', 'google gemini', 'aws bedrock', 'vertex ai', 'vlm', 'livekit', 'voice ai', 'rasa', 'nlp', 'n8n', 'qdrant'].contains(t));
      case 'Web Development':
        return techs.any((t) => ['next.js', 'react', 'typescript', 'javascript', 'web', 'vite', 'vercel', 'bun', 'shadcn/ui', 'github pages', 'clerk', 'nextauth', 'tailwind css', 'motion', 'cloudflare workers', 'playwright'].contains(t));
      case 'Backend Systems':
        return techs.any((t) => ['fastapi', 'node.js', 'aws', 'microservices', 'backend', 'api development', 'postgresql', 'docker', 'aws lambda', 'aws step functions', 'aws s3', 'aws ec2', 'aws ecs', 'aws ecr', 'aws opensearch', 'opensearch', 'poetry', 'pydantic', 'uvicorn', 'boto3', 'gunicorn', 'pytest', 'asyncio', 'celery', 'redis', 'sqlalchemy', 'alembic', 'supabase', 'cloudflare r2', 'prometheus', 'sentry', 'flask', 'ble', 'gopro sdk', 'websocket', 'google cloud workflows', 'cloud run', 'jenkins', 'dokku', 'render'].contains(t));
      case 'Healthcare & AI':
        return techs.any((t) => ['healthcare tech', 'voice ai', 'livekit', 'webrtc', 'real-time audio', 'openai realtime api', 'audio processing'].contains(t));
      default:
        return false;
    }
  }

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
          _buildProjectCategories(context),
          SizedBox(height: 40),
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
            'Production computer vision pipelines, LLM agents, and cloud platforms, from the UBall 4-camera analytics stack at Cellstrat AI to personal GenAI projects. Every project with public code links to its GitHub repository.',
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
  //         GithubContributions(username: 'rohitmk523'),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildProjectCategories(BuildContext context) {
    final categories = [
      'All',
      'AI & Computer Vision',
      'GenAI & Agents',
      'Healthcare & AI',
      'Backend Systems',
      'Web Development',
      'Mobile Apps'
    ];

    return Container(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => SizedBox(width: 12),
        itemBuilder: (context, index) {
          final isSelected = categories[index] == selectedCategory;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = categories[index];
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Theme.of(context).primaryColor.withOpacity(0.2),
                ),
              ),
              child: Center(
                child: Text(
                  categories[index],
                  style: TextStyle(
                    color: isSelected
                        ? Colors.white
                        : Theme.of(context).textTheme.bodyLarge?.color,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProjectsGrid(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: _getCrossAxisCount(context),
      mainAxisSpacing: 30,
      crossAxisSpacing: 30,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: filteredProjects.length,
      itemBuilder: (context, index) {
        return ProjectCard(project: filteredProjects[index]);
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
