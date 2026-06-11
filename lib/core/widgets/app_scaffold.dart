import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/palette.dart';
import '../../l10n/app_localizations.dart';
import 'big_tap_button.dart';

/// Chrome-free scaffold for kid screens: warm paper background, no app
/// bar, and a persistent oversized Home button in the bottom start corner
/// (hidden on the home screen itself).
class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.body,
    this.showHomeButton = true,
    this.backgroundColor,
  });

  final Widget body;
  final bool showHomeButton;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: backgroundColor ?? Palette.paper,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(child: body),
            if (showHomeButton)
              PositionedDirectional(
                start: 16,
                bottom: 16,
                child: BigTapButton(
                  semanticLabel: l10n.home,
                  color: Palette.cream,
                  onTap: () => context.go('/'),
                  child: const Icon(
                    Icons.home_rounded,
                    size: 40,
                    color: Palette.coralDark,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
