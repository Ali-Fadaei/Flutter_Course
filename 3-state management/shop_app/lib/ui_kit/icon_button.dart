import 'package:flutter/material.dart';
import './ui_kit.dart' as U;

enum IconButtonSize { sm, md, lg }

enum IconButtonColor { primary, secondary }

class IconButton extends StatelessWidget {
  final String title;

  final IconButtonSize size;

  final IconButtonColor color;
  final IconData icon;

  final void Function() onPressed;

  const IconButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.size = IconButtonSize.md,
    this.color = IconButtonColor.primary,
    this.icon = Icons.add,
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

  ({U.TextSize size, U.TextWeight weight}) get _textStyle {
    switch (size) {
      case IconButtonSize.sm:
        return (size: U.TextSize.sm, weight: U.TextWeight.regular);
      case IconButtonSize.md:
        return (size: U.TextSize.md, weight: U.TextWeight.normal);
      case IconButtonSize.lg:
        return (size: U.TextSize.lg, weight: U.TextWeight.bold);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: U.Theme.surface,
      borderRadius: BorderRadius.circular(U.Theme.radius),
      child: InkWell(
        borderRadius: BorderRadius.circular(U.Theme.radius),
        onTap: onPressed,
        child: Container(
            color: _colors.background,
            height: _size,
            width: _size,
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Center(
                child: Icon(
              icon,
              color: _colors.foreground,
            ))),
      ),
    );
  }
}
