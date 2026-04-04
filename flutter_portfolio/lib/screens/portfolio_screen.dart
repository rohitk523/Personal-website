// portfolio_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/widgets/github_contributions.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../widgets/project_card.dart';
import '../models/project.dart';
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
        return techs.any((t) => ['flutter', 'dart', 'react native', 'mobile'].contains(t));
      case 'AI & Computer Vision':
        return techs.any((t) => ['machine learning', 'computer vision', 'ai', 'yolo', 'detectron2', 'pytorch', 'deepsort', 'object detection', 'opencv', 'yolov8', 'yolov11', 'yolo11', 'roboflow', 'gemini', 'ultralytics', 'numpy', 'matplotlib', 'sam2', 'bytetrack', 'vlm', 'vertex ai', 'gemini ai', 'homography', 'uwb', 'ffmpeg', 'edge computing', 'nvidia jetson', 'audio processing', 'openai realtime api'].contains(t));
      case 'Web Development':
        return techs.any((t) => ['next.js', 'react', 'typescript', 'javascript', 'web', 'vercel', 'bun', 'shadcn/ui', 'github pages', 'clerk', 'nextauth', 'tailwind css', 'motion', 'cloudflare workers'].contains(t));
      case 'Backend Systems':
        return techs.any((t) => ['fastapi', 'python', 'aws', 'microservices', 'backend', 'api development', 'postgresql', 'docker', 'aws lambda', 'aws step functions', 'aws s3', 'aws ec2', 'aws opensearch', 'opensearch', 'poetry', 'pydantic', 'uvicorn', 'boto3', 'gunicorn', 'pytest', 'asyncio', 'celery', 'redis', 'sqlalchemy', 'supabase', 'cloudflare r2', 'prometheus', 'sentry', 'flask', 'ble', 'gopro sdk', 'websocket', 'google cloud workflows', 'cloud run'].contains(t));
      case 'Healthcare & AI':
        return techs.any((t) => ['healthcare tech', 'voice ai', 'livekit', 'webrtc', 'real-time audio', 'openai realtime api', 'audio processing'].contains(t));
      default:
        return false;
    }
  }
  
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
    Project(
      title: 'Restaurant Management System',
      description:
          'Developed a comprehensive RESTful API using FastAPI for restaurant operations. Implemented advanced features including order management, menu control, ingredient tracking, reviews system, and promotional campaigns. Features include customer order tracking, staff analytics, and multi-modal ordering support.',
      technologies: [
        'FastAPI',
        'Python',
        'PostgreSQL',
        'REST API',
        'SQLAlchemy',
        'Pydantic',
        'JWT Auth'
      ],
      githubUrl: 'https://github.com/pritikabugga/restaurant-system',
      imageUrl: 'assets/images/Restaurant-Management-System.png',
    ),
    Project(
      title: 'Enterprise RBAC System',
      description:
          'Built a sophisticated Role-Based Access Control (RBAC) microservice with Casbin integration. Implemented tenant management, analytics, and settings APIs. Features include complete user role management, tenant status controls, and comprehensive testing with Pytest.',
      technologies: [
        'Python',
        'FastAPI',
        'Casbin',
        'Pytest',
        'Microservices',
        'JWT',
        'PostgreSQL'
      ],
      githubUrl: 'https://github.com/numidAi/rbac_ms',
      imageUrl: 'assets/images/Enterprise-RBAC-System.png',
    ),
    Project(
      title: 'Global Beach Finder',
      description:
          'Developed a Flutter-based travel application with Firebase backend for discovering beaches worldwide. Implemented comprehensive beach details including ratings, coordinates, and descriptions. Features robust search functionality and user reviews system.',
      technologies: [
        'Flutter',
        'Firebase',
        'Google Maps API',
        'Cloud Firestore',
        'Firebase Auth',
        'Geolocation'
      ],
      githubUrl: 'https://github.com/rohitk523/beach-database',
      imageUrl: 'assets/images/Global-Beach-Finder.png',
    ),
    Project(
      title: 'PayPal Subscription Integration',
      description:
          'Implemented PayPal subscription integration in FlutterFlow, enabling monthly and yearly subscription plans. Created custom actions for payment processing and subscription management with Supabase backend integration.',
      technologies: [
        'FlutterFlow',
        'PayPal API',
        'Supabase',
        'Custom Actions',
        'Flutter',
        'Payment Gateway'
      ],
      imageUrl: 'assets/images/PayPal-Subscription-Integration.png',
    ),
    Project(
      title: 'ChatGPT Chatbox',
      description:
          'Integrated ChatGPT with FlutterFlow to create a specialized chatbot for domain-specific interactions. Implemented context-aware responses and custom conversation flows.',
      technologies: [
        'FlutterFlow',
        'ChatGPT API',
        'Flutter',
        'NLP',
        'Custom Actions',
        'REST API'
      ],
      imageUrl: 'assets/images/ChatGPT-Chatbox.png',
    ),
    Project(
      title: 'Multi-Schema Microservice Architecture',
      description:
          'Designed and implemented a multi-schema architecture across microservices. Handled complex database operations, schema-specific logic, and data migration processes.',
      technologies: [
        'Microservices',
        'PostgreSQL',
        'Database Migration',
        'API Gateway',
        'Docker',
      ],
      githubUrl: 'https://github.com/numidAi',
      imageUrl: 'assets/images/Multi-Schema-Microservice-Architecture.png',
    ),
    Project(
      title: 'Automated Astrology Reading System',
      description:
          'Developed an end-to-end automated system for processing astrological readings. Features include payment processing integration, automated data extraction from forms, generation of personalized numerology readings and soulmate predictions, and automated document creation and email delivery.',
      technologies: [
        'n8n',
        'FastAPI',
        'OpenAI API',
        'Google Workspace APIs',
        'Gmail API',
        'Automation',
        'Razorpay Integration'
      ],
      // Note: You may want to add your own image path here
      imageUrl: 'assets/images/astrology-automation.png',
    ),
    Project(
      title: 'CellAssist Healthcare AI Platform',
      description:
          'Intelligent voice AI platform designed for healthcare operations, specializing in automated triage and patient assistance. Features real-time conversational AI agents with multilingual support, noise cancellation, and LiveKit integration for seamless healthcare communication.',
      technologies: [
        'Python',
        'LiveKit',
        'FastAPI',
        'Voice AI',
        'WebRTC',
        'Real-time Audio',
        'Docker',
        'AWS EC2'
      ],
      imageUrl: 'assets/images/cellassist-platform.png',
    ),
    Project(
      title: 'Basketball Video Analysis Studio',
      description:
          'Production-ready FastAPI system for analyzing dual-camera basketball videos. Features advanced DeepSORT tracking with 80% reduction in ID switching, AI-powered shot detection with 97% accuracy, bird\'s eye view generation, and cross-camera player association for comprehensive game analytics.',
      technologies: [
        'Python',
        'FastAPI',
        'Computer Vision',
        'DeepSORT',
        'YOLO11',
        'OpenCV',
        'PyTorch',
        'NumPy',
        'Asyncio'
      ],
      imageUrl: 'assets/images/basketball-analysis-studio.png',
    ),
    Project(
      title: 'AI Basketball Shot Detection System',
      description:
          'Advanced AI system for basketball shot detection and tracking using YOLOv8/v11 models. Achieves 95% score detection accuracy and 97% shot detection accuracy. Features configurable parameters for different camera angles, real-time processing, and comprehensive trajectory analysis.',
      technologies: [
        'Python',
        'YOLOv8',
        'YOLOv11',
        'OpenCV',
        'Computer Vision',
        'Ultralytics',
        'NumPy',
        'Matplotlib'
      ],
      imageUrl: 'assets/images/ai-basketball-detection.png',
    ),
    Project(
      title: 'GenAI Backend (RexAI)',
      description:
          'Highly scalable FastAPI application serving as backend for RexAI file classification system. Features hybrid processing with lexical techniques and LLM-based approaches, AWS Lambda integration, OpenSearch indexing, and Step Functions for high-volume workloads.',
      technologies: [
        'Python',
        'FastAPI',
        'AWS Lambda',
        'AWS Step Functions',
        'OpenSearch',
        'Pydantic',
        'Uvicorn',
        'Boto3'
      ],
      imageUrl: 'assets/images/genai-backend.png',
    ),
    Project(
      title: 'NXChat Backend API',
      description:
          'Robust chat application API built with FastAPI and Python. Features comprehensive dataset management, file filtering utilities, user profile endpoints, and AWS integration. Includes state machine implementation and advanced chat query processing capabilities.',
      technologies: [
        'Python',
        'FastAPI',
        'AWS S3',
        'AWS OpenSearch',
        'Pydantic',
        'Uvicorn',
        'Pytest'
      ],
      imageUrl: 'assets/images/nxchat-backend.png',
    ),
    Project(
      title: 'CellBot Backend API',
      description:
          'Web services API for CellBot featuring comprehensive dependency management with Poetry, WeasyPrint integration for document generation, and robust testing framework. Includes development and production server configurations with environment variable management.',
      technologies: [
        'Python',
        'FastAPI',
        'Poetry',
        'WeasyPrint',
        'Pydantic',
        'Uvicorn',
        'Pytest'
      ],
      imageUrl: 'assets/images/cellbot-backend.png',
    ),
    Project(
      title: 'NXChatApp Production System',
      description:
          'Production-grade chat application with comprehensive AWS integration, Conda environment management, and scalable architecture. Features dataset content retrieval, file processing capabilities, and extensive testing framework for enterprise deployment.',
      technologies: [
        'Python',
        'FastAPI',
        'AWS EC2',
        'AWS S3',
        'Conda',
        'Gunicorn',
        'Pytest'
      ],
      imageUrl: 'assets/images/nxchatapp-system.png',
    ),

    // === Cellstrat Projects ===
    Project(
      title: 'UBall Player Tracking System',
      description:
          'Complete basketball player tracking pipeline using YOLO11 + SAM2 + ByteTrack. Features pixel-perfect player segmentation, enhanced tracking with mask features for superior ID retention, and multiple optimization presets (Fast/Balanced/Quality) for different use cases.',
      technologies: [
        'Python',
        'YOLO11',
        'SAM2',
        'ByteTrack',
        'PyTorch',
        'OpenCV',
        'Computer Vision',
      ],
    ),
    Project(
      title: 'UBall Court Mapping System',
      description:
          'Basketball court tracking system combining UWB (Ultra-Wideband) tag positioning with YOLOv11 video analysis. Features automatic court geometry extraction from DXF files, homography computation for video-to-court calibration, and real-time player-to-tag matching.',
      technologies: [
        'Python',
        'FastAPI',
        'YOLOv11',
        'SAM2',
        'UWB',
        'OpenCV',
        'PyTorch',
        'Homography',
      ],
    ),
    Project(
      title: 'UBall VLM Game Analysis (Gemini 3.0 Pro)',
      description:
          'Automated basketball game analysis using Google Gemini 3.0 Pro Vision Language Model. Processes multi-angle footage at 5 FPS to detect events (shots, assists, rebounds, fouls, steals, blocks), identify player numbers and team colors, and generate timestamped play-by-play JSON output.',
      technologies: [
        'Python',
        'Gemini',
        'VLM',
        'Computer Vision',
        'AI',
        'Google Cloud',
      ],
    ),
    Project(
      title: 'Basketball Annotation Pipeline',
      description:
          'End-to-end pipeline for processing basketball game videos and fine-tuning Gemini 2.5 Pro models via Vertex AI. Features parallel processing with Google Cloud Run Jobs, smart skip logic for extracted clips, and Supabase integration for play metadata.',
      technologies: [
        'Python',
        'FastAPI',
        'Vertex AI',
        'Cloud Run',
        'Google Cloud Workflows',
        'Supabase',
        'Docker',
      ],
    ),
    Project(
      title: 'UBall Dual-Angle Shot Detection',
      description:
          'Dual-angle basketball shot detection system combining near (88% accuracy) and far (68% accuracy) camera feeds using YOLOv11. Smart fusion algorithm with confidence-based weighting and specialist override logic achieves >90% matched shot accuracy.',
      technologies: [
        'Python',
        'YOLOv11',
        'Computer Vision',
        'OpenCV',
        'Supabase',
        'NumPy',
        'SciPy',
      ],
    ),
    Project(
      title: 'Multi-Angle Video Ingestion Pipeline',
      description:
          'Complete solution for processing multi-angle basketball footage from GoPro cameras. Built for NVIDIA Jetson Orin Nano with GPU-accelerated 4K compression, multi-camera synchronization via timestamp-based UUIDs, real-time WebSocket progress tracking, and S3 multipart upload.',
      technologies: [
        'Python',
        'FastAPI',
        'NVIDIA Jetson',
        'FFmpeg',
        'AWS S3',
        'WebSocket',
        'Edge Computing',
      ],
    ),
    Project(
      title: 'UBall Data Collection Platform',
      description:
          'Split-screen video annotation tool with AI-assisted play classification. Built with Next.js App Router and Edge API routes, featuring Google Gemini AI for automated play classification, Supabase auth with RLS, and AWS S3 presigned URL video management.',
      technologies: [
        'Next.js',
        'React',
        'TypeScript',
        'Supabase',
        'Google Gemini',
        'AWS S3',
        'Tailwind CSS',
      ],
    ),
    Project(
      title: 'UBall Annotation Tool Backend',
      description:
          'FastAPI backend for the UBall video annotation platform. Features Celery + Redis background job processing, Google Gemini AI for play classification, Supabase authentication, and Docker Compose deployment with full async support.',
      technologies: [
        'Python',
        'FastAPI',
        'Celery',
        'Redis',
        'Supabase',
        'Gemini AI',
        'Docker',
      ],
    ),
    Project(
      title: 'UBall Core Platform',
      description:
          'Production FastAPI backend for UBall with async SQLAlchemy ORM, Alembic migrations, CloudFlare R2 (zero egress) + Stream (video CDN), Celery + Redis task queues, Firebase FCM push notifications, and Prometheus + Sentry monitoring.',
      technologies: [
        'Python',
        'FastAPI',
        'SQLAlchemy',
        'Celery',
        'Redis',
        'CloudFlare R2',
        'Prometheus',
        'Sentry',
        'Docker',
      ],
    ),
    Project(
      title: 'UBall Dashboard',
      description:
          'Modern Next.js 15 dashboard for UBall basketball analytics. Built with React 19, NextAuth, shadcn/ui, Radix UI, and deployed on Cloudflare Workers. Features video management, player statistics, game analytics, and real-time data visualization.',
      technologies: [
        'Next.js',
        'React',
        'TypeScript',
        'NextAuth',
        'shadcn/ui',
        'Tailwind CSS',
        'Cloudflare Workers',
      ],
    ),
    Project(
      title: 'CellAssist V2 - Voice AI Bot',
      description:
          'Production-ready voice AI bot bridging Exotel WebSocket streaming with OpenAI Realtime API for speech-to-speech phone conversations. Features 200ms audio buffering, noise suppression, smart interruption handling, and 24kHz PCM16 audio quality. Deployed on AWS Mumbai for lowest latency.',
      technologies: [
        'Python',
        'OpenAI Realtime API',
        'WebSocket',
        'FastAPI',
        'Docker',
        'AWS EC2',
        'Audio Processing',
      ],
    ),
    Project(
      title: 'CellBot Web App',
      description:
          'Modern Next.js chatbot frontend with Clerk authentication, shadcn/ui components, real-time markdown rendering, and motion animations. Full-featured chat interface with conversation history and PDF report generation.',
      technologies: [
        'Next.js',
        'React',
        'TypeScript',
        'Clerk',
        'shadcn/ui',
        'Tailwind CSS',
        'Motion',
      ],
    ),
    Project(
      title: 'GoPro Automation System',
      description:
          'Automated GoPro camera control system for basketball video capture. Backend uses Flask with BLE (Bluetooth Low Energy) for camera control, multi-camera coordination with Firebase sync, and S3 upload pipeline. Includes Next.js dashboard for game management.',
      technologies: [
        'Python',
        'Flask',
        'BLE',
        'Next.js',
        'Firebase',
        'AWS S3',
        'GoPro SDK',
      ],
    ),
    Project(
      title: 'BizJet Backend',
      description:
          'Business application backend with FFmpeg media conversion pipeline, Poetry dependency management, and Docker containerization for production deployment.',
      technologies: [
        'Python',
        'FastAPI',
        'FFmpeg',
        'Poetry',
        'Docker',
      ],
    ),
    Project(
      title: 'E-Invoice System',
      description:
          'Electronic invoicing system for automated invoice generation and processing, deployed with Docker containerization.',
      technologies: [
        'Python',
        'FastAPI',
        'Docker',
      ],
    ),
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
            'Production-grade AI/ML systems, computer vision pipelines, and full-stack applications built with Python, FastAPI, PyTorch, and cloud infrastructure.',
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
