import 'package:drift/drift.dart' show driftRuntimeOptions;
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:little_letters/app/router.dart';
import 'package:little_letters/app/settings.dart';
import 'package:little_letters/core/audio/audio_service.dart';
import 'package:little_letters/core/db/database.dart';
import 'package:little_letters/core/db/progress_providers.dart';
import 'package:little_letters/core/widgets/big_tap_button.dart';
import 'package:little_letters/l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

late AppDatabase _db;
late SilentAudioService _audio;

const _localizationsDelegates = [
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];

Future<ProviderScope> _wrap(Widget app) async {
  SharedPreferences.setMockInitialValues({});
  final prefs = await SharedPreferences.getInstance();
  _db = AppDatabase(NativeDatabase.memory());
  _audio = SilentAudioService();
  return ProviderScope(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(prefs),
      databaseProvider.overrideWithValue(_db),
      audioServiceProvider.overrideWithValue(_audio),
      // Drift query streams schedule zero-length timers on dispose that
      // trip flutter_test's pending-timer invariant; widget tests use a
      // plain one-shot stream instead. Database writes are still real.
      moduleProgressProvider.overrideWith(
          (ref, moduleId) => Stream.value(const <String, int>{})),
    ],
    child: app,
  );
}

/// Full app at a given route — screens use go_router for navigation.
Future<Widget> _appAt(String location) {
  return _wrap(MaterialApp.router(
    routerConfig: createRouter(initialLocation: location),
    supportedLocales: AppLocalizations.supportedLocales,
    localizationsDelegates: _localizationsDelegates,
  ));
}

void main() {
  // Each test gets its own in-memory database; closing it in tearDown can
  // deadlock the suite when a failed test leaves queries in flight, so we
  // let them die with the process and silence drift's multi-instance
  // debug warning instead.
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;

  testWidgets('home grid shows all six modules', (tester) async {
    await tester.pumpWidget(await _appAt('/'));
    await tester.pumpAndSettle();

    expect(find.text('English Alphabets'), findsOneWidget);
    expect(find.text('Vehicles'), findsOneWidget);
    expect(find.text('Bangla Alphabets'), findsOneWidget);
    expect(find.text('Arabic Alphabets'), findsOneWidget);
    expect(find.text('Animals'), findsOneWidget);
    expect(find.text('Fruits'), findsOneWidget);
  });

  testWidgets('BigTapButton exposes semantics and reacts to tap',
      (tester) async {
    var tapped = false;
    await tester.pumpWidget(await _wrap(MaterialApp(
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: _localizationsDelegates,
      home: Scaffold(
        body: BigTapButton(
          semanticLabel: 'press me',
          onTap: () => tapped = true,
          child: const Icon(Icons.star),
        ),
      ),
    )));
    await tester.pumpAndSettle();

    expect(find.bySemanticsLabel('press me'), findsOneWidget);
    await tester.tap(find.byType(BigTapButton));
    await tester.pumpAndSettle();
    expect(tapped, isTrue);
  });

  testWidgets('alphabet engine renders the English grid and tapping a '
      'letter plays its name and opens the detail pager', (tester) async {
    await tester.pumpWidget(await _appAt('/alphabet/english'));
    await tester.pumpAndSettle();

    expect(find.text('English Alphabets'), findsOneWidget);
    expect(find.text('A'), findsOneWidget);

    await tester.tap(find.text('A'));
    await tester.pumpAndSettle();

    expect(_audio.played, contains('assets/audio/en/letters/a_name.m4a'));
    // Detail page shows the letter-name audio chip.
    expect(find.text('Name'), findsOneWidget);

    await _flushDriftStreamTimers(tester);
  });

  testWidgets('flashcard engine renders vehicle groups and filters by group',
      (tester) async {
    await tester.pumpWidget(await _appAt('/cards/vehicles'));
    await tester.pumpAndSettle();

    expect(find.text('Vehicles'), findsOneWidget);
    expect(find.text('Road'), findsOneWidget);
    expect(find.text('Car'), findsOneWidget);

    // Selecting the Rail group hides road vehicles.
    await tester.tap(find.text('Rail'));
    await tester.pumpAndSettle();
    expect(find.text('Train'), findsOneWidget);
    expect(find.text('Car'), findsNothing);

    await _flushDriftStreamTimers(tester);
  });
}

/// Disposes the tree inside the test body and pumps once so drift's
/// zero-length stream-close timer fires before the pending-timer check.
Future<void> _flushDriftStreamTimers(WidgetTester tester) async {
  await tester.pumpWidget(const SizedBox.shrink());
  await tester.pump();
}
