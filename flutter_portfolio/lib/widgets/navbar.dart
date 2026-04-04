import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:provider/provider.dart';
import '../theme/theme_provider.dart';
import '../theme/app_theme.dart';
import '../utils/constants.dart';
import '../utils/helpers.dart';
import '../utils/routes.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(72);

  Future<void> _openResume(BuildContext context) async {
    const resumeUrl =
        'https://raw.githubusercontent.com/rohitk523/Personal-website/main/flutter_portfolio/assets/resume/resume.pdf';
    try {
      await Helpers.launchURL(resumeUrl);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not open resume. Please try again later.'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String currentRoute = ModalRoute.of(context)?.settings.name ?? Routes.home;

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          height: preferredSize.height,
          padding: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.85),
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).dividerColor,
                width: 1,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo with gradient
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, Routes.home),
                child: ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    colors: [AppTheme.gradientStart, AppTheme.gradientEnd],
                  ).createShader(bounds),
                  child: Text(
                    Constants.nickname,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
              ),
              if (MediaQuery.of(context).size.width > 768)
                Row(
                  children: [
                    _NavbarItem(
                      title: 'Home',
                      isActive: currentRoute == Routes.home,
                      onTap: () => Navigator.pushNamed(context, Routes.home),
                    ),
                    _NavbarItem(
                      title: 'About',
                      isActive: currentRoute == Routes.about,
                      onTap: () => Navigator.pushNamed(context, Routes.about),
                    ),
                    _NavbarItem(
                      title: 'Portfolio',
                      isActive: currentRoute == Routes.portfolio,
                      onTap: () => Navigator.pushNamed(context, Routes.portfolio),
                    ),
                    _NavbarItem(
                      title: 'Blog',
                      isActive: currentRoute == Routes.blog,
                      onTap: () => Navigator.pushNamed(context, Routes.blog),
                    ),
                    SizedBox(width: 16),
                    _buildThemeToggle(context),
                    SizedBox(width: 12),
                    _buildResumeButton(context),
                  ],
                )
              else
                Row(
                  children: [
                    _buildThemeToggle(context),
                    IconButton(
                      icon: Icon(Icons.menu_rounded),
                      onPressed: () => _showMobileMenu(context),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThemeToggle(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        icon: Icon(
          themeProvider.themeMode == ThemeMode.dark
              ? Icons.light_mode_rounded
              : Icons.dark_mode_rounded,
          size: 20,
        ),
        onPressed: () => themeProvider.toggleTheme(),
      ),
    );
  }

  Widget _buildResumeButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppTheme.gradientStart, AppTheme.gradientEnd],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        onPressed: () => _openResume(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          'Resume',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).dividerColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home_rounded),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, Routes.home);
              },
            ),
            ListTile(
              leading: Icon(Icons.person_rounded),
              title: Text('About'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, Routes.about);
              },
            ),
            ListTile(
              leading: Icon(Icons.work_rounded),
              title: Text('Portfolio'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, Routes.portfolio);
              },
            ),
            ListTile(
              leading: Icon(Icons.article_rounded),
              title: Text('Blog'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, Routes.blog);
              },
            ),
            ListTile(
              leading: Icon(Icons.description_rounded),
              title: Text('Resume'),
              onTap: () async {
                Navigator.pop(context);
                await _openResume(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _NavbarItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final bool isActive;

  const _NavbarItem({
    required this.title,
    required this.onTap,
    this.isActive = false,
  });

  @override
  State<_NavbarItem> createState() => _NavbarItemState();
}

class _NavbarItemState extends State<_NavbarItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: TextButton(
          onPressed: widget.onTap,
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: widget.isActive
                ? Theme.of(context).primaryColor.withOpacity(0.1)
                : _isHovered
                    ? Theme.of(context).primaryColor.withOpacity(0.05)
                    : Colors.transparent,
          ),
          child: Text(
            widget.title,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: widget.isActive
                      ? Theme.of(context).primaryColor
                      : _isHovered
                          ? Theme.of(context).primaryColor
                          : null,
                  fontWeight: widget.isActive ? FontWeight.w600 : FontWeight.w500,
                ),
          ),
        ),
      ),
    );
  }
}
