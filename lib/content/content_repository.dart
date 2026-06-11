import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/models/content_models.dart';

/// Loads bundled module manifests from assets. Everything is offline.
class ContentRepository {
  ContentRepository({AssetBundle? bundle}) : _bundle = bundle ?? rootBundle;

  final AssetBundle _bundle;
  final _alphabetCache = <String, AlphabetManifest>{};
  final _flashcardCache = <String, FlashcardManifest>{};

  Future<Map<String, dynamic>> _loadJson(String moduleId) async {
    final raw = await _bundle.loadString('assets/content/$moduleId/manifest.json');
    return jsonDecode(raw) as Map<String, dynamic>;
  }

  Future<AlphabetManifest> loadAlphabet(String moduleId) async {
    return _alphabetCache[moduleId] ??=
        AlphabetManifest.fromJson(await _loadJson(moduleId));
  }

  Future<FlashcardManifest> loadFlashcards(String moduleId) async {
    return _flashcardCache[moduleId] ??=
        FlashcardManifest.fromJson(await _loadJson(moduleId));
  }
}

final contentRepositoryProvider =
    Provider<ContentRepository>((ref) => ContentRepository());

final alphabetManifestProvider =
    FutureProvider.family<AlphabetManifest, String>((ref, moduleId) {
  return ref.watch(contentRepositoryProvider).loadAlphabet(moduleId);
});

final flashcardManifestProvider =
    FutureProvider.family<FlashcardManifest, String>((ref, moduleId) {
  return ref.watch(contentRepositoryProvider).loadFlashcards(moduleId);
});
