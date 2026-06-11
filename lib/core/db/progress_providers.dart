import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'database.dart';

/// itemId → stars (0 = visited) for the active profile in one module.
final moduleProgressProvider =
    StreamProvider.family<Map<String, int>, String>((ref, moduleId) async* {
  final profileId = await ref.watch(activeProfileIdProvider.future);
  yield* ref
      .watch(databaseProvider)
      .watchModuleProgress(profileId, moduleId)
      .map((rows) => {for (final row in rows) row.itemId: row.stars});
});

extension ProgressActions on WidgetRef {
  Future<void> recordVisit(String moduleId, String itemId) async {
    final profileId = await read(activeProfileIdProvider.future);
    await read(databaseProvider).recordVisit(
      profileId: profileId,
      moduleId: moduleId,
      itemId: itemId,
    );
  }
}
