import 'package:flutter/material.dart';
import './ui_kit.dart' as U;

enum IconButtonSize { sm, md, lg }

enum IconButtonColor { neutral, primary, secondary }

class IconButton extends StatelessWidget {
  ///
  final String icon;

  final String toolTip;

  final bool loading;

  final bool disabled;

  final IconButtonSize size;

  final IconButtonColor color;

  final Color? iconColor;

  final void Function()? onPressed;

  const IconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.toolTip = "",
    this.loading = false,
    this.disabled = false,
    this.size = IconButtonSize.md,
    this.color = IconButtonColor.neutral,
    this.iconColor,
  });

  double get _size {
    switch (size) {
      case IconButtonSize.sm:
        return 35;
      case IconButtonSize.md:
        return 40;
      case IconButtonSize.lg:
        return 45;
    }
  }

  ({Color background, Color foreground}) get _colors {
    var opacity = disabled || loading ? 0.75 : 1.0;
    switch (color) {
      case IconButtonColor.primary:
        return (
          background: U.Theme.primary.withOpacity(opacity),
          foreground: U.Theme.onPrimary.withOpacity(opacity),
        );
      case IconButtonColor.secondary:
        return (
          background: U.Theme.secondary.withOpacity(opacity),
          foreground: U.Theme.onSecondary.withOpacity(opacity),
        );
      case IconButtonColor.neutral:
        return (
          background: Colors.transparent,
          foreground: U.Theme.onBackground.withOpacity(opacity),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return U.Tooltip(
      message: loading || disabled ? '' : toolTip,
      child: Material(
        color: _colors.background,
        borderRadius: BorderRadius.circular(U.Theme.radius),
        child: InkWell(
          borderRadius: BorderRadius.circular(U.Theme.radius),
          onTap: loading || disabled ? null : onPressed,
          child: Container(
            height: _size,
            width: _size,
            padding: const EdgeInsets.all(8),
            child: loading
                ? U.Loading(
                    isSmall: true,
                    color: _colors.foreground,
                  )
                : U.Image(
                    path: icon,
                    color: iconColor ?? _colors.foreground,
                  ),
          ),
        ),
      ),
    );
  }
}
