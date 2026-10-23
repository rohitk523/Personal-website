import 'package:flutter/material.dart';
import '../widgets/skill_card.dart';
import '../utils/constants.dart';
import '../theme/app_theme.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 800;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(isSmallScreen ? 20 : 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            SizedBox(height: 40),
            isSmallScreen
                ? _buildMobileContent(context)
                : _buildMainContent(context),
            SizedBox(height: 40),
            _buildExperienceSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [AppTheme.gradientStart, AppTheme.gradientEnd],
            ).createShader(bounds),
            child: Text(
              Constants.aboutTitle,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: MediaQuery.of(context).size.width < 600 ? 28 : 42,
                    color: Colors.white,
                  ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            Constants.aboutDescription,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  height: 1.8,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileContent(BuildContext context) {
    return Column(
      children: [
        _buildEducationSection(context),
        SizedBox(height: 40),
        _buildSkillsSection(context),
      ],
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: _buildEducationSection(context),
        ),
        SizedBox(width: 40),
        Expanded(
          flex: 2,
          child: _buildSkillsSection(context),
        ),
      ],
    );
  }

  Widget _buildEducationSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Education',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: 24),
          _buildEducationTimeline(context),
        ],
      ),
    );
  }

  Widget _buildEducationTimeline(BuildContext context) {
    return Column(
      children: [
        _buildEducationItem(
          context,
          'Liverpool John Moores University',
          'Master of Science - MS, Artificial Intelligence',
          '2021 - 2023',
          isFirst: true,
        ),
        _buildEducationItem(
          context,
          'IIIT Bangalore',
          'Post Graduate Diploma (PGD) - ML and AI',
          '2021 - 2022',
        ),
        _buildEducationItem(
          context,
          'VNIT, Nagpur',
          'Bachelor of Technology (B.Tech)',
          '2016 - 2020',
          isLast: true,
        ),
      ],
    );
  }

  Widget _buildEducationItem(
    BuildContext context,
    String institution,
    String degree,
    String period, {
    bool isFirst = false,
    bool isLast = false,
  }) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppTheme.gradientStart, AppTheme.gradientEnd],
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppTheme.gradientStart.withOpacity(0.5),
                          AppTheme.gradientEnd.withOpacity(0.2),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(width: 16),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    institution,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 8),
                  Text(
                    degree,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 4),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppTheme.gradientStart.withOpacity(0.1),
                          AppTheme.gradientEnd.withOpacity(0.1),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      period,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skills',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: 8),
          Text(
            'AI & Machine Learning',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w600,
                ),
          ),
          SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              SkillCard(skill: 'PyTorch', progress: 0.85),
              SkillCard(skill: 'YOLOv8/v11', progress: 0.9),
              SkillCard(skill: 'RF-DETR', progress: 0.8),
              SkillCard(skill: 'SAM 2 / SAM 3', progress: 0.8),
              SkillCard(skill: 'ByteTrack', progress: 0.85),
              SkillCard(skill: 'OpenCV', progress: 0.85),
              SkillCard(skill: 'Gemini VLM', progress: 0.8),
              SkillCard(skill: 'OpenAI API', progress: 0.85),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'GenAI & Agents',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w600,
                ),
          ),
          SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              SkillCard(skill: 'LangGraph', progress: 0.8),
              SkillCard(skill: 'LangChain', progress: 0.8),
              SkillCard(skill: 'RAG', progress: 0.85),
              SkillCard(skill: 'MCP', progress: 0.75),
              SkillCard(skill: 'Google ADK', progress: 0.75),
              SkillCard(skill: 'LiveKit', progress: 0.7),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Backend & APIs',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w600,
                ),
          ),
          SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              SkillCard(skill: 'Python', progress: 0.9),
              SkillCard(skill: 'FastAPI', progress: 0.9),
              SkillCard(skill: 'PostgreSQL', progress: 0.85),
              SkillCard(skill: 'Redis', progress: 0.75),
              SkillCard(skill: 'Celery', progress: 0.8),
              SkillCard(skill: 'Supabase', progress: 0.8),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Cloud & DevOps',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w600,
                ),
          ),
          SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              SkillCard(skill: 'AWS', progress: 0.85),
              SkillCard(skill: 'GCP', progress: 0.75),
              SkillCard(skill: 'Docker', progress: 0.85),
              SkillCard(skill: 'GitHub Actions', progress: 0.9),
              SkillCard(skill: 'CloudFlare', progress: 0.7),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Frontend',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w600,
                ),
          ),
          SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              SkillCard(skill: 'Next.js', progress: 0.75),
              SkillCard(skill: 'React', progress: 0.7),
              SkillCard(skill: 'TypeScript', progress: 0.7),
              SkillCard(skill: 'Flutter', progress: 0.65),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceSection(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 800;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Experience',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: 24),
          _buildExperienceItem(
            context,
            'AI/ML Engineer',
            'Cellstrat AI',
            '2025 - Present',
            [
              'Built the UBall 4-camera CV pipeline: detection, pose, jersey OCR, cross-camera identity and a ball-possession state machine. On blind games: 88-94% shot detection, 89-98% make/miss on 3 of 4',
              'Raised far-angle shot detection from 68% to 93% by retraining, then designed dual-angle fusion and an interpretable made/miss model fitted to human labels',
              'Trained an in-domain RF-DETR detector and built Gemini VLM play narration plus a Vertex AI fine-tuning pipeline on GCP',
              'Built edge ingestion on NVIDIA Jetson and the FastAPI / Supabase / Celery product backend across 10+ services',
              'Shipped CellAssist voice AI (OpenAI Realtime API) and NxChat enterprise RAG (LangChain, OpenSearch, Bedrock)',
            ],
            isFirst: true,
          ),
          _buildExperienceItem(
            context,
            'Software Engineer',
            'Independent Consultant',
            'Aug 2023 - 2024',
            [
              'Built domain-specific ChatGPT chatbots and PayPal subscription billing for FlutterFlow apps',
              'Automated payment-to-delivery workflows with n8n + OpenAI, with retries and error handling',
              'Containerized AI services with Docker on AWS with GitHub Actions CI/CD',
            ],
          ),
          _buildExperienceItem(
            context,
            'Analyst',
            'TheMathCompany',
            'Feb 2022 - Aug 2023',
            [
              'Built data processing pipelines for ML model training and evaluation',
              'Developed automation solutions integrating various APIs',
              'Created monitoring dashboards for system performance tracking',
            ],
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceItem(
    BuildContext context,
    String role,
    String company,
    String period,
    List<String> highlights, {
    bool isFirst = false,
    bool isLast = false,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 14,
                height: 14,
                margin: EdgeInsets.only(top: 4),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppTheme.gradientStart, AppTheme.gradientEnd],
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppTheme.gradientStart.withOpacity(0.4),
                          AppTheme.gradientEnd.withOpacity(0.1),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(width: 16),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(role, style: Theme.of(context).textTheme.titleLarge),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        company,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      SizedBox(width: 12),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppTheme.gradientStart.withOpacity(0.1),
                              AppTheme.gradientEnd.withOpacity(0.1),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          period,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  ...highlights.map((h) => Padding(
                    padding: EdgeInsets.only(bottom: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            h,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
