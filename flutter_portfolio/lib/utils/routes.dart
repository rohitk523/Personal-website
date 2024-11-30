import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/about_screen.dart';
import '../screens/portfolio_screen.dart';
import '../screens/blog_screen.dart';

class Routes {
  static const String home = '/';
  static const String about = '/about';
  static const String portfolio = '/portfolio';
  static const String blog = '/blog';

  static Map<String, Widget Function(BuildContext)> get routes => {
        home: (context) => HomeScreen(),
        about: (context) => AboutScreen(),
        portfolio: (context) => PortfolioScreen(),
        blog: (context) => BlogScreen(),
      };
}
