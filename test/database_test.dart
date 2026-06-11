import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:little_letters/core/db/database.dart';

void main() {
  late AppDatabase db;
  late int profileId;

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    profileId = await db.ensureDefaultProfile();
  });

  tearDown(() => db.close());

  test('ensureDefaultProfile is idempotent', () async {
    expect(await db.ensureDefaultProfile(), profileId);
  });

  test('recordVisit inserts once and keeps stars', () async {
    await db.recordVisit(
        profileId: profileId, moduleId: 'english', itemId: 'a');
    await db.setStars(
        profileId: profileId, moduleId: 'english', itemId: 'a', stars: 2);
    // A later visit must not reset the stars.
    await db.recordVisit(
        profileId: profileId, moduleId: 'english', itemId: 'a');

    final rows = await db.watchModuleProgress(profileId, 'english').first;
    expect(rows, hasLength(1));
    expect(rows.single.stars, 2);
  });

  test('stars never decrease', () async {
    await db.setStars(
        profileId: profileId, moduleId: 'english', itemId: 'b', stars: 3);
    await db.setStars(
        profileId: profileId, moduleId: 'english', itemId: 'b', stars: 1);

    final rows = await db.watchModuleProgress(profileId, 'english').first;
    expect(rows.single.stars, 3);
  });

  test('streak: same day repeats are no-ops, consecutive days extend, gaps reset',
      () async {
    final day1 = DateTime(2026, 6, 1);
    await db.touchStreak(profileId, now: day1);
    await db.touchStreak(profileId, now: day1);
    var streak = await db.watchStreak(profileId).first;
    expect(streak!.current, 1);

    await db.touchStreak(profileId, now: DateTime(2026, 6, 2));
    streak = await db.watchStreak(profileId).first;
    expect(streak!.current, 2);
    expect(streak.longest, 2);

    // Two-day gap resets current but keeps longest.
    await db.touchStreak(profileId, now: DateTime(2026, 6, 5));
    streak = await db.watchStreak(profileId).first;
    expect(streak!.current, 1);
    expect(streak.longest, 2);
  });
}
