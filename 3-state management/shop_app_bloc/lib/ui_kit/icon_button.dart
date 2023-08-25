import 'package:flutter/material.dart';
import './ui_kit.dart' as U;

enum IconButtonSize { sm, md, lg }

enum IconButtonColor { primary, secondary }

class IconButton extends StatelessWidget {
  ///
  final String icon;

  final String toolTip;

  final bool loading;

  final bool disabled;

  final IconButtonSize size;

  final IconButtonColor color;

  final void Function() onPressed;

  const IconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.toolTip = "",
    this.loading = false,
    this.disabled = false,
    this.size = IconButtonSize.md,
    this.color = IconButtonColor.primary,
  });

  double get _size {
    switch (size) {
      case IconButtonSize.sm:
        return 40;
      case IconButtonSize.md:
        return 50;
      case IconButtonSize.lg:
        return 60;
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
          child: SizedBox.square(
            dimension: _size,
            child: loading
                ? U.Loading(
                    isSmall: true,
                    color: _colors.foreground,
                  )
                : U.Image(
                    path: icon,
                    color: _colors.foreground,
                    fit: BoxFit.none,
                  ),
          ),
        ),
      ),
    );
  }
}
