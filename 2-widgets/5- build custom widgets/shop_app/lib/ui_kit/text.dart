import 'package:flutter/material.dart' as M;
import 'package:flutter/widgets.dart';
import 'package:shop_app/ui_kit/ui_kit.dart' as U;

enum TextSize {
  xs,
  sm,
  md,
  lg,
  xl,
  xxl,
}

enum TextWeight {
  light,
  regular,
  normal,
  bold,
}

class Text extends M.StatelessWidget {
//
  final String text;

  final TextSize size;

  final TextWeight weight;

  final M.Color? color;

  const Text({
    super.key,
    required this.text,
    this.size = TextSize.md,
    this.weight = TextWeight.regular,
    this.color = U.Theme.onSurface,
  });

  double get fontSize {
    switch (size) {
      case TextSize.xs:
        return 10.0;
      case TextSize.sm:
        return 12.0;
      case TextSize.md:
        return 14.0;
      case TextSize.lg:
        return 16.0;
      case TextSize.xl:
        return 18.0;
      case TextSize.xxl:
        return 20.0;
    }
  }

  FontWeight get fontWeight {
    switch (weight) {
      case TextWeight.light:
        return FontWeight.w300;
      case TextWeight.regular:
        return FontWeight.w400;
      case TextWeight.normal:
        return FontWeight.w500;
      case TextWeight.bold:
        return FontWeight.w700;
    }
  }

  @override
  M.Widget build(M.BuildContext context) {
    return M.Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
