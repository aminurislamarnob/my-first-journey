import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:little_letters/main.dart' as app;

/// Toddler-protocol smoke test on a real device/simulator: every flow is
/// driven only by taps on large elements, mirroring how a child uses it.
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('home → English letters → letter detail → home → vehicles',
      (tester) async {
    // bySemanticsLabel finders need an active semantics tree. Disposed at
    // the end of the body — the binding verifies handles before teardowns.
    final semantics = tester.ensureSemantics();
    await app.main();
    await tester.pumpAndSettle(const Duration(milliseconds: 400));

    // Home shows all six modules.
    expect(find.text('English Alphabets'), findsOneWidget);
    expect(find.text('Vehicles'), findsOneWidget);

    // Enter English module.
    await tester.tap(find.text('English Alphabets'));
    await tester.pumpAndSettle();
    expect(find.text('A'), findsOneWidget);
    expect(find.text('B'), findsOneWidget);

    // Open letter A detail: glyph, case toggle, audio chips, examples.
    await tester.tap(find.text('A'));
    await tester.pumpAndSettle();
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Sound'), findsOneWidget);
    // The word renders as per-letter texts for the spelling reveal, so
    // match the example card's semantics label instead.
    expect(find.bySemanticsLabel('Apple'), findsOneWidget);

    // Case toggle flips the big glyph to lowercase.
    await tester.tap(find.text('a').first);
    await tester.pumpAndSettle();

    // Home button returns to the grid, then home again.
    await tester.tap(find.byIcon(Icons.home_rounded));
    await tester.pumpAndSettle();
    expect(find.text('Vehicles'), findsOneWidget);

    // Enter Vehicles, filter by Rail, open Train detail.
    await tester.tap(find.text('Vehicles'));
    await tester.pumpAndSettle();
    expect(find.text('Road'), findsOneWidget);

    // The Rail chip starts off-screen in the horizontal group row.
    await tester.dragUntilVisible(
      find.text('Rail'),
      find.byType(ListView).first,
      const Offset(-120, 0),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Rail'));
    await tester.pumpAndSettle();
    expect(find.text('Train'), findsOneWidget);
    expect(find.text('Car'), findsNothing);

    await tester.tap(find.text('Train'));
    // The motion preview loops forever; settle would never finish.
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('ট্রেন'), findsOneWidget);
    expect(find.text('قطار'), findsOneWidget);

    // And back home once more.
    await tester.tap(find.byIcon(Icons.home_rounded));
    await tester.pump(const Duration(milliseconds: 600));
    expect(find.text('Fruits'), findsOneWidget);

    semantics.dispose();
  });
}
