import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../app/palette.dart';
import '../../content/modules.dart';
import '../../core/audio/audio_service.dart';
import '../../core/models/content_models.dart';
import '../../core/widgets/app_scaffold.dart';
import '../../core/widgets/big_tap_button.dart';
import '../../l10n/app_localizations.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    return AppScaffold(
      showHomeButton: false,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 4),
            child: Row(
              children: [
                const Icon(Icons.wb_sunny_rounded,
                    color: Palette.mango, size: 36),
                const SizedBox(width: 12),
                Text(
                  l10n.hello,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final columns = constraints.maxWidth > 720 ? 3 : 2;
                return GridView.count(
                  padding: const EdgeInsets.all(20),
                  crossAxisCount: columns,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.05,
                  children: [
                    for (final module in kModules)
                      _ModuleCard(module: module),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ModuleCard extends ConsumerWidget {
  const _ModuleCard({required this.module});

  final ModuleInfo module;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final languageCode = Localizations.localeOf(context).languageCode;
    final title = module.title.resolve(languageCode);
    final audio = ref.read(audioServiceProvider);

    return BigTapButton(
      semanticLabel: title,
      color: module.softColor,
      borderRadius: 28,
      onTap: () {
        if (module.implemented) {
          context.go(module.route);
        } else {
          // Friendly dead-end: speak it, never block with a dialog.
          audio.playVoice('assets/audio/en/ui/coming_soon.m4a');
          ScaffoldMessenger.of(context)
            ..clearSnackBars()
            ..showSnackBar(SnackBar(
              content: Text(l10n.comingSoon),
              duration: const Duration(seconds: 1),
            ));
        }
      },
      onLongPress: () => audio.playVoice(module.nameAudio),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: module.glyph != null
                  ? Text(
                      module.glyph!,
                      style: TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.w800,
                        color: module.color,
                        height: 1,
                      ),
                    )
                  : SvgPicture.asset(module.artAsset!, height: 80),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: module.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
