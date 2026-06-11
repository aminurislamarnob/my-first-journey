import 'package:flutter/material.dart';

/// Brand palette from the Little Letters one-pager.
///
/// Saturated colors are reserved for interactive/focal elements; soft
/// variants and warm off-whites are used for surfaces so screens stay
/// comfortable for young eyes (never pure white).
abstract final class Palette {
  static const coral = Color(0xFFFF6B4A);
  static const coralDark = Color(0xFFC84F3E);
  static const mango = Color(0xFFFFB627);
  static const leaf = Color(0xFF2E8B6A);
  static const leafSoft = Color(0xFFD8F0E2);
  static const sky = Color(0xFF4A8FD8);
  static const skySoft = Color(0xFFDFEEFB);
  static const berry = Color(0xFFC84777);
  static const berrySoft = Color(0xFFFBE0EA);
  static const grape = Color(0xFF7A4FBF);
  static const grapeSoft = Color(0xFFECE2FA);
  static const ink = Color(0xFF1A1530);
  static const inkSoft = Color(0xFF5B5670);
  static const inkMuted = Color(0xFF8A8499);
  static const paper = Color(0xFFFFFCF5);
  static const cream = Color(0xFFFFF4E0);
  static const line = Color(0xFFEEE6D5);
  static const coralSoft = Color(0xFFFFE3DB);
  static const mangoSoft = Color(0xFFFFEFCB);

  /// Module accent colors by manifest `color` name.
  static const byName = <String, Color>{
    'coral': coral,
    'mango': mango,
    'leaf': leaf,
    'sky': sky,
    'berry': berry,
    'grape': grape,
  };

  /// Soft surface variant for each accent name.
  static const softByName = <String, Color>{
    'coral': coralSoft,
    'mango': mangoSoft,
    'leaf': leafSoft,
    'sky': skySoft,
    'berry': berrySoft,
    'grape': grapeSoft,
  };
}
