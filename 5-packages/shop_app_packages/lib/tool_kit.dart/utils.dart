import 'package:flutter/foundation.dart';
import 'package:universal_io/io.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';

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

  static Future<bool> needToUpdate({
    required String compareVersion,
  }) async {
    final packageInfo = await PackageInfo.fromPlatform();
    final currenctSplit = packageInfo.version.split('.');
    final currentMajor = int.tryParse(currenctSplit[0]) ?? 0;
    final currentMinor = int.tryParse(currenctSplit[1]) ?? 0;
    final currentPatch = int.tryParse(currenctSplit[2]) ?? 0;

    final compareSplit = compareVersion.split('.');
    final compareMajor = int.tryParse(compareSplit[0]) ?? 0;
    final compareMinor = int.tryParse(compareSplit[1]) ?? 0;
    final comparePatch = int.tryParse(compareSplit[2]) ?? 0;

    if (currentMajor < compareMajor) {
      return true;
    } else if (currentMajor == compareMajor && currentMinor < compareMinor) {
      return true;
    } else if (currentMajor == compareMajor &&
        currentMinor == compareMinor &&
        currentPatch < comparePatch) {
      return true;
    } else {
      return false;
    }
  }

  static Future<String> getDeviceUid() async {
    final deviceInfo = DeviceInfoPlugin();
    if (isWeb) {
      final webInfo = await deviceInfo.webBrowserInfo;
      return '${webInfo.deviceMemory}-${webInfo.hardwareConcurrency}-${webInfo.vendor}-${webInfo.browserName.toString()}';
    } else {
      switch (platform) {
        case 'windows':
          final winInfo = await deviceInfo.windowsInfo;
          return '${winInfo.deviceId}-${winInfo.userName}';
        case 'linux':
          final linuxInfo = await deviceInfo.linuxInfo;
          return '${linuxInfo.machineId}';
        case 'macos':
          final macInfo = await deviceInfo.macOsInfo;
          return '${macInfo.computerName}-${macInfo.memorySize}';

        case 'android':
          final androidInfo = await deviceInfo.androidInfo;
          return '${androidInfo.bootloader}-${androidInfo.serialNumber}';
        case 'ios':
          final iosInfo = await deviceInfo.iosInfo;
          return '${iosInfo.identifierForVendor}';
        default:
          return 'A86242fs81d2g1483l17220gd3238i18245fc3hb2m1gfd41h2424787';
      }
    }
  }
}
