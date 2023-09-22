import 'package:flutter/material.dart';

abstract class Utils {
//

  static bool isDesktop(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return width >= 720;
  }

  static bool isTablet(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return width >= 480;
  }

  static bool isMobile(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return width < 480;
  }
}
