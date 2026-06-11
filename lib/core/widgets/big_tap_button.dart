import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../audio/audio_service.dart';

/// The one true tap surface for toddler fingers: at least 72dp on each
/// side, an instant click + bounce on every press, and a semantic label
/// so every interactive element reads aloud under a screen reader.
class BigTapButton extends ConsumerStatefulWidget {
  const BigTapButton({
    super.key,
    required this.semanticLabel,
    required this.child,
    this.onTap,
    this.onLongPress,
    this.color,
    this.minSize = 72,
    this.borderRadius = 24,
    this.padding = const EdgeInsets.all(12),
  });

  final String semanticLabel;
  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final Color? color;
  final double minSize;
  final double borderRadius;
  final EdgeInsets padding;

  @override
  ConsumerState<BigTapButton> createState() => _BigTapButtonState();
}

class _BigTapButtonState extends ConsumerState<BigTapButton> {
  bool _pressed = false;

  void _setPressed(bool value) {
    if (_pressed != value) setState(() => _pressed = value);
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.semanticLabel,
      button: true,
      child: GestureDetector(
        onTapDown: (_) => _setPressed(true),
        onTapCancel: () => _setPressed(false),
        onTapUp: (_) => _setPressed(false),
        onTap: widget.onTap == null
            ? null
            : () {
                ref.read(audioServiceProvider).tapFeedback();
                widget.onTap!();
              },
        onLongPress: widget.onLongPress,
        child: AnimatedScale(
          scale: _pressed ? 0.92 : 1.0,
          duration: const Duration(milliseconds: 90),
          curve: Curves.easeOut,
          child: Container(
            constraints: BoxConstraints(
              minWidth: widget.minSize,
              minHeight: widget.minSize,
            ),
            padding: widget.padding,
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
            child: Center(child: widget.child),
          ),
        ),
      ),
    );
  }
}
