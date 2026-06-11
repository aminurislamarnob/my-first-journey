import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'database.g.dart';

class Profiles extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withDefault(const Constant(''))();
  TextColumn get avatar => text().withDefault(const Constant('star'))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class LessonProgress extends Table {
  IntColumn get profileId => integer()();
  TextColumn get moduleId => text()();
  TextColumn get itemId => text()();

  /// 0 = visited only; 1–3 = stars earned in practice games.
  IntColumn get stars => integer().withDefault(const Constant(0))();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {profileId, moduleId, itemId};
}

class Streaks extends Table {
  IntColumn get profileId => integer()();

  IntColumn get current => integer().withDefault(const Constant(0))();
  IntColumn get longest => integer().withDefault(const Constant(0))();

  /// Local calendar date of last activity, as yyyy-MM-dd.
  TextColumn get lastActiveDate => text().nullable()();

  @override
  Set<Column> get primaryKey => {profileId};
}

@DriftDatabase(tables: [Profiles, LessonProgress, Streaks])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
      : super(executor ?? driftDatabase(name: 'little_letters'));

  @override
  int get schemaVersion => 1;

  /// The MVP ships with a single auto-created profile; the schema already
  /// supports multiple for Phase 2.
  Future<int> ensureDefaultProfile() async {
    final existing = await select(profiles).get();
    if (existing.isNotEmpty) return existing.first.id;
    return into(profiles).insert(ProfilesCompanion.insert());
  }

  Future<void> recordVisit({
    required int profileId,
    required String moduleId,
    required String itemId,
  }) async {
    await into(lessonProgress).insert(
      LessonProgressCompanion.insert(
        profileId: profileId,
        moduleId: moduleId,
        itemId: itemId,
      ),
      onConflict: DoNothing(),
    );
    await touchStreak(profileId);
  }

  Future<void> setStars({
    required int profileId,
    required String moduleId,
    required String itemId,
    required int stars,
  }) async {
    final existing = await (select(lessonProgress)
          ..where((row) =>
              row.profileId.equals(profileId) &
              row.moduleId.equals(moduleId) &
              row.itemId.equals(itemId)))
        .getSingleOrNull();
    // Stars only ever go up; a worse later round never erases a trophy.
    final best = existing == null || stars > existing.stars
        ? stars
        : existing.stars;
    await into(lessonProgress).insertOnConflictUpdate(
      LessonProgressCompanion.insert(
        profileId: profileId,
        moduleId: moduleId,
        itemId: itemId,
        stars: Value(best),
      ),
    );
    await touchStreak(profileId);
  }

  Stream<List<LessonProgressData>> watchModuleProgress(
    int profileId,
    String moduleId,
  ) {
    return (select(lessonProgress)
          ..where((row) =>
              row.profileId.equals(profileId) &
              row.moduleId.equals(moduleId)))
        .watch();
  }

  static String dateKey(DateTime date) =>
      '${date.year.toString().padLeft(4, '0')}-'
      '${date.month.toString().padLeft(2, '0')}-'
      '${date.day.toString().padLeft(2, '0')}';

  /// Counts today as active: consecutive days extend the streak, a gap
  /// resets it to 1, same-day repeats are no-ops.
  Future<void> touchStreak(int profileId, {DateTime? now}) async {
    final today = now ?? DateTime.now();
    final todayKey = dateKey(today);
    final yesterdayKey = dateKey(today.subtract(const Duration(days: 1)));

    final row = await (select(streaks)
          ..where((s) => s.profileId.equals(profileId)))
        .getSingleOrNull();

    if (row == null) {
      // An int primary key aliases SQLite's rowid, so drift treats it as
      // optional in companions and it must be wrapped in a Value.
      await into(streaks).insert(StreaksCompanion.insert(
        profileId: Value(profileId),
        current: const Value(1),
        longest: const Value(1),
        lastActiveDate: Value(todayKey),
      ));
      return;
    }
    if (row.lastActiveDate == todayKey) return;

    final current = row.lastActiveDate == yesterdayKey ? row.current + 1 : 1;
    await (update(streaks)..where((s) => s.profileId.equals(profileId))).write(
      StreaksCompanion(
        current: Value(current),
        longest: Value(current > row.longest ? current : row.longest),
        lastActiveDate: Value(todayKey),
      ),
    );
  }

  Stream<Streak?> watchStreak(int profileId) {
    return (select(streaks)..where((s) => s.profileId.equals(profileId)))
        .watchSingleOrNull();
  }
}

final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

/// Active profile id, ensured at startup.
final activeProfileIdProvider = FutureProvider<int>((ref) {
  return ref.watch(databaseProvider).ensureDefaultProfile();
});
