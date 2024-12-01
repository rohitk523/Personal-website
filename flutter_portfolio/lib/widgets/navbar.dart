import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/theme_provider.dart';
import '../utils/constants.dart';
import '../utils/helpers.dart';
import '../utils/routes.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(80);

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

    return Container(
      height: preferredSize.height,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () => Navigator.pushNamed(context, Routes.home),
            child: Text(
              Constants.nickname,
              style: Theme.of(context).textTheme.headlineMedium,
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
                SizedBox(width: 20),
                _buildThemeToggle(context),
                SizedBox(width: 20),
                _buildResumeButton(context),
              ],
            )
          else
            Row(
              children: [
                _buildThemeToggle(context),
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () => _showMobileMenu(context),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildThemeToggle(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return IconButton(
      icon: Icon(
        themeProvider.themeMode == ThemeMode.dark
            ? Icons.light_mode
            : Icons.dark_mode,
      ),
      onPressed: () => themeProvider.toggleTheme(),
    );
  }

  Widget _buildResumeButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _openResume(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      child: Text('Resume'),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, Routes.home);
              },
            ),
            ListTile(
              title: Text('About'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, Routes.about);
              },
            ),
            ListTile(
              title: Text('Portfolio'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, Routes.portfolio);
              },
            ),
            ListTile(
              title: Text('Blog'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, Routes.blog);
              },
            ),
            ListTile(
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

class _NavbarItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isActive;

  const _NavbarItem({
    required this.title,
    required this.onTap,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: isActive ? Theme.of(context).primaryColor : null,
                fontWeight: isActive ? FontWeight.bold : null,
              ),
        ),
      ),
    );
  }
}
