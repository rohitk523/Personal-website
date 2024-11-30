// home_screen.dart
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../utils/constants.dart';
import '../widgets/social_links.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 80,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildIntroText(context),
          SizedBox(height: 30),
          _buildMainContent(context),
          SizedBox(height: 40),
          _buildSocialSection(context),
        ],
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Constants.name,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        SizedBox(height: 15),
        Container(
          height: 60, // Fixed height for animation
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                Constants.title,
                textStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey[400]
                          : Colors.grey[700],
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
          constraints: BoxConstraints(maxWidth: 1500),
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
