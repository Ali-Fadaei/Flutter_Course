import 'package:flutter/material.dart';
import './ui_kit.dart' as U;

enum OutlinedButtonSize { sm, md, lg }

enum OutlinedButtonColor { primary, secondary }

class OutlinedButton extends StatelessWidget {
  ///
  final bool loading;

  final bool disabled;

  final String title;

  final OutlinedButtonSize size;

  final OutlinedButtonColor color;

  final void Function() onPressed;

  const OutlinedButton({
    super.key,
    this.loading = false,
    this.disabled = false,
    required this.title,
    required this.onPressed,
    this.size = OutlinedButtonSize.md,
    this.color = OutlinedButtonColor.primary,
  });

  double get _size {
    switch (size) {
      case OutlinedButtonSize.sm:
        return 30;
      case OutlinedButtonSize.md:
        return 40;
      case OutlinedButtonSize.lg:
        return 50;
    }
  }

  ({Color textColor, Color outlineColor}) get _colors {
    var opacity = disabled || loading ? 0.75 : 1.0;
    switch (color) {
      case OutlinedButtonColor.primary:
        return (
          textColor: U.Theme.primary.withOpacity(opacity),
          outlineColor: U.Theme.primary.withOpacity(opacity),
        );
      case OutlinedButtonColor.secondary:
        return (
          textColor: U.Theme.secondary.withOpacity(opacity),
          outlineColor: U.Theme.secondary.withOpacity(opacity),
        );
    }
  }

  ({U.TextSize size, U.TextWeight weight}) get _textStyle {
    switch (size) {
      case OutlinedButtonSize.sm:
        return (size: U.TextSize.sm, weight: U.TextWeight.regular);
      case OutlinedButtonSize.md:
        return (size: U.TextSize.md, weight: U.TextWeight.medium);
      case OutlinedButtonSize.lg:
        return (size: U.TextSize.lg, weight: U.TextWeight.bold);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(U.Theme.radius),
      child: InkWell(
        onTap: loading || disabled ? null : onPressed,
        borderRadius: BorderRadius.circular(U.Theme.radius),
        child: Container(
          height: _size,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(U.Theme.radius),
            border: Border.all(
              width: 2,
              color: _colors.outlineColor,
            ),
          ),
          child: Row(
            children: [
              const Spacer(),
              U.Text(
                title,
                size: _textStyle.size,
                weight: _textStyle.weight,
                color: _colors.textColor,
              ),
              if (loading) ...[
                const SizedBox(width: 8),
                U.Loading(
                  isSmall: true,
                  color: _colors.textColor,
                ),
              ],
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
