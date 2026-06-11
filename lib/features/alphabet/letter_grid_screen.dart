import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/palette.dart';
import '../../content/content_repository.dart';
import '../../content/modules.dart';
import '../../core/audio/audio_service.dart';
import '../../core/db/progress_providers.dart';
import '../../core/models/content_models.dart';
import '../../core/widgets/app_scaffold.dart';
import '../../core/widgets/big_tap_button.dart';

/// Alphabet engine entry: a grid of letter tiles for any alphabet
/// manifest (English/Bangla/Arabic are configurations of this screen).
class LetterGridScreen extends ConsumerWidget {
  const LetterGridScreen({super.key, required this.moduleId});

  final String moduleId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final module = moduleById(moduleId);
    final manifestAsync = ref.watch(alphabetManifestProvider(moduleId));
    final progress =
        ref.watch(moduleProgressProvider(moduleId)).value ?? const {};
    final languageCode = Localizations.localeOf(context).languageCode;

    return AppScaffold(
      body: manifestAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('$error')),
        data: (manifest) {
          final letters = manifest.allLetters;
          return Directionality(
            textDirection:
                manifest.isRtl ? TextDirection.rtl : TextDirection.ltr,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                  child: Text(
                    manifest.title.resolve(languageCode),
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: module.color,
                        ),
                  ),
                ),
                Expanded(
                  child: LayoutBuilder(builder: (context, constraints) {
                    final columns = constraints.maxWidth > 720 ? 6 : 4;
                    return GridView.builder(
                      padding: const EdgeInsets.fromLTRB(20, 12, 20, 110),
                      gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: columns,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                      ),
                      itemCount: letters.length,
                      itemBuilder: (context, index) {
                        final letter = letters[index];
                        final visited = progress.containsKey(letter.id);
                        return _LetterTile(
                          letter: letter,
                          module: module,
                          visited: visited,
                          onTap: () => context
                              .go('/alphabet/$moduleId/letter/$index'),
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _LetterTile extends ConsumerWidget {
  const _LetterTile({
    required this.letter,
    required this.module,
    required this.visited,
    required this.onTap,
  });

  final Letter letter;
  final ModuleInfo module;
  final bool visited;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BigTapButton(
      semanticLabel: letter.name,
      color: visited ? module.softColor : Palette.cream,
      borderRadius: 20,
      onTap: () {
        ref.read(audioServiceProvider).playVoice(letter.audio.name);
        onTap();
      },
      child: Stack(
        children: [
          Center(
            child: Text(
              letter.glyph,
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.w800,
                color: module.color,
                height: 1,
              ),
            ),
          ),
          if (visited)
            const Align(
              alignment: AlignmentDirectional.topEnd,
              child: Icon(Icons.star_rounded,
                  size: 18, color: Palette.mango),
            ),
        ],
      ),
    );
  }
}
