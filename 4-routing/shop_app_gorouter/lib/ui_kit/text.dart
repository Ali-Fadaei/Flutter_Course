import 'package:flutter/material.dart' as M;
import 'package:flutter/widgets.dart';
import 'ui_kit.dart' as U;

enum TextFont { bYekan, iranSans, ghasem }

enum TextSize { xs, sm, md, lg, xl, xxl, xxxl }

enum TextWeight { light, regular, medium, bold }

class Text extends M.StatelessWidget {
  ///
  final String text;

  final TextFont font;

  final TextSize size;

  final TextWeight weight;

  final M.Color? color;

  const Text(
    this.text, {
    super.key,
    this.font = TextFont.iranSans,
    this.size = TextSize.md,
    this.weight = TextWeight.regular,
    this.color = U.Theme.onSurface,
  });

  String get fontFamily {
    switch (font) {
      case TextFont.bYekan:
        return 'BYekan';
      case TextFont.iranSans:
        return 'IranSans';
      case TextFont.ghasem:
        return 'AGhasem';
    }
  }

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
      case TextSize.xxxl:
        return 22.0;
    }
  }

  FontWeight get fontWeight {
    switch (weight) {
      case TextWeight.light:
        return FontWeight.w300;
      case TextWeight.regular:
        return FontWeight.w400;
      case TextWeight.medium:
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
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
