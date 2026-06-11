import 'package:flutter/material.dart';

import '../app/palette.dart';

enum ModuleType { alphabet, flashcards }

/// Static registry of the six learning modules.
///
/// Pre-readers navigate by color + glyph, so each module keeps a stable
/// accent color and a visual identity: a letterform for alphabet modules,
/// an SVG illustration for the others (no emoji, ever).
class ModuleInfo {
  const ModuleInfo({
    required this.id,
    required this.order,
    required this.type,
    required this.colorName,
    required this.title,
    this.glyph,
    this.artAsset,
    this.implemented = false,
  }) : assert(glyph != null || artAsset != null);

  final String id;
  final int order;
  final ModuleType type;
  final String colorName;

  /// Display title by language code; kept here (not only in manifests)
  /// so unbuilt modules still render on the home grid.
  final Map<String, String> title;

  /// Spoken module name, played on long-press of the module card.
  String get nameAudio => 'assets/audio/en/ui/$id.m4a';

  /// Letterform shown on the module card (alphabet modules).
  final String? glyph;

  /// SVG illustration asset (flashcard modules).
  final String? artAsset;

  /// Unimplemented modules show on the home grid but play "coming soon".
  final bool implemented;

  Color get color => Palette.byName[colorName]!;
  Color get softColor => Palette.softByName[colorName]!;

  String get route => switch (type) {
        ModuleType.alphabet => '/alphabet/$id',
        ModuleType.flashcards => '/cards/$id',
      };
}

const kModules = <ModuleInfo>[
  ModuleInfo(
    id: 'english',
    order: 1,
    type: ModuleType.alphabet,
    colorName: 'coral',
    title: {
      'en': 'English Alphabets',
      'bn': 'ইংরেজি বর্ণমালা',
      'ar': 'الحروف الإنجليزية',
    },
    glyph: 'Aa',
    implemented: true,
  ),
  ModuleInfo(
    id: 'vehicles',
    order: 2,
    type: ModuleType.flashcards,
    colorName: 'grape',
    title: {'en': 'Vehicles', 'bn': 'যানবাহন', 'ar': 'المركبات'},
    artAsset: 'assets/images/modules/train.svg',
    implemented: true,
  ),
  ModuleInfo(
    id: 'bangla',
    order: 3,
    type: ModuleType.alphabet,
    colorName: 'leaf',
    title: {
      'en': 'Bangla Alphabets',
      'bn': 'বাংলা বর্ণমালা',
      'ar': 'الحروف البنغالية',
    },
    glyph: 'আ',
  ),
  ModuleInfo(
    id: 'arabic',
    order: 4,
    type: ModuleType.alphabet,
    colorName: 'sky',
    title: {
      'en': 'Arabic Alphabets',
      'bn': 'আরবি বর্ণমালা',
      'ar': 'الحروف العربية',
    },
    glyph: 'ا',
  ),
  ModuleInfo(
    id: 'animals',
    order: 5,
    type: ModuleType.flashcards,
    colorName: 'mango',
    title: {'en': 'Animals', 'bn': 'প্রাণী', 'ar': 'الحيوانات'},
    artAsset: 'assets/images/modules/lion.svg',
  ),
  ModuleInfo(
    id: 'fruits',
    order: 6,
    type: ModuleType.flashcards,
    colorName: 'berry',
    title: {'en': 'Fruits', 'bn': 'ফল', 'ar': 'الفواكه'},
    artAsset: 'assets/images/modules/mango.svg',
  ),
];

ModuleInfo moduleById(String id) =>
    kModules.firstWhere((module) => module.id == id);
