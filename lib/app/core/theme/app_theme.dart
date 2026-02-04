import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color background = Color(0xFF0B1120); // Deep Navy/Black
  static const Color primary = Color(0xFFF97316); // Bright Orange
  static const Color secondary = Color(0xFF64748B); // Slate Grey
  static const Color surface = Color(0xFF1E293B); // Lighter Navy
  static const Color text = Color(0xFFF8FAFC); // Off-white

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: background,
      primaryColor: primary,
      colorScheme: const ColorScheme.dark(
        primary: primary,
        secondary: secondary,
        surface: surface,
        background: background,
      ),
      textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme)
          .copyWith(
            displayLarge: GoogleFonts.spaceGrotesk(
              fontSize: 56,
              fontWeight: FontWeight.bold,
              color: text,
            ),
            displayMedium: GoogleFonts.spaceGrotesk(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: text,
            ),
            bodyLarge: GoogleFonts.inter(
              fontSize: 16,
              color: text.withOpacity(0.8),
            ),
          ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
    );
  }
}
