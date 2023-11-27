import 'package:flutter/material.dart' as M;
import 'ui_kit.dart' as U;

enum BadgeColor { primary, secondary }

class Badge extends M.StatelessWidget {
//
  final int? count;

  final BadgeColor color;

  final M.Widget child;

  const Badge({
    super.key,
    this.count,
    this.color = BadgeColor.primary,
    required this.child,
  });

  ({M.Color background, M.Color foreground}) get _colors {
    switch (color) {
      case BadgeColor.primary:
        return (background: U.Theme.primary, foreground: U.Theme.onPrimary);
      case BadgeColor.secondary:
        return (background: U.Theme.secondary, foreground: U.Theme.onSecondary);
    }
  }

  @override
  M.Widget build(M.BuildContext context) {
    final colors = _colors;
    return count == null
        ? child
        : M.Badge.count(
            count: count!,
            backgroundColor: colors.background,
            textColor: colors.foreground,
            child: child,
          );
  }
}
