import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/constants.dart';
import '../utils/helpers.dart';

class SocialLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _SocialButton(
          icon: FontAwesomeIcons.github,
          url: Constants.githubUrl,
          tooltip: 'GitHub',
        ),
        SizedBox(width: 16),
        _SocialButton(
          icon: FontAwesomeIcons.linkedin,
          url: Constants.linkedinUrl,
          tooltip: 'LinkedIn',
        ),
        SizedBox(width: 16),
        _SocialButton(
          icon: FontAwesomeIcons.envelope,
          url: 'mailto:${Constants.email}',
          tooltip: 'Email',
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final String url;
  final String tooltip;

  const _SocialButton({
    required this.icon,
    required this.url,
    required this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: IconButton(
        icon: FaIcon(icon),
        onPressed: () => Helpers.launchURL(url),
        iconSize: 20,
        color: Theme.of(context).primaryColor,
        splashRadius: 24,
      ),
    );
  }
}
