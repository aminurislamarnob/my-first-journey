import 'package:flutter/material.dart';

import '../../app/palette.dart';
import 'icon_registry.dart';

/// Renders a content image with layered fallbacks, because manifests are
/// written before real photos exist: asset image → registry icon →
/// first-letter art. The fallback keeps the module's color identity.
class ContentImage extends StatelessWidget {
  const ContentImage({
    super.key,
    this.assetPath,
    this.iconName,
    required this.fallbackText,
    required this.accentColor,
    required this.softColor,
    this.size,
  });

  final String? assetPath;
  final String? iconName;

  /// Word shown in letter-art fallback (first character is featured).
  final String fallbackText;
  final Color accentColor;
  final Color softColor;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final path = assetPath;
    if (path != null && path.endsWith('.png')) {
      return Image.asset(
        path,
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => _fallback(context),
      );
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
