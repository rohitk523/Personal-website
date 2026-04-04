// lib/theme/app_theme.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // New 2026 Color Palette: Violet + Mint
  static const Color _primaryLight = Color(0xFF6D28D9);     // Deep Violet
  static const Color _primaryDark = Color(0xFF8B5CF6);      // Lighter Violet
  static const Color _accentLight = Color(0xFF059669);      // Emerald
  static const Color _accentDark = Color(0xFF06D6A0);       // Mint Green
  static const Color _backgroundDark = Color(0xFF0D1117);   // GitHub Dark
  static const Color _surfaceDark = Color(0xFF161B22);      // Card Dark
  static const Color _backgroundLight = Color(0xFFFAFBFC);  // Warm White
  static const Color _surfaceLight = Color(0xFFFFFFFF);     // White
  static const Color _borderDark = Color(0xFF30363D);
  static const Color _borderLight = Color(0xFFE5E7EB);

  // Gradient colors
  static const Color gradientStart = Color(0xFF7C3AED);     // Violet
  static const Color gradientEnd = Color(0xFF06D6A0);       // Mint

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: _primaryLight,
    scaffoldBackgroundColor: _backgroundLight,
    cardColor: _surfaceLight,
    colorScheme: ColorScheme.light(
      primary: _primaryLight,
      secondary: _accentLight,
      surface: _surfaceLight,
      background: _backgroundLight,
      error: Color(0xFFDC2626),
      tertiary: _accentLight,
    ),
    dividerColor: _borderLight,
    textTheme: TextTheme(
      displayLarge: GoogleFonts.inter(
        fontSize: 42,
        fontWeight: FontWeight.bold,
        color: Color(0xFF1F2937),
        letterSpacing: -1.5,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Color(0xFF1F2937),
        letterSpacing: -0.5,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: Color(0xFF1F2937),
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Color(0xFF1F2937),
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        color: Color(0xFF4B5563),
        height: 1.7,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        color: Color(0xFF6B7280),
        height: 1.6,
      ),
    ),
    cardTheme: CardThemeData(
      color: _surfaceLight,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: _borderLight, width: 1),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _primaryLight,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 0,
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
      secondary: _accentDark,
      surface: _surfaceDark,
      background: _backgroundDark,
      error: Color(0xFFF87171),
      tertiary: _accentDark,
    ),
    dividerColor: _borderDark,
    textTheme: TextTheme(
      displayLarge: GoogleFonts.inter(
        fontSize: 42,
        fontWeight: FontWeight.bold,
        color: Color(0xFFE6EDF3),
        letterSpacing: -1.5,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Color(0xFFE6EDF3),
        letterSpacing: -0.5,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: Color(0xFFE6EDF3),
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Color(0xFFE6EDF3),
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        color: Color(0xFF8B949E),
        height: 1.7,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        color: Color(0xFF8B949E),
        height: 1.6,
      ),
    ),
    cardTheme: CardThemeData(
      color: _surfaceDark,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: _borderDark, width: 1),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _primaryDark,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 0,
      ),
    ),
    iconTheme: IconThemeData(
      color: _accentDark,
      size: 24,
    ),
  );
}
