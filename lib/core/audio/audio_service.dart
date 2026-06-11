import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Two-channel audio: `voice` for narration (new playback interrupts the
/// previous one) and `sfx` for short effects that may overlap the voice.
abstract class AudioService {
  Future<void> playVoice(String? assetPath);
  Future<void> playSfx(String? assetPath);

  /// Plays the first asset that actually exists — e.g. a vehicle's engine
  /// sound, falling back to its spoken name while sfx are unrecorded.
  Future<void> playFirstAvailable(List<String?> candidates);

  Future<void> stopAll();

  /// Instant tactile click for buttons; no asset needed.
  void tapFeedback();

  void dispose();
}

/// Production implementation backed by audioplayers.
///
/// Asset paths come from content manifests and use the full
/// `assets/audio/...` form. Missing assets are skipped silently — content
/// is built ahead of recordings, so absence is an expected state, not an
/// error.
class SystemAudioService implements AudioService {
  SystemAudioService() {
    _voice.setReleaseMode(ReleaseMode.stop);
    _sfx.setReleaseMode(ReleaseMode.stop);
  }

  final _voice = AudioPlayer(playerId: 'voice');
  final _sfx = AudioPlayer(playerId: 'sfx');

  Set<String>? _availableAssets;

  Future<bool> _exists(String assetPath) async {
    _availableAssets ??=
        (await AssetManifest.loadFromAssetBundle(rootBundle))
            .listAssets()
            .toSet();
    return _availableAssets!.contains(assetPath);
  }

  /// Strips the `assets/` prefix that audioplayers adds back internally.
  String _sourcePath(String assetPath) =>
      assetPath.startsWith('assets/') ? assetPath.substring(7) : assetPath;

  Future<void> _play(AudioPlayer player, String? assetPath) async {
    if (assetPath == null) return;
    try {
      if (!await _exists(assetPath)) return;
      await player.stop();
      await player.play(AssetSource(_sourcePath(assetPath)));
    } catch (error) {
      debugPrint('AudioService: failed to play $assetPath: $error');
    }
  }

  @override
  Future<void> playVoice(String? assetPath) => _play(_voice, assetPath);

  @override
  Future<void> playSfx(String? assetPath) => _play(_sfx, assetPath);

  @override
  Future<void> playFirstAvailable(List<String?> candidates) async {
    for (final candidate in candidates) {
      if (candidate != null && await _exists(candidate)) {
        return _play(_voice, candidate);
      }
    }
  }

  @override
  Future<void> stopAll() async {
    await _voice.stop();
    await _sfx.stop();
  }

  @override
  void tapFeedback() {
    SystemSound.play(SystemSoundType.click);
  }

  @override
  void dispose() {
    _voice.dispose();
    _sfx.dispose();
  }
}

/// No-op implementation for widget tests; records what would have played.
class SilentAudioService implements AudioService {
  final played = <String>[];

  @override
  Future<void> playVoice(String? assetPath) async {
    if (assetPath != null) played.add(assetPath);
  }

  @override
  Future<void> playSfx(String? assetPath) async {
    if (assetPath != null) played.add(assetPath);
  }

  @override
  Future<void> playFirstAvailable(List<String?> candidates) async {
    final first = candidates.whereType<String>().firstOrNull;
    if (first != null) played.add(first);
  }

  @override
  Future<void> stopAll() async {}

  @override
  void tapFeedback() {}

  @override
  void dispose() {}
}

final audioServiceProvider = Provider<AudioService>((ref) {
  final service = SystemAudioService();
  ref.onDispose(service.dispose);
  return service;
});
