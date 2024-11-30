// lib/theme/app_theme.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Common colors
  static const Color _primaryLight = Color(0xFF1E88E5);
  static const Color _primaryDark = Color(0xFF64FFDA);
  static const Color _backgroundDark = Color(0xFF0A192F);
  static const Color _surfaceDark = Color(0xFF172A45);
  static const Color _backgroundLight = Color(0xFFF8F9FA);
  static const Color _surfaceLight = Colors.white;

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: _primaryLight,
    scaffoldBackgroundColor: _backgroundLight,
    cardColor: _surfaceLight,
    colorScheme: ColorScheme.light(
      primary: _primaryLight,
      secondary: Color(0xFF03A9F4),
      surface: _surfaceLight,
      background: _backgroundLight,
      error: Colors.red.shade700,
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.inter(
        fontSize: 42,
        fontWeight: FontWeight.bold,
        color: Color(0xFF2C3E50),
        letterSpacing: -1,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Color(0xFF2C3E50),
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Color(0xFF2C3E50),
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Color(0xFF2C3E50),
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        color: Color(0xFF4A5568),
        height: 1.6,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        color: Color(0xFF4A5568),
        height: 1.5,
      ),
    ),
    cardTheme: CardTheme(
      color: _surfaceLight,
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _primaryLight,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    iconTheme: IconThemeData(
      color: _primaryLight,
      size: 24,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: _primaryDark,
    scaffoldBackgroundColor: _backgroundDark,
    cardColor: _surfaceDark,
    colorScheme: ColorScheme.dark(
      primary: _primaryDark,
      secondary: Color(0xFF80CBC4),
      surface: _surfaceDark,
      background: _backgroundDark,
      error: Colors.red.shade300,
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.inter(
        fontSize: 42,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        letterSpacing: -1,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        color: Colors.white70,
        height: 1.6,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        color: Colors.white70,
        height: 1.5,
      ),
    ),
    cardTheme: CardTheme(
      color: _surfaceDark,
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _primaryDark,
        foregroundColor: _backgroundDark,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    iconTheme: IconThemeData(
      color: _primaryDark,
      size: 24,
    ),
  );
}
