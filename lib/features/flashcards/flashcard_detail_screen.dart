import 'package:flutter/material.dart';
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
import '../../core/widgets/icon_registry.dart';

/// One item per page; swipe to browse. Tapping the big picture plays the
/// item's authentic sound (engine, siren…), falling back to its spoken
/// name while sfx recordings don't exist yet.
class FlashcardDetailScreen extends ConsumerStatefulWidget {
  const FlashcardDetailScreen({
    super.key,
    required this.moduleId,
    required this.itemId,
  });

  final String moduleId;
  final String itemId;

  @override
  ConsumerState<FlashcardDetailScreen> createState() =>
      _FlashcardDetailScreenState();
}

class _FlashcardDetailScreenState
    extends ConsumerState<FlashcardDetailScreen> {
  PageController? _controller;
  bool _initialItemShown = false;

  void _onItemShown(FlashItem item) {
    ref
        .read(audioServiceProvider)
        .playFirstAvailable([item.nameAudio['en'], item.sound]);
    ref.recordVisit(widget.moduleId, item.id);
  }

  /// onPageChanged never fires for the initial page, so greet the first
  /// item once the manifest is available.
  void _showInitialItem(FlashItem item) {
    if (_initialItemShown) return;
    _initialItemShown = true;
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _onItemShown(item));
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final module = moduleById(widget.moduleId);
    final manifestAsync =
        ref.watch(flashcardManifestProvider(widget.moduleId));

    return AppScaffold(
      body: manifestAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('$error')),
        data: (manifest) {
          final items = manifest.items;
          final initialIndex =
              items.indexWhere((item) => item.id == widget.itemId);
          final safeIndex = initialIndex < 0 ? 0 : initialIndex;
          _controller ??= PageController(initialPage: safeIndex);
          _showInitialItem(items[safeIndex]);
          return PageView.builder(
            controller: _controller,
            itemCount: items.length,
            onPageChanged: (index) => _onItemShown(items[index]),
            itemBuilder: (context, index) =>
                _ItemPage(item: items[index], module: module),
          );
        },
      ),
    );
  }
}

class _ItemPage extends ConsumerStatefulWidget {
  const _ItemPage({required this.item, required this.module});

  final FlashItem item;
  final ModuleInfo module;

  @override
  ConsumerState<_ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends ConsumerState<_ItemPage> {
  bool _showPhoto = true;

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    final module = widget.module;
    final audio = ref.read(audioServiceProvider);
    final reducedMotion = ref.watch(reducedMotionProvider);
    final enName = item.names.resolve('en');

    return Column(
      children: [
        const SizedBox(height: 16),
        // Big picture — tap for the authentic sound.
        Expanded(
          flex: 6,
          child: Stack(
            children: [
              Center(
                child: BigTapButton(
                  semanticLabel: enName,
                  color: module.softColor,
                  borderRadius: 36,
                  padding: const EdgeInsets.all(24),
                  onTap: () => audio.playFirstAvailable(
                      [item.sound, item.nameAudio['en']]),
                  child: ContentImage(
                    assetPath: _showPhoto ? item.photo : item.illustration,
                    iconName: item.icon,
                    fallbackText: enName,
                    accentColor: module.color,
                    softColor: module.softColor,
                    size: 220,
                  ),
                ),
              ),
              // Photo ⇄ illustration flip.
              PositionedDirectional(
                end: 24,
                top: 4,
                child: BigTapButton(
                  semanticLabel: 'photo / illustration',
                  minSize: 56,
                  color: Palette.cream,
                  onTap: () => setState(() => _showPhoto = !_showPhoto),
                  child: Icon(
                    _showPhoto
                        ? Icons.brush_rounded
                        : Icons.photo_camera_rounded,
                    size: 28,
                    color: module.color,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        // Trilingual name chips — tap a language to hear it.
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (final lang in const ['en', 'bn', 'ar'])
                if (item.names[lang] != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: BigTapButton(
                      semanticLabel: item.names[lang]!,
                      minSize: 60,
                      color: Palette.cream,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 10),
                      onTap: () => audio.playFirstAvailable(
                          [item.nameAudio[lang], item.nameAudio['en']]),
                      child: Text(
                        item.names[lang]!,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: module.color,
                        ),
                      ),
                    ),
                  ),
            ],
          ),
        ),
        // Motion preview strip: the item drives across the screen.
        Expanded(
          flex: 2,
          child: reducedMotion
              ? const SizedBox.shrink()
              : _MotionPreview(item: item, module: module),
        ),
        const SizedBox(height: 64),
      ],
    );
  }
}

class _MotionPreview extends StatefulWidget {
  const _MotionPreview({required this.item, required this.module});

  final FlashItem item;
  final ModuleInfo module;

  @override
  State<_MotionPreview> createState() => _MotionPreviewState();
}

class _MotionPreviewState extends State<_MotionPreview>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 5),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final icon = IconRegistry.widget(
      widget.item.icon,
      size: 44,
      color: widget.module.color,
    );
    if (icon == null) return const SizedBox.shrink();
    return LayoutBuilder(builder: (context, constraints) {
      return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final x =
              (constraints.maxWidth + 80) * _controller.value - 40;
          return Stack(
            children: [
              Positioned(
                left: x,
                bottom: 12,
                child: child!,
              ),
            ],
          );
        },
        child: icon,
      );
    });
  }
}
