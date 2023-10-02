import 'package:universal_io/io.dart';

import 'package:flutter/foundation.dart';

abstract class Utils {
  //
  static const isRelease = kReleaseMode;

  static const isDebug = kDebugMode;

  static const isWeb = kIsWeb;

  static String get platform => Platform.operatingSystem;

  static bool get isWindows => Platform.isWindows;

  static bool get isNativeWindows => isWindows && !isWeb;

  static bool get isWebWindows => isWindows && isWeb;

  static bool get isLinux => Platform.isLinux;

  static bool get isNativeLinux => isLinux && !isWeb;

  static bool get isWebLinux => isLinux && isWeb;

  static bool get isMacOs => Platform.isMacOS;

  static bool get isNativeMacOS => isMacOs && !isWeb;

  static bool get isWebMacOs => isMacOs && isWeb;

  static bool get isAndroid => Platform.isAndroid;

  static bool get isNativeAndroid => isAndroid && !isWeb;

  static bool get isWebAndroid => isAndroid && isWeb;

  static bool get isIOS => Platform.isIOS;

  static bool get isNativeIOS => isIOS && !isWeb;

  static bool get isWebIOS => isIOS && isWeb;

  static bool get isDesktop => isWindows || isLinux || isMacOs;

  static bool get isMbile => isAndroid || isIOS;
}
