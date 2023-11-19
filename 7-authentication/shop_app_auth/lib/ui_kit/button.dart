import 'package:flutter/material.dart';
import './ui_kit.dart' as U;

enum ButtonSize { sm, md, lg }

enum ButtonColor { primary, secondary }

class Button extends StatelessWidget {
  ///
  final String title;

  final bool loading;

  final bool disabled;

  final ButtonSize size;

  final ButtonColor color;

  final void Function() onPressed;

  final Widget? trailing;

  final bool _hasTrailing;

  const Button({
    super.key,
    required this.title,
    required this.onPressed,
    this.loading = false,
    this.disabled = false,
    this.size = ButtonSize.md,
    this.color = ButtonColor.primary,
    this.trailing,
  }) : _hasTrailing = trailing != null;

  double get _size {
    switch (size) {
      case ButtonSize.sm:
        return 30;
      case ButtonSize.md:
        return 40;
      case ButtonSize.lg:
        return 50;
    }
  }

  ({Color background, Color foreground}) get _colors {
    var opacity = disabled || loading ? 0.75 : 1.0;
    switch (color) {
      case ButtonColor.primary:
        return (
          background: U.Theme.primary.withOpacity(opacity),
          foreground: U.Theme.onPrimary.withOpacity(opacity),
        );
      case ButtonColor.secondary:
        return (
          background: U.Theme.secondary.withOpacity(opacity),
          foreground: U.Theme.onSecondary.withOpacity(opacity),
        );
    }
  }

  ({U.TextSize size, U.TextWeight weight}) get _textStyle {
    switch (size) {
      case ButtonSize.sm:
        return (size: U.TextSize.sm, weight: U.TextWeight.medium);
      case ButtonSize.md:
        return (size: U.TextSize.md, weight: U.TextWeight.medium);
      case ButtonSize.lg:
        return (size: U.TextSize.lg, weight: U.TextWeight.medium);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _colors.background,
      borderRadius: BorderRadius.circular(U.Theme.radius),
      child: InkWell(
        borderRadius: BorderRadius.circular(U.Theme.radius),
        onTap: loading || disabled ? null : onPressed,
        child: Container(
          height: _size,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              if (!_hasTrailing) const Spacer(),
              U.Text(
                title,
                size: _textStyle.size,
                weight: _textStyle.weight,
                color: _colors.foreground,
              ),
              if (loading) ...[
                const SizedBox(width: 10),
                U.Loading(
                  isSmall: true,
                  color: _colors.foreground,
                )
              ],
              const Spacer(),
              if (_hasTrailing) trailing!,
            ],
          ),
        ),
      ),
    );
  }
}
