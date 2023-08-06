import 'package:flutter/material.dart';
import './ui_kit.dart' as U;

enum OutlinedButtonSize { sm, md, lg }

enum OutlinedButtonColor { primary, secondary }

class OutlinedButton extends StatelessWidget {
  final String title;

  final OutlinedButtonSize size;

  final OutlinedButtonColor color;

  final void Function() onPressed;

  const OutlinedButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.size = OutlinedButtonSize.md,
    this.color = OutlinedButtonColor.primary,
  });

  double get _size {
    switch (size) {
      case OutlinedButtonSize.sm:
        return 40;
      case OutlinedButtonSize.md:
        return 50;
      case OutlinedButtonSize.lg:
        return 60;
    }
  }

  ({Color textColor, Color outlineColor}) get _colors {
    switch (color) {
      case OutlinedButtonColor.primary:
        return (textColor: U.Theme.primary, outlineColor: U.Theme.primary);
      case OutlinedButtonColor.secondary:
        return (textColor: U.Theme.secondary, outlineColor: U.Theme.secondary);
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
      color: U.Theme.surface,
      borderRadius: BorderRadius.circular(U.Theme.radius),
      child: InkWell(
        borderRadius: BorderRadius.circular(U.Theme.radius),
        onTap: onPressed,
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: _colors.outlineColor,
                  style: BorderStyle.solid,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(U.Theme.radius),
                color: U.Theme.surface),
            height: _size,
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Center(
              child: U.Text(
                title,
                color: _colors.textColor,
                font: U.TextFont.iranSans,
                weight: U.TextWeight.medium,
                size: U.TextSize.xl,
              ),
            )),
      ),
    );
  }
}
