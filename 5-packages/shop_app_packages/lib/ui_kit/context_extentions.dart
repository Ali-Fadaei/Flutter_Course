import 'package:flutter/material.dart';

extension ContextUiUtils on BuildContext {
  //
  Size get mediaQuerySize => MediaQuery.of(this).size;

  double get height => mediaQuerySize.height;

  double get width => mediaQuerySize.width;

  bool get isDesktop => width >= 720;

  bool get isTablet => 720 > width && width >= 480;

  bool get isMobile => 480 > width;

  double get scaledWidth {
    late double temp;
    switch (width) {
      case <= 480:
        temp = width;
        break;
      case > 480 && <= 720:
        temp = width * 0.95;
        break;
      case > 720:
        temp = width * 0.90;
        break;
      default:
    }
    return temp;
  }
}
