import 'dart:ui';

import 'package:flutter/widgets.dart';

abstract class Theme {
  //

  static late final BuildContext rootContext;

  static bool darkMode = platformDarkMode;

  static bool get platformDarkMode =>
      WidgetsBinding.instance.platformDispatcher.platformBrightness ==
      Brightness.dark;

  static void _enableSystemBrightnessListener() {
    WidgetsBinding.instance.platformDispatcher.onPlatformBrightnessChanged =
        () {
      darkMode = platformDarkMode;
      rebuildAllChildren(rootContext);
    };
  }

  static void _disableSystemBrightnessListener() {
    WidgetsBinding.instance.platformDispatcher.onPlatformBrightnessChanged =
        null;
  }

  static void init(BuildContext rootContext, int id) {
    Theme.rootContext = rootContext;
    changeMode(id);
  }

  static void changeMode(int id) {
    switch (id) {
      case 0:
        _disableSystemBrightnessListener();
        darkMode = true;
        break;
      case 1:
        _disableSystemBrightnessListener();
        darkMode = false;
        break;
      case 3:
        _enableSystemBrightnessListener();
        darkMode = platformDarkMode;
        break;
    }
    rebuildAllChildren(rootContext);
  }

  //neutral colors
  static get background =>
      darkMode ? const Color(0xFFF6F6F6) : const Color(0xFFF6F6F6);

  static const surface = Color(0xFFFEFEFE);

  static const onBackground = secondary;

  static const onSurface = secondary;

  static const outline = Color(0xFFE2E2E2);

  static const outline2 = Color(0xFF7C7C7C);

  //role colors
  static const primary = Color(0xFFF34E4E);

  static const onPrimary = surface;

  static const secondary = Color(0xFF110E39);

  static const onSecondary = surface;

  //
  static const radius = 15.0;

  static void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }
}
