import 'package:flutter/material.dart';

import 'palette.dart';

/// Per-script font families bundled in assets/fonts.
abstract final class AppFonts {
  static const latin = 'Baloo2';
  static const bangla = 'BalooDa2';
  static const arabic = 'NotoNaskhArabic';

  /// Dyslexia-friendly alternative for Latin text (parent-zone toggle).
  static const dyslexiaFriendly = 'Lexend';

  static String forLocale(Locale locale, {bool dyslexiaMode = false}) {
    return switch (locale.languageCode) {
      'bn' => bangla,
      'ar' => arabic,
      _ => dyslexiaMode ? dyslexiaFriendly : latin,
    };
  }
}

abstract final class AppTheme {
  static ThemeData forLocale(Locale locale, {bool dyslexiaMode = false}) {
    final family = AppFonts.forLocale(locale, dyslexiaMode: dyslexiaMode);
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Palette.coral,
        surface: Palette.paper,
        onSurface: Palette.ink,
      ),
      scaffoldBackgroundColor: Palette.paper,
      fontFamily: family,
      splashFactory: InkSparkle.splashFactory,
    );
    return base.copyWith(
      textTheme: base.textTheme.apply(
        bodyColor: Palette.ink,
        displayColor: Palette.ink,
      ),
      iconTheme: const IconThemeData(color: Palette.ink),
    );
  }
}
