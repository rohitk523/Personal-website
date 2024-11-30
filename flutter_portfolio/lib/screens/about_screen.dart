import 'package:flutter/material.dart';
import '../widgets/skill_card.dart';
import '../utils/constants.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Constants.aboutTitle,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(height: 30),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Constants.aboutDescription,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Education',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    SizedBox(height: 20),
                    _buildEducationTimeline(context),
                  ],
                ),
              ),
              SizedBox(width: 50),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Skills',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    SizedBox(height: 20),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        SkillCard(skill: 'Python'),
                        SkillCard(skill: 'Flutter'),
                        SkillCard(skill: 'Machine Learning'),
                        SkillCard(skill: 'Data Analysis'),
                        SkillCard(skill: 'AWS'),
                        SkillCard(skill: 'Docker'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEducationTimeline(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildEducationItem(
          context,
          'Liverpool John Moores University',
          'Master of Science - MS, Artificial Intelligence',
          '2022 - 2023',
        ),
        SizedBox(height: 20),
        _buildEducationItem(
          context,
          'IIIT Bangalore',
          'Post Graduate Diploma (PGD) - ML and AI',
          '2021 - 2022',
        ),
        SizedBox(height: 20),
        _buildEducationItem(
          context,
          'NIT, Nagpur',
          'Bachelor of Technology (B.Tech)',
          '2016 - 2020',
        ),
      ],
    );
  }

  Widget _buildEducationItem(
    BuildContext context,
    String institution,
    String degree,
    String period,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          institution,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: 5),
        Text(
          degree,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          period,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).primaryColor,
              ),
        ),
      ],
    );
  }
}
