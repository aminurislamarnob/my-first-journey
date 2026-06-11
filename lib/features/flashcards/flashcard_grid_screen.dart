import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/palette.dart';
import '../../content/content_repository.dart';
import '../../content/modules.dart';
import '../../core/db/progress_providers.dart';
import '../../core/models/content_models.dart';
import '../../core/widgets/app_scaffold.dart';
import '../../core/widgets/big_tap_button.dart';
import '../../core/widgets/content_image.dart';
import '../../core/widgets/icon_registry.dart';
import '../../l10n/app_localizations.dart';

/// Selected group per flashcard module (null = all items).
class SelectedGroupNotifier extends Notifier<String?> {
  SelectedGroupNotifier(this.moduleId);

  final String moduleId;

  @override
  String? build() => null;

  void select(String? groupId) => state = groupId;
}

final selectedGroupProvider = NotifierProvider.family<SelectedGroupNotifier,
    String?, String>(SelectedGroupNotifier.new);

/// Flashcard engine entry: group chips above a card grid. Vehicles,
/// Animals and Fruits are all configurations of this screen.
class FlashcardGridScreen extends ConsumerWidget {
  const FlashcardGridScreen({super.key, required this.moduleId});

  final String moduleId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final module = moduleById(moduleId);
    final manifestAsync = ref.watch(flashcardManifestProvider(moduleId));
    final selectedGroup = ref.watch(selectedGroupProvider(moduleId));
    final progress =
        ref.watch(moduleProgressProvider(moduleId)).value ?? const {};
    final languageCode = Localizations.localeOf(context).languageCode;

    return AppScaffold(
      body: manifestAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('$error')),
        data: (manifest) {
          final items = manifest.itemsInGroup(selectedGroup);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
                child: Text(
                  manifest.title.resolve(languageCode),
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: module.color,
                      ),
                ),
              ),
              SizedBox(
                height: 64,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    _GroupChip(
                      label: l10n.all,
                      iconName: null,
                      selected: selectedGroup == null,
                      module: module,
                      onTap: () => ref
                          .read(selectedGroupProvider(moduleId).notifier)
                          .select(null),
                    ),
                    for (final group in manifest.groups)
                      _GroupChip(
                        label: group.title.resolve(languageCode),
                        iconName: group.icon,
                        selected: selectedGroup == group.id,
                        module: module,
                        onTap: () => ref
                            .read(selectedGroupProvider(moduleId).notifier)
                            .select(group.id),
                      ),
                  ],
                ),
              ),
              Expanded(
                child: LayoutBuilder(builder: (context, constraints) {
                  final columns = constraints.maxWidth > 720 ? 4 : 2;
                  return GridView.builder(
                    padding: const EdgeInsets.fromLTRB(20, 12, 20, 110),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
                      mainAxisSpacing: 14,
                      crossAxisSpacing: 14,
                      childAspectRatio: 0.95,
                    ),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return _ItemCard(
                        item: item,
                        module: module,
                        visited: progress.containsKey(item.id),
                        languageCode: languageCode,
                        onTap: () =>
                            context.go('/cards/$moduleId/item/${item.id}'),
                      );
                    },
                  );
                }),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _GroupChip extends StatelessWidget {
  const _GroupChip({
    required this.label,
    required this.iconName,
    required this.selected,
    required this.module,
    required this.onTap,
  });

  final String label;

  /// Registry icon name; null shows the generic "all" icon.
  final String? iconName;
  final bool selected;
  final ModuleInfo module;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final iconColor = selected ? Palette.paper : module.color;
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 10),
      child: BigTapButton(
        semanticLabel: label,
        minSize: 56,
        color: selected ? module.color : module.softColor,
        borderRadius: 20,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconRegistry.widget(iconName, size: 24, color: iconColor) ??
                Icon(Icons.apps_rounded, size: 24, color: iconColor),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: selected ? Palette.paper : module.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ItemCard extends StatelessWidget {
  const _ItemCard({
    required this.item,
    required this.module,
    required this.visited,
    required this.languageCode,
    required this.onTap,
  });

  final FlashItem item;
  final ModuleInfo module;
  final bool visited;
  final String languageCode;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final name = item.names.resolve(languageCode);
    return BigTapButton(
      semanticLabel: name,
      color: Palette.cream,
      borderRadius: 24,
      onTap: onTap,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: ContentImage(
                    // Cartoon-first on the grid; photos slot in later.
                    candidates: [item.illustration, item.photo],
                    iconName: item.icon,
                    fallbackText: item.names.resolve('en'),
                    accentColor: module.color,
                    softColor: module.softColor,
                    size: 84,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: module.color,
                  ),
                ),
              ),
            ],
          ),
          if (visited)
            const Align(
              alignment: AlignmentDirectional.topEnd,
              child: Icon(Icons.star_rounded,
                  size: 20, color: Palette.mango),
            ),
        ],
      ),
    );
  }
}
