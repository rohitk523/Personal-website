import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../utils/constants.dart';
import '../widgets/social_links.dart';

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
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'Hi, my name is',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
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
        Text(
          Constants.name,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: isSmallScreen ? 32 : 42,
              ),
        ),
        SizedBox(height: 15),
        Container(
          height: isSmallScreen ? 40 : 60,
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                Constants.title,
                textStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey[400]
                          : Colors.grey[700],
                      fontSize: isSmallScreen ? 24 : 32,
                    ),
                speed: Duration(milliseconds: 100),
              ),
            ],
            totalRepeatCount: 1,
            displayFullTextOnTap: true,
          ),
        ),
        SizedBox(height: 30),
        Container(
          width: double.infinity,
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

  Widget _buildSocialSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).cardColor.withOpacity(0.5)
            : Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
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
