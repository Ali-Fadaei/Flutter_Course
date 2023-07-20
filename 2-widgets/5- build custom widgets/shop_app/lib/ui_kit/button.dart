import 'package:flutter/material.dart';
import './ui_kit.dart' as U;

enum ButtonSize { sm, md, lg }

enum ButtonColor { primary, secondary }

class Button extends StatelessWidget {
//
  final String title;

  final ButtonSize size;

  final ButtonColor color;

  final void Function() onPressed;

  final Widget? trailing;

  final bool _hasTrailing;

  const Button({
    super.key,
    required this.title,
    required this.onPressed,
    this.size = ButtonSize.md,
    this.color = ButtonColor.primary,
    this.trailing,
  }) : _hasTrailing = trailing != null;

  double get _size {
    switch (size) {
      case ButtonSize.sm:
        return 40;
      case ButtonSize.md:
        return 50;
      case ButtonSize.lg:
        return 60;
    }
  }

  ({Color background, Color foreground}) get _colors {
    switch (color) {
      case ButtonColor.primary:
        return (background: U.Theme.primary, foreground: U.Theme.onPrimary);
      case ButtonColor.secondary:
        return (background: U.Theme.secondary, foreground: U.Theme.onSecondary);
    }
  }

  ({U.TextSize size, U.TextWeight weight}) get _textStyle {
    switch (size) {
      case ButtonSize.sm:
        return (size: U.TextSize.sm, weight: U.TextWeight.regular);
      case ButtonSize.md:
        return (size: U.TextSize.md, weight: U.TextWeight.normal);
      case ButtonSize.lg:
        return (size: U.TextSize.lg, weight: U.TextWeight.bold);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _colors.background,
      borderRadius: BorderRadius.circular(U.Theme.radius),
      child: InkWell(
        borderRadius: BorderRadius.circular(U.Theme.radius),
        onTap: onPressed,
        child: Container(
          height: _size,
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              if (_hasTrailing) trailing!,
              Spacer(),
              U.Text(
                title,
                color: _colors.foreground,
                size: _textStyle.size,
                weight: _textStyle.weight,
              ),
              if (!_hasTrailing) Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
