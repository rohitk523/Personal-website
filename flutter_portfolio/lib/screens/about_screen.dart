import 'package:flutter/material.dart';
import '../widgets/skill_card.dart';
import '../utils/constants.dart';

// about_screen.dart
class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          SizedBox(height: 40),
          _buildMainContent(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
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
            Constants.aboutTitle,
            style: Theme.of(context).textTheme.displayLarge,
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
          '2022 - 2023',
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
          'NIT, Nagpur',
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
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: Theme.of(context).primaryColor.withOpacity(0.3),
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
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      period,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500,
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
            'Skills',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: 24),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              SkillCard(skill: 'Python', progress: 0.9),
              SkillCard(skill: 'Flutter', progress: 0.8),
              SkillCard(skill: 'Machine Learning', progress: 0.85),
              SkillCard(skill: 'Data Analysis', progress: 0.8),
              SkillCard(skill: 'AWS', progress: 0.75),
              SkillCard(skill: 'Docker', progress: 0.8),
            ],
          ),
        ],
      ),
    );
  }
}
