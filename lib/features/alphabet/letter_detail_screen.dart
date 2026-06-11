import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/palette.dart';
import '../../app/settings.dart';
import '../../content/content_repository.dart';
import '../../content/modules.dart';
import '../../core/audio/audio_service.dart';
import '../../core/db/progress_providers.dart';
import '../../core/models/content_models.dart';
import '../../core/widgets/app_scaffold.dart';
import '../../core/widgets/big_tap_button.dart';
import '../../core/widgets/content_image.dart';
import '../../l10n/app_localizations.dart';

/// One letter per page; swipe to move through the alphabet. Each page
/// shows the huge glyph (with upper/lowercase toggle where the script has
/// cases), name + phonic audio buttons, and an example-word carousel with
/// letter-by-letter spelling reveal.
class LetterDetailScreen extends ConsumerStatefulWidget {
  const LetterDetailScreen({
    super.key,
    required this.moduleId,
    required this.initialIndex,
  });

  final String moduleId;
  final int initialIndex;

  @override
  ConsumerState<LetterDetailScreen> createState() =>
      _LetterDetailScreenState();
}

class _LetterDetailScreenState extends ConsumerState<LetterDetailScreen> {
  late final PageController _controller =
      PageController(initialPage: widget.initialIndex);
  bool _initialLetterShown = false;

  void _onLetterShown(Letter letter) {
    ref.read(audioServiceProvider).playVoice(letter.audio.name);
    ref.recordVisit(widget.moduleId, letter.id);
  }

  /// onPageChanged never fires for the initial page, so greet the first
  /// letter once the manifest is available.
  void _showInitialLetter(List<Letter> letters) {
    if (_initialLetterShown) return;
    _initialLetterShown = true;
    final index = widget.initialIndex.clamp(0, letters.length - 1);
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _onLetterShown(letters[index]));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final module = moduleById(widget.moduleId);
    final manifestAsync =
        ref.watch(alphabetManifestProvider(widget.moduleId));

    return AppScaffold(
      body: manifestAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('$error')),
        data: (manifest) {
          final letters = manifest.allLetters;
          _showInitialLetter(letters);
          return Directionality(
            textDirection:
                manifest.isRtl ? TextDirection.rtl : TextDirection.ltr,
            child: PageView.builder(
              controller: _controller,
              itemCount: letters.length,
              onPageChanged: (index) => _onLetterShown(letters[index]),
              itemBuilder: (context, index) => _LetterPage(
                letter: letters[index],
                module: module,
                manifest: manifest,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _LetterPage extends ConsumerStatefulWidget {
  const _LetterPage({
    required this.letter,
    required this.module,
    required this.manifest,
  });

  final Letter letter;
  final ModuleInfo module;
  final AlphabetManifest manifest;

  @override
  ConsumerState<_LetterPage> createState() => _LetterPageState();
}

class _LetterPageState extends ConsumerState<_LetterPage> {
  bool _showLowercase = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final letter = widget.letter;
    final module = widget.module;
    final audio = ref.read(audioServiceProvider);
    final reducedMotion = ref.watch(reducedMotionProvider);

    final glyph = _showLowercase && letter.lowercase != null
        ? letter.lowercase!
        : letter.glyph;

    return Column(
      children: [
        const SizedBox(height: 12),
        // Huge glyph — tapping it speaks the letter name.
        Expanded(
          flex: 5,
          child: BigTapButton(
            semanticLabel: letter.name,
            color: module.softColor,
            borderRadius: 36,
            padding: const EdgeInsets.symmetric(horizontal: 48),
            onTap: () => audio.playVoice(letter.audio.name),
            child: Builder(builder: (context) {
              final text = Text(
                glyph,
                key: ValueKey(glyph),
                style: TextStyle(
                  fontSize: 130,
                  fontWeight: FontWeight.w800,
                  color: module.color,
                  height: 1.1,
                ),
              );
              if (reducedMotion) return text;
              return text.animate().scale(
                    begin: const Offset(0.8, 0.8),
                    duration: 250.ms,
                    curve: Curves.easeOutBack,
                  );
            }),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.manifest.hasCaseToggle) ...[
              BigTapButton(
                semanticLabel:
                    '${letter.glyph} ${letter.lowercase ?? ''}',
                color: Palette.cream,
                onTap: () =>
                    setState(() => _showLowercase = !_showLowercase),
                child: Text(
                  _showLowercase ? letter.glyph : (letter.lowercase ?? ''),
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: module.color,
                  ),
                ),
              ),
              const SizedBox(width: 14),
            ],
            _AudioChip(
              label: l10n.letterName,
              icon: Icons.volume_up_rounded,
              color: module.color,
              onTap: () => audio.playVoice(letter.audio.name),
            ),
            if (letter.audio.phonic != null) ...[
              const SizedBox(width: 14),
              _AudioChip(
                label: l10n.letterSound,
                icon: Icons.graphic_eq_rounded,
                color: module.color,
                onTap: () => audio.playVoice(letter.audio.phonic),
              ),
            ],
          ],
        ),
        const SizedBox(height: 12),
        // Example words carousel.
        Expanded(
          flex: 4,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 16),
            itemCount: letter.examples.length,
            separatorBuilder: (_, _) => const SizedBox(width: 14),
            itemBuilder: (context, index) => _ExampleCard(
              example: letter.examples[index],
              module: module,
            ),
          ),
        ),
        const SizedBox(height: 64),
      ],
    );
  }
}

class _AudioChip extends StatelessWidget {
  const _AudioChip({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return BigTapButton(
      semanticLabel: label,
      color: color,
      onTap: onTap,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Palette.paper, size: 28),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              color: Palette.paper,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

/// Example word card: image on top, word below. Tapping plays the word
/// audio and replays the spelling reveal (letters pop in one by one).
class _ExampleCard extends ConsumerStatefulWidget {
  const _ExampleCard({required this.example, required this.module});

  final WordExample example;
  final ModuleInfo module;

  @override
  ConsumerState<_ExampleCard> createState() => _ExampleCardState();
}

class _ExampleCardState extends ConsumerState<_ExampleCard> {
  int _revealRun = 0;

  @override
  Widget build(BuildContext context) {
    final module = widget.module;
    final example = widget.example;
    final reducedMotion = ref.watch(reducedMotionProvider);

    return BigTapButton(
      semanticLabel: example.word,
      color: Palette.cream,
      borderRadius: 24,
      onTap: () {
        ref.read(audioServiceProvider).playVoice(example.audio);
        setState(() => _revealRun++);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Shrinks below its natural size on short viewports instead of
          // overflowing the card.
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: ContentImage(
                candidates: [example.image],
                fallbackText: example.word,
                accentColor: module.color,
                softColor: module.softColor,
                size: 110,
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Spelling reveal, re-run on every tap via the run counter key.
          Row(
            key: ValueKey(_revealRun),
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final (i, char) in example.word.characters.indexed)
                Builder(builder: (context) {
                  final text = Text(
                    char,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: module.color,
                    ),
                  );
                  if (reducedMotion) return text;
                  return text.animate().scale(
                        begin: const Offset(0, 0),
                        delay: (90 * i).ms,
                        duration: 200.ms,
                        curve: Curves.easeOutBack,
                      );
                }),
            ],
          ),
        ],
      ),
    );
  }
}
