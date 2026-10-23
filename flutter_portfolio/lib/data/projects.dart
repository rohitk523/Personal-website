// projects.dart
import '../models/project.dart';

const String _work = 'https://github.com/rohitmk523';
const String _personal = 'https://github.com/rohitk523';

final List<Project> projects = [
  // === UBall @ Cellstrat AI ===
  Project(
    title: 'UBall 4-Camera Tracking & Possession Engine',
    description:
        'Production multi-camera basketball understanding on a fixed 4-camera rig: YOLO26 detection, RTMPose and PARSeq jersey OCR, ByteTrack tracking, cross-camera fusion into one identity per player, and a ball-first possession state machine that emits shots, rebounds and turnovers. Scored blind against human ground truth: 88-94% shot detection and 89-98% make/miss on 3 of 4 held-out games.',
    technologies: [
      'Python',
      'YOLO26',
      'RTMPose',
      'ByteTrack',
      'PARSeq OCR',
      'Kalman Filter',
      'Homography',
      'AWS EC2',
      'Computer Vision',
    ],
    githubUrl: '$_work/Tracking-Cross_camera_association-SAM3',
  ),
  Project(
    title: 'UBall Shot Detection v2 (Dual-Angle Fusion)',
    description:
        'Clean restart for the made/missed decision: replaces hand-coded near-angle logic and the hand-coded fusion resolver with an interpretable, trajectory-feature model fitted to human annotations. Trained and evaluated entirely on AWS spot GPUs and shipped only if precision and recall both improve on held-out games.',
    technologies: [
      'Python',
      'Machine Learning',
      'YOLOv11',
      'AWS EC2',
      'AWS S3',
      'Supabase',
      'Computer Vision',
    ],
    githubUrl: '$_work/uball_shot_detection_dual_fusion_v2',
  ),
  Project(
    title: 'UBall 4-Cam Detector Training (RF-DETR)',
    description:
        'Trains an in-domain RF-DETR detector (player / referee / ball) on our fixed-camera footage. The dataset is pre-labelled from SAM 3 dumps, corrected in a custom FastAPI labelling tool and split across games to prevent leakage. Runs ~20 fps and retires the CUDA-only SAM 3 passes.',
    technologies: [
      'Python',
      'RF-DETR',
      'SAM 3',
      'PyTorch',
      'FastAPI',
      'Computer Vision',
    ],
    githubUrl: '$_work/Training_frameworks',
  ),
  Project(
    title: 'UBall VLM Play Narration',
    description:
        'Full-stack research app that tests how well Gemini 3.5 Flash / 3.1 Pro narrates basketball plays. Clips are cut from S3 with FFmpeg and paired with structured event JSON from the annotation database, and events can be toggled to measure how much grounding changes the play-by-play.',
    technologies: [
      'Python',
      'FastAPI',
      'React',
      'TypeScript',
      'Gemini',
      'VLM',
      'Supabase',
      'FFmpeg',
    ],
    githubUrl: '$_work/VLM_Basketball',
  ),
  Project(
    title: 'UBall Dual-Angle Shot Detection Fusion',
    description:
        'Fusion engine combining near-angle (88%) and far-angle shot detectors with timestamp matching, confidence-based rules and specialist overrides for rim bounces and swishes. Retraining the far model on production frames lifted its detection from 68% to 93% on a 189-shot game.',
    technologies: [
      'Python',
      'YOLOv11',
      'Computer Vision',
      'OpenCV',
      'Supabase',
      'NumPy',
      'Docker',
    ],
    githubUrl: '$_work/Uball_dual_angle_fusion',
  ),
  Project(
    title: 'UBall Client Demo: Video + Live Court Map',
    description:
        'Client-facing demo plan and tooling: a processed game video plays beside a top-down court map with players as moving dots and made/missed shots overlaid. Fuses two calibrated cameras in shared court space and documents every reusable component across the UBall repos.',
    technologies: [
      'Python',
      'Homography',
      'OpenCV',
      'Computer Vision',
      'SAM 3',
    ],
    githubUrl: '$_work/DEMO_UBALL',
  ),
  Project(
    title: 'UBall Core Platform',
    description:
        'Production FastAPI backend for the UBall app: Supabase Auth and Postgres, clips with Cloudflare R2 + Stream transcoding, social feed, follows, messaging, player stats, Celery + Redis background jobs, Firebase FCM push and a Pytest suite. Deployed on Northflank.',
    technologies: [
      'Python',
      'FastAPI',
      'Supabase',
      'PostgreSQL',
      'Celery',
      'Redis',
      'CloudFlare R2',
      'Docker',
    ],
  ),
  Project(
    title: 'UBall Web App',
    description:
        'React 18 + Vite frontend for UBall with TanStack Query, shadcn/ui and Firebase. Deployed on Vercel and Cloudflare, with automated security tests and Playwright smoke tests in CI.',
    technologies: [
      'React',
      'TypeScript',
      'Vite',
      'Tailwind CSS',
      'shadcn/ui',
      'Playwright',
      'Vercel',
    ],
    liveUrl: 'https://uball-core-frontend.vercel.app',
  ),
  Project(
    title: 'UBall Annotation Tool Backend',
    description:
        'FastAPI backend for the UBall video annotation platform. Features Celery + Redis background jobs, Google Gemini play classification, Supabase auth with RLS, S3 presigned URLs, AWS Step Functions and Docker Compose deployment.',
    technologies: [
      'Python',
      'FastAPI',
      'Celery',
      'Redis',
      'Supabase',
      'Gemini AI',
      'AWS Step Functions',
      'Docker',
    ],
  ),
  Project(
    title: 'UBall Data Collection Platform',
    description:
        'Split-screen video annotation tool with AI-assisted play classification. Built with Next.js App Router and Edge API routes, with Google Gemini for play classification, Supabase auth with RLS, and AWS S3 presigned-URL video management.',
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
    title: 'Basketball Annotation & Fine-Tuning Pipeline',
    description:
        'Turns full game videos into play clips and fine-tunes Gemini 2.5 Pro on Vertex AI. Cloud Workflows runs one Cloud Run Job per game in parallel, skips clips already extracted, and merges the JSONL training data in a Cloud Function. The same pipeline handles 1 game or 100.',
    technologies: [
      'Python',
      'FastAPI',
      'Vertex AI',
      'Cloud Run',
      'Google Cloud Workflows',
      'Supabase',
      'Docker',
    ],
    githubUrl: '$_work/Uball_basketball-annotation-pipeline',
  ),
  Project(
    title: 'Multi-Angle Video Ingestion Pipeline',
    description:
        'Processes multi-angle footage from four GoPro cameras on NVIDIA Jetson Orin Nano: GPU-accelerated 4K compression, multi-camera synchronisation via timestamp-based UUIDs, real-time WebSocket progress tracking and S3 multipart upload with retries.',
    technologies: [
      'Python',
      'FastAPI',
      'NVIDIA Jetson',
      'FFmpeg',
      'AWS S3',
      'WebSocket',
      'Edge Computing',
    ],
    githubUrl: '$_work/Uball_ingestion_pipeline',
  ),
  Project(
    title: 'UBall Court Mapping System',
    description:
        'Court tracking that combines UWB (Ultra-Wideband) tag positioning with YOLOv11 video analysis. Extracts court geometry from DXF files, computes video-to-court homography from calibration points and matches UWB tags to detected players in real time.',
    technologies: [
      'Python',
      'FastAPI',
      'YOLOv11',
      'SAM2',
      'UWB',
      'OpenCV',
      'Homography',
    ],
    githubUrl: '$_work/uball_court_mapping',
  ),
  Project(
    title: 'UBall Player Tracking System',
    description:
        'Player tracking pipeline using YOLO11 + SAM2 + ByteTrack. Segments players pixel by pixel, uses mask features in the tracker to keep IDs stable, and offers Fast / Balanced / Quality presets.',
    technologies: [
      'Python',
      'YOLO11',
      'SAM2',
      'ByteTrack',
      'PyTorch',
      'OpenCV',
      'Computer Vision',
    ],
    githubUrl: '$_work/Uball_tracking',
  ),
  Project(
    title: 'AI Basketball Shot Detection (v1)',
    description:
        'First UBall shot detector: YOLOv11 ball and rim detection with Kalman-smoothed trajectories, rim-bounce physics and entry-angle analysis. Separate near-angle and far-angle versions are automatically validated against Supabase ground truth, with detailed mismatch reports.',
    technologies: [
      'Python',
      'YOLOv11',
      'OpenCV',
      'Computer Vision',
      'Ultralytics',
      'Supabase',
      'NumPy',
    ],
    githubUrl: '$_work/Uball_shot_detection',
    imageUrl: 'assets/images/ai-basketball-detection.png',
  ),
  Project(
    title: 'Basketball Video Analysis Studio',
    description:
        'FastAPI service for analysing dual-camera basketball video: DeepSORT tracking with appearance re-identification, bird\'s-eye-view court transformation, shot and assist detection, and async job processing with side-by-side, BEV and JSON outputs.',
    technologies: [
      'Python',
      'FastAPI',
      'Computer Vision',
      'DeepSORT',
      'YOLO11',
      'OpenCV',
      'PyTorch',
      'Asyncio',
    ],
    githubUrl: '$_work/trackingStudio',
    imageUrl: 'assets/images/basketball-analysis-studio.png',
  ),
  Project(
    title: 'UBall VLM Game Analysis (Gemini 3.0 Pro)',
    description:
        'Automated game analysis with the Gemini 3.0 Pro vision language model. Processes multi-angle footage at 5 FPS to detect shots, assists, rebounds, fouls, steals and blocks, identifies player numbers and team colours, and outputs timestamped play-by-play JSON.',
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
    title: 'Basketball VLM Proof of Concept',
    description:
        'Early research notebooks that tested raw-video and tracked-video analysis with Gemini 2.5 Pro and planned the homography, tracking and VLM pipeline that became UBall.',
    technologies: [
      'Python',
      'Gemini',
      'VLM',
      'OpenCV',
      'Jupyter',
    ],
    githubUrl: '$_work/basketball_poc',
  ),
  Project(
    title: 'UBall Dashboard',
    description:
        'Next.js 15 dashboard for UBall basketball analytics. Built with React 19, NextAuth, shadcn/ui and Radix UI and deployed on Cloudflare Workers, with video management, player statistics and game analytics.',
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
    title: 'GoPro Automation System',
    description:
        'Automated GoPro camera control for basketball video capture. A Flask backend controls cameras over BLE (Bluetooth Low Energy), coordinates multiple cameras with Firebase sync and uploads to S3, with a Next.js dashboard for game management.',
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

  // === GenAI @ Cellstrat AI ===
  Project(
    title: 'CellAssist V2 - Voice AI Bot',
    description:
        'Voice AI bot that bridges Exotel WebSocket streaming to the OpenAI Realtime API for speech-to-speech phone conversations. Features 200ms audio buffering, noise suppression, interruption handling and 24kHz PCM16 audio, deployed on AWS Mumbai for the lowest latency.',
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
    title: 'CellAssist Healthcare AI Platform',
    description:
        'Voice AI platform for healthcare operations, focused on automated triage and patient assistance. Real-time conversational agents with multilingual support, noise cancellation and LiveKit integration.',
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
    title: 'NXChat Backend API',
    description:
        'Enterprise RAG chat API built with FastAPI: LangChain retrieval over AWS OpenSearch vector search, multi-model support (AWS Bedrock + OpenAI), dataset management, file filtering and user profile endpoints.',
    technologies: [
      'Python',
      'FastAPI',
      'LangChain',
      'RAG',
      'AWS OpenSearch',
      'AWS Bedrock',
      'Pytest'
    ],
    imageUrl: 'assets/images/nxchat-backend.png',
  ),
  Project(
    title: 'NXChatApp Production System',
    description:
        'Production deployment of the NxChat application with AWS integration, Conda environment management, dataset content retrieval, file processing and an extensive test suite.',
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
  Project(
    title: 'GenAI Backend (RexAI)',
    description:
        'Scalable FastAPI backend for the RexAI file classification system. Combines lexical techniques with LLM-based classification, with AWS Lambda, OpenSearch indexing and Step Functions for high-volume workloads.',
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
    title: 'CellBot Backend API',
    description:
        'Web services API for CellBot with Poetry dependency management, WeasyPrint document generation, a Pytest suite, and separate development and production server configurations.',
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
    title: 'CellBot Web App',
    description:
        'Next.js chatbot frontend with Clerk authentication, shadcn/ui components, real-time markdown rendering, motion animations, conversation history and PDF report generation.',
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
    title: 'BizJet Backend',
    description:
        'Business application backend with an FFmpeg media conversion pipeline, Poetry dependency management and Docker containerisation for production.',
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
        'Electronic invoicing system that generates and processes invoices automatically, deployed in Docker containers.',
    technologies: [
      'Python',
      'FastAPI',
      'Docker',
    ],
  ),

  // === Personal: GenAI & agents ===
  Project(
    title: 'JARVIS - Voice-First Personal AI Agent',
    description:
        'Talk to JARVIS in the browser and it listens, thinks and speaks back using real tools. A LiveKit voice pipeline (VAD, STT, LLM, TTS) is backed by a FastAPI API, an MCP gateway to GitHub and Linear, a sandboxed CLI bridge to Claude Code and Gemini CLI, and document RAG on sqlite-vec.',
    technologies: [
      'Python',
      'LiveKit',
      'FastAPI',
      'MCP',
      'RAG',
      'React',
      'TypeScript',
      'Docker',
    ],
    githubUrl: '$_personal/JARVIS-backend',
  ),
  Project(
    title: 'AURA - AI-Coached Lifestyle RPG',
    description:
        'Mobile app that scores and gamifies real-life skills across fitness, health, finance, law and social. Five LangGraph domain agents are grounded in curated RAG content and fall back across LLM providers (Claude, Gemini, Llama), on a FastAPI, Qdrant, PostgreSQL and Redis backend in AWS Mumbai.',
    technologies: [
      'LangGraph',
      'FastAPI',
      'React Native',
      'Expo',
      'Qdrant',
      'PostgreSQL',
      'Redis',
      'AWS',
    ],
  ),
  Project(
    title: 'YouTube Shorts AI Agent',
    description:
        'Turns long videos and scripts into published YouTube Shorts with AI voice-overs. A FastAPI backend with OAuth 2.0, Google ADK, async SQLAlchemy and Celery + Redis jobs, plus a Flutter app built on clean architecture.',
    technologies: [
      'Python',
      'Google ADK',
      'FastAPI',
      'Celery',
      'PostgreSQL',
      'Flutter',
      'Docker',
    ],
    githubUrl: '$_personal/YouTube-video-uploader-AI-agent-BE',
  ),
  Project(
    title: 'ADK Multi-Agent Project',
    description:
        'Google ADK agents deployed together on one Render service: an email-summary agent that reads Gmail and posts to Telegram, a YouTube Short maker (OpenAI TTS + FFmpeg + YouTube Data API), and a weather / time tool agent, with Supabase session persistence.',
    technologies: [
      'Python',
      'Google ADK',
      'Gemini',
      'OpenAI API',
      'FFmpeg',
      'Supabase',
      'Render',
    ],
    githubUrl: '$_personal/adk-project',
  ),
  Project(
    title: 'Full-Stack RAG Chat Application',
    description:
        'Upload PDFs and chat with them. Next.js + TypeScript frontend, FastAPI backend, LangChain with OpenAI models, OpenSearch k-NN vector search and Clerk authentication, containerised for Railway.',
    technologies: [
      'Next.js',
      'TypeScript',
      'FastAPI',
      'LangChain',
      'RAG',
      'OpenSearch',
      'Clerk',
      'Docker',
    ],
    githubUrl: '$_personal/Langchain-chroma-project-RAG',
  ),
  Project(
    title: 'LangGraph Notebooks',
    description:
        'Hands-on LangGraph experiments, from first graphs to chained LLM calls, used to prototype agent workflows.',
    technologies: [
      'Python',
      'LangGraph',
      'LangChain',
      'Jupyter',
    ],
    githubUrl: '$_personal/Langgraph-notebooks',
  ),
  Project(
    title: 'Self-Hosted DeepSeek + Open WebUI',
    description:
        'Docker Compose stack that runs DeepSeek locally through Ollama behind Open WebUI, with health-checked service dependencies, memory limits and persistent volumes.',
    technologies: [
      'Ollama',
      'LLM',
      'Docker',
      'Open WebUI',
    ],
    githubUrl: '$_personal/deepseek-open-webui',
  ),
  Project(
    title: 'Automated Astrology Reading System',
    description:
        'End-to-end automated system for astrological readings: payment processing, data extraction from forms, personalised numerology and soulmate readings, and automatic document creation and email delivery.',
    technologies: [
      'n8n',
      'FastAPI',
      'OpenAI API',
      'Google Workspace APIs',
      'Gmail API',
      'Automation',
      'Razorpay Integration'
    ],
    imageUrl: 'assets/images/astrology-automation.png',
  ),
  Project(
    title: 'Self-Hosted n8n Automation',
    description:
        'Deploys a self-hosted n8n server on Render with a custom webhook domain, plus a Docker Compose setup for local workflow development.',
    technologies: [
      'n8n',
      'Docker',
      'Render',
      'Automation',
    ],
    githubUrl: '$_personal/n8n_render',
  ),
  Project(
    title: 'ChatGPT Chatbox',
    description:
        'Integrated ChatGPT with FlutterFlow to build a chatbot for a specific domain, with context-aware responses and custom conversation flows.',
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

  // === Personal: backend, cloud & full-stack ===
  Project(
    title: 'Containerized Multi-Tier E-Commerce on AWS',
    description:
        'React + TypeScript frontend behind Nginx, a Node.js / Express / Sequelize API and PostgreSQL, containerised with Docker and deployed to AWS ECS through ECR, with health checks and an AWS deployment guide.',
    technologies: [
      'React',
      'TypeScript',
      'Node.js',
      'PostgreSQL',
      'Docker',
      'AWS ECS',
      'AWS ECR',
    ],
    githubUrl: '$_personal/multi-tier-application',
  ),
  Project(
    title: 'FastAPI Auth & Dashboard Microservices',
    description:
        'Separate auth and user services built with FastAPI, each with its own Alembic migrations, wired together with Docker Compose.',
    technologies: [
      'Python',
      'FastAPI',
      'Microservices',
      'Alembic',
      'PostgreSQL',
      'Docker',
    ],
    githubUrl: '$_personal/microservice-fastapi-Auth',
  ),
  Project(
    title: 'Indian Finance Dashboard',
    description:
        'Personal finance app for India: transactions with UPI categorisation, investment tracking (PPF, NPS, ELSS), tax calculation and an AI financial assistant. FastAPI, PostgreSQL, JWT and Alembic backend with a Flutter frontend.',
    technologies: [
      'Python',
      'FastAPI',
      'PostgreSQL',
      'SQLAlchemy',
      'JWT',
      'Docker',
      'Flutter',
    ],
    githubUrl: '$_personal/finance_dashboard_api',
  ),
  Project(
    title: 'Enterprise RBAC System',
    description:
        'Role-Based Access Control microservice built on Casbin, with tenant management, analytics and settings APIs, user role management, tenant status controls and full Pytest coverage.',
    technologies: [
      'Python',
      'FastAPI',
      'Casbin',
      'Pytest',
      'Microservices',
      'JWT',
      'PostgreSQL'
    ],
    imageUrl: 'assets/images/Enterprise-RBAC-System.png',
  ),
  Project(
    title: 'Multi-Schema Microservice Architecture',
    description:
        'Designed and built a multi-schema database architecture across microservices, covering complex database operations, schema-specific logic and data migrations.',
    technologies: [
      'Microservices',
      'PostgreSQL',
      'Database Migration',
      'API Gateway',
      'Docker',
    ],
    imageUrl: 'assets/images/Multi-Schema-Microservice-Architecture.png',
  ),
  Project(
    title: 'Restaurant Management System',
    description:
        'RESTful FastAPI service for restaurant operations: order management, menu control, ingredient tracking, reviews and promotions, with customer order tracking, staff analytics and multiple ordering channels.',
    technologies: [
      'FastAPI',
      'Python',
      'PostgreSQL',
      'REST API',
      'SQLAlchemy',
      'Pydantic',
      'JWT Auth'
    ],
    imageUrl: 'assets/images/Restaurant-Management-System.png',
  ),
  Project(
    title: 'DocNest',
    description:
        'Cross-platform app for storing and organising government, medical and educational documents securely.',
    technologies: [
      'Python',
      'FastAPI',
      'Flutter',
      'AWS',
      'GitHub Actions',
      'Docker',
      'PostgreSQL'
    ],
    githubUrl: '$_personal/DocNest-web',
    imageUrl: 'assets/images/DocNest.png',
  ),
  Project(
    title: 'Medilink Application',
    description:
        'Full-stack app for doctors, patients and pharmacists to manage patient data securely, including appointments, prescriptions and medical history.',
    technologies: ['Flutter', 'FastAPI', 'PostgreSQL', 'Docker', 'AWS'],
    githubUrl: '$_personal/Medilink',
    imageUrl: 'assets/images/medilink.png',
  ),
  Project(
    title: 'ML Library',
    description:
        'Web app that demonstrates real-world machine learning with interactive object detection, image classification and image segmentation demos.',
    technologies: [
      'Flutter',
      'FastAPI',
      'PyTorch',
      'Machine Learning',
      'Docker',
      'AWS'
    ],
    githubUrl: '$_personal/ml-library',
    imageUrl: 'assets/images/ml-library.png',
  ),
  Project(
    title: 'Global Beach Finder',
    description:
        'Beach discovery app with a Python data pipeline that collects beaches worldwide from OpenStreetMap and Nominatim, cleans and rates them, and stores them in Firebase for a Flutter client with search and reviews.',
    technologies: [
      'Python',
      'Flutter',
      'Firebase',
      'Cloud Firestore',
      'OpenStreetMap',
      'Docker',
    ],
    githubUrl: '$_personal/beach-database',
    imageUrl: 'assets/images/Global-Beach-Finder.png',
  ),
  Project(
    title: 'PayPal Subscription Integration',
    description:
        'Added PayPal subscriptions to a FlutterFlow app with monthly and yearly plans, using custom actions for payment processing and subscription management on a Supabase backend.',
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
    title: 'FastAPI-Render',
    description:
        'Template project for deploying a FastAPI service securely on Render, with API-key authentication, environment-variable configuration and automatic Docker deployments.',
    technologies: [
      'FastAPI',
      'Python',
      'Docker',
      'Render',
      'GitHub',
      'REST API'
    ],
    githubUrl: '$_personal/fastapi-render',
    imageUrl: 'assets/images/fastapi-render.png',
  ),
  Project(
    title: 'Notebook-to-API Deployment Template',
    description:
        'GitHub template that serves functions from Jupyter notebooks as FastAPI endpoints on Render, with build and start scripts.',
    technologies: [
      'FastAPI',
      'Python',
      'Jupyter',
      'Render',
    ],
    githubUrl: '$_personal/fastapi-ipynb-render',
  ),
  Project(
    title: 'Self-Hosted CI/CD & PaaS Setups',
    description:
        'Runbooks and configs for Jenkins in Docker with persistent volumes, Dokku-style container deployment of a Python service, and a FastAPI integration with WordPress.',
    technologies: [
      'Jenkins',
      'Docker',
      'Dokku',
      'FastAPI',
      'Python',
    ],
    githubUrl: '$_personal/jenkins_docker',
  ),
  Project(
    title: 'Personal Portfolio Website',
    description:
        'This site: a responsive Flutter web portfolio with dark/light themes and animated components, deployed to GitHub Pages by GitHub Actions.',
    technologies: [
      'Flutter',
      'Dart',
      'GitHub Pages',
      'Provider',
      'GitHub Actions',
      'Responsive Design'
    ],
    githubUrl: '$_personal/Personal-website',
    liveUrl: 'https://portfolio.codewithrk.in',
    imageUrl: 'assets/images/personal-website.png',
  ),

  // === Personal: ML & computer vision foundations ===
  Project(
    title: 'Object Detection using Roboflow and YOLOv8',
    description:
        'YOLOv8 detectors trained with Roboflow for real-time hand-gesture recognition and for detecting football players in live video, recordings and images.',
    technologies: [
      'Python',
      'YOLOv8',
      'Roboflow',
      'Computer Vision',
      'OpenCV'
    ],
    githubUrl: '$_personal/Object-detection--Roboflow',
    imageUrl: 'assets/images/object-detection.png',
  ),
  Project(
    title: 'YOLOv8 Object Detection Playground',
    description:
        'YOLOv8 object detection on Roboflow and custom datasets, on images, video files and live webcam input.',
    technologies: [
      'Python',
      'YOLOv8',
      'Ultralytics',
      'Computer Vision',
    ],
    githubUrl: '$_personal/YOLOv8-OD-pretrained',
  ),
  Project(
    title: 'Eye For Blind',
    description:
        'Deep learning and NLP app that captions images with an attention-based CNN-RNN model and reads the caption aloud with text-to-speech for visually impaired users.',
    technologies: [
      'Deep Learning',
      'Computer Vision',
      'NLP',
      'TensorFlow',
      'Text-to-Speech',
    ],
    githubUrl: '$_personal/Eye-For-Blind',
  ),
  Project(
    title: 'Gesture Recognition for Smart TVs',
    description:
        'Video classifier that recognises five hand gestures so a smart TV can be controlled without a remote, comparing 3D CNN and CNN + RNN architectures.',
    technologies: [
      'Deep Learning',
      'Computer Vision',
      'CNN',
      'RNN',
      'Keras',
    ],
    githubUrl: '$_personal/Gesture-Recognition-',
  ),
  Project(
    title: 'Reinforcement Learning Cab Revenue Agent',
    description:
        'Deep Q-Network agent trained in a custom environment to maximise a cab company\'s revenue, comparing two DQN architectures.',
    technologies: [
      'Reinforcement Learning',
      'DQN',
      'Python',
      'Machine Learning',
    ],
    githubUrl: '$_personal/Reinforcement-Learning',
  ),
  Project(
    title: 'RASA Restaurant Chatbot',
    description:
        'Conversational chatbot built with the RASA framework that searches restaurants by area, cuisine and budget using Zomato data.',
    technologies: [
      'Python',
      'RASA',
      'NLP',
      'Chatbot',
    ],
    githubUrl: '$_personal/Building-Chatbot',
  ),
  Project(
    title: 'PyTorch Deep Learning Experiments',
    description:
        'PyTorch notebooks built from scratch, including a CNN handwritten-digit classifier on MNIST and image classification on CIFAR-100.',
    technologies: [
      'PyTorch',
      'Deep Learning',
      'CNN',
      'Jupyter',
    ],
    githubUrl: '$_personal/pytorch-deep-learning',
  ),
  Project(
    title: 'ML Case Studies: Bike Sharing & Lending Club',
    description:
        'Regression model of shared-bike demand drivers, and exploratory risk analysis of Lending Club loan data to identify signals of default.',
    technologies: [
      'Python',
      'Machine Learning',
      'Scikit-learn',
      'Pandas',
      'Statistics',
    ],
    githubUrl: '$_personal/Bike-Sharing',
  ),
  Project(
    title: 'FastAPI & Docker Foundations',
    description:
        'Early backend work: a FastAPI app with SQLAlchemy and Alembic migrations, and Docker Compose service-to-service communication with linting and pre-commit hooks.',
    technologies: [
      'Python',
      'FastAPI',
      'SQLAlchemy',
      'Alembic',
      'Docker',
    ],
    githubUrl: '$_personal/docker-communication',
  ),
];
