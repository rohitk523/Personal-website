import 'package:flutter/material.dart';
import 'navbar.dart';

class RootLayout extends StatelessWidget {
  final Widget child;

  const RootLayout({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(),
      body: SingleChildScrollView(
        child: child,
      ),
    );
  }
}
