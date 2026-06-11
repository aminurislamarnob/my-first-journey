import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Loaded once at startup (see bootstrap in main.dart) so settings
/// notifiers can read/write synchronously.
final sharedPreferencesProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError('Overridden in main()'),
);

class LocaleNotifier extends Notifier<Locale> {
  static const _key = 'app_locale';

  @override
  Locale build() {
    final saved = ref.read(sharedPreferencesProvider).getString(_key);
    return saved == null ? const Locale('en') : Locale(saved);
  }

  void set(Locale locale) {
    state = locale;
    ref.read(sharedPreferencesProvider).setString(_key, locale.languageCode);
  }
}

final localeProvider = NotifierProvider<LocaleNotifier, Locale>(
  LocaleNotifier.new,
);

class ReducedMotionNotifier extends Notifier<bool> {
  static const _key = 'reduced_motion';

  @override
  bool build() =>
      ref.read(sharedPreferencesProvider).getBool(_key) ?? false;

  void set(bool value) {
    state = value;
    ref.read(sharedPreferencesProvider).setBool(_key, value);
  }
}

final reducedMotionProvider = NotifierProvider<ReducedMotionNotifier, bool>(
  ReducedMotionNotifier.new,
);

class DyslexiaFontNotifier extends Notifier<bool> {
  static const _key = 'dyslexia_font';

  @override
  bool build() =>
      ref.read(sharedPreferencesProvider).getBool(_key) ?? false;

  void set(bool value) {
    state = value;
    ref.read(sharedPreferencesProvider).setBool(_key, value);
  }
}

final dyslexiaFontProvider = NotifierProvider<DyslexiaFontNotifier, bool>(
  DyslexiaFontNotifier.new,
);
