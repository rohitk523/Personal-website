import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../utils/constants.dart';
import '../widgets/social_links.dart';
import '../theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return SingleChildScrollView(
      child: Container(
        constraints: BoxConstraints(
          minHeight: screenHeight - 80,
        ),
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: isSmallScreen ? 20 : 40,
          vertical: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildIntroText(context),
            SizedBox(height: isSmallScreen ? 20 : 30),
            _buildMainContent(context),
            SizedBox(height: isSmallScreen ? 30 : 40),
            _buildHighlightsRow(context),
            SizedBox(height: isSmallScreen ? 30 : 40),
            _buildSocialSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildIntroText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppTheme.gradientStart.withOpacity(0.15),
                AppTheme.gradientEnd.withOpacity(0.15),
              ],
            ),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: Theme.of(context).primaryColor.withOpacity(0.3),
            ),
          ),
          child: Text(
            'Hi, my name is',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildMainContent(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Gradient name
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [AppTheme.gradientStart, AppTheme.gradientEnd],
          ).createShader(bounds),
          child: Text(
            Constants.name,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: isSmallScreen ? 36 : 48,
                  color: Colors.white,
                ),
          ),
        ),
        SizedBox(height: 15),
        // Multiple animated titles
        AnimatedTextKit(
          animatedTexts: Constants.animatedTitles.map((title) =>
            TypewriterAnimatedText(
              title,
              textStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: isSmallScreen ? 22 : 30,
                  ),
              speed: Duration(milliseconds: 80),
            ),
          ).toList(),
          repeatForever: true,
          pause: Duration(milliseconds: 1500),
        ),
        SizedBox(height: 30),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Theme.of(context).dividerColor,
            ),
          ),
          child: Text(
            Constants.aboutDescription,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  height: 1.8,
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildHighlightsRow(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    final highlights = [
      {'number': '5+', 'label': 'Years Experience'},
      {'number': '97%', 'label': 'CV Accuracy'},
      {'number': '30+', 'label': 'Projects Built'},
      {'number': 'AWS', 'label': 'SA Certified'},
    ];

    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: highlights.map((h) => Container(
        width: isSmallScreen ? (MediaQuery.of(context).size.width - 56) / 2 : 160,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Theme.of(context).dividerColor),
        ),
        child: Column(
          children: [
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [AppTheme.gradientStart, AppTheme.gradientEnd],
              ).createShader(bounds),
              child: Text(
                h['number']!,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            SizedBox(height: 4),
            Text(
              h['label']!,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      )).toList(),
    );
  }

  Widget _buildSocialSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Connect with me',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 16),
          SocialLinks(),
        ],
      ),
    );
  }
}
