import 'package:flutter/material.dart';
import './ui_kit.dart' as U;

enum IconButtonSize { sm, md, lg }

enum IconButtonColor { primary, secondary }

class IconButton extends StatelessWidget {
  ///
  final String icon;

  final String toolTip;

  final bool loading;

  final IconButtonSize size;

  final IconButtonColor color;

  final void Function() onPressed;

  const IconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.toolTip = "",
    this.loading = false,
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
    switch (color) {
      case IconButtonColor.primary:
        return (background: U.Theme.primary, foreground: U.Theme.onPrimary);
      case IconButtonColor.secondary:
        return (background: U.Theme.secondary, foreground: U.Theme.onSecondary);
    }
  }

  @override
  Widget build(BuildContext context) {
    return U.Tooltip(
      message: toolTip,
      child: Material(
        color: _colors.background,
        borderRadius: BorderRadius.circular(U.Theme.radius),
        child: InkWell(
          borderRadius: BorderRadius.circular(U.Theme.radius),
          onTap: loading ? null : onPressed,
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
                  ),
          ),
        ),
      ),
    );
  }
}
