import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app/palette.dart';
import 'icon_registry.dart';

/// Set of all bundled asset paths, used to skip references to assets that
/// don't exist yet (manifests are written ahead of real photos/audio).
final assetIndexProvider = FutureProvider<Set<String>>((ref) async {
  final manifest = await AssetManifest.loadFromAssetBundle(rootBundle);
  return manifest.listAssets().toSet();
});

/// Renders the first existing image among [candidates] (PNG photos or SVG
/// illustrations), falling back to a registry icon, then letter art. The
/// fallback keeps the module's color identity. Never emoji.
class ContentImage extends ConsumerWidget {
  const ContentImage({
    super.key,
    this.candidates = const [],
    this.iconName,
    required this.fallbackText,
    required this.accentColor,
    required this.softColor,
    this.size,
  });

  /// Asset paths in preference order; missing ones are skipped.
  final List<String?> candidates;
  final String? iconName;

  /// Word shown in letter-art fallback (first character is featured).
  final String fallbackText;
  final Color accentColor;
  final Color softColor;
  final double? size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(assetIndexProvider).value;
    if (index != null) {
      for (final path in candidates) {
        if (path == null || !index.contains(path)) continue;
        if (path.endsWith('.svg')) {
          return SvgPicture.asset(path, width: size, height: size);
        }
        return Image.asset(
          path,
          width: size,
          height: size,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) => _fallback(context),
        );
      }
    }
    return _fallback(context);
  }

  Widget _fallback(BuildContext context) {
    final dimension = size ?? 96;
    final icon = IconRegistry.widget(
      iconName,
      size: dimension * 0.55,
      color: accentColor,
    );
    return Container(
      width: dimension,
      height: dimension,
      decoration: BoxDecoration(
        color: softColor,
        borderRadius: BorderRadius.circular(dimension / 5),
      ),
      child: Center(
        child: icon ??
            Text(
              fallbackText.isEmpty
                  ? '?'
                  : fallbackText.characters.first.toUpperCase(),
              style: TextStyle(
                fontSize: dimension * 0.5,
                fontWeight: FontWeight.bold,
                color: accentColor,
              ),
            ),
      ),
    );
  }
}

/// 1–3 filled stars with empty slots, used on tiles and detail headers.
class StarRating extends StatelessWidget {
  const StarRating({super.key, required this.stars, this.size = 22});

  final int stars;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '$stars/3',
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < 3; i++)
            Icon(
              i < stars ? Icons.star_rounded : Icons.star_outline_rounded,
              size: size,
              color: i < stars ? Palette.mango : Palette.inkMuted,
            ),
        ],
      ),
    );
  }
}
