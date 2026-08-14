import 'package:flutter/material.dart';

class AppTheme {
  static const primary = Color(0xFF0B3D32);
  static const secondary = Color(0xFFC9A45C);
  static const surface = Color(0xFFF7F1E3);
  static const darkSurface = Color(0xFF10231F);

  static ThemeData light() {
    final scheme = ColorScheme.fromSeed(
      seedColor: primary,
      brightness: Brightness.light,
    ).copyWith(primary: primary, secondary: secondary, surface: surface);

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: surface,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: primary,
        foregroundColor: Colors.white,
      ),
    );
  }

  static ThemeData dark() {
    final scheme = ColorScheme.fromSeed(
      seedColor: primary,
      brightness: Brightness.dark,
    ).copyWith(
      primary: const Color(0xFF5FC7A8),
      secondary: secondary,
      surface: darkSurface,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: darkSurface,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Color(0xFF082B24),
        foregroundColor: Colors.white,
      ),
    );
  }
}
