class Constants {
  // Personal Information
  static const String name = "Rohit Kale";
  static const String title = "AI Engineer & Architect";
  static const String email = "rohitkale523@gmail.com";
  static const String location = "Pune, Maharashtra, India";
  static const String nickname = "RK";

  // Typewriter titles
  static const List<String> animatedTitles = [
    "AI Engineer & Architect",
    "Computer Vision Engineer",
    "GenAI & Agents Builder",
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
  static const String aboutDescription = """AI Engineer and architect with 4.5+ years of experience building production computer vision, LLM and agentic systems. At Cellstrat AI I built the computer vision stack behind UBall, a basketball analytics platform. Its 4-camera pipeline detects, tracks and identifies every player, follows ball possession, and scores shots, rebounds and turnovers. On blind held-out games it reaches 88-94% shot detection and 89-98% make/miss accuracy on 3 of 4 games.

I design systems end to end: Jetson edge devices capture the video, AWS GPU jobs run the models, a GCP Vertex AI loop handles fine-tuning, and a FastAPI / Supabase backend serves the product. I have also shipped voice AI (OpenAI Realtime), enterprise RAG and multi-agent LLM apps built with LangGraph, Google ADK and MCP.

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
