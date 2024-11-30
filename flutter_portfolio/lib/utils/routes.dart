import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/about_screen.dart';
import '../screens/portfolio_screen.dart';
import '../screens/blog_screen.dart';
import '../widgets/root_layout.dart';

class Routes {
  static const String home = '/';
  static const String about = '/about';
  static const String portfolio = '/portfolio';
  static const String blog = '/blog';

  static Map<String, Widget Function(BuildContext)> get routes => {
        home: (context) => RootLayout(child: HomeScreen()),
        about: (context) => RootLayout(child: AboutScreen()),
        portfolio: (context) => RootLayout(child: PortfolioScreen()),
        blog: (context) => RootLayout(child: BlogScreen()),
      };
}
