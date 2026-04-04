class Constants {
  // Personal Information
  static const String name = "Rohit Kale";
  static const String title = "AI/ML Engineer";
  static const String email = "rohitkale523@gmail.com";
  static const String location = "Pune, Maharashtra, India";
  static const String nickname = "RK";

  // Typewriter titles
  static const List<String> animatedTitles = [
    "AI/ML Engineer",
    "Computer Vision Engineer",
    "Full Stack Developer",
    "Cloud Architect",
  ];

  // Social Links
  static const String githubUrl = "https://github.com/rohitk523";
  static const String linkedinUrl =
      "https://www.linkedin.com/in/rohit-kale-64b5912010/";

  // Section Titles
  static const String aboutTitle = "About Me";
  static const String experienceTitle = "Experience";
  static const String projectsTitle = "Projects";
  static const String skillsTitle = "Skills";
  static const String blogTitle = "Blog";

  // About Section
  static const String aboutDescription = """AI/ML Engineer with 5+ years of experience building production-grade computer vision, NLP, and full-stack AI systems. At Cellstrat AI, I built the UBall basketball analytics platform achieving 97% shot detection accuracy using YOLOv11, SAM2, and dual-angle fusion deployed on NVIDIA Jetson and GCP.

I specialize in deploying end-to-end ML pipelines, from model training to production serving, using Python, FastAPI, PyTorch, Docker, and cloud infrastructure (AWS & GCP). My work spans real-time computer vision systems, Voice AI healthcare platforms, RAG-powered chat applications, and scalable microservice architectures.

MS in Artificial Intelligence (Liverpool John Moores) | PGD ML & AI (IIIT Bangalore) | AWS Certified Solutions Architect""";

  // Skills Categories
  static const List<String> skillCategories = [
    "AI & ML",
    "Backend & APIs",
    "Cloud & DevOps",
    "Frontend"
  ];

  // Animation Durations
  static const Duration defaultAnimationDuration = Duration(milliseconds: 200);
  static const Duration pageTransitionDuration = Duration(milliseconds: 300);
}
