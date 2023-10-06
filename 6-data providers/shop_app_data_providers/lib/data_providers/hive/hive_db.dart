import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'package:shop_app_data_providers/tool_kit.dart/tool_kit.dart' as T;

abstract class HiveDB {
  //
  static Future<void> init({required String appName}) async {
    //
    if (T.Utils.isWeb) {
      Hive.init('');
    } else {
      var docsDir = await getApplicationDocumentsDirectory();
      var appDir = await Directory('${docsDir.path}/$appName').create();
      Hive.init(appDir.path);
    }
  }

  static Future<void> openBox(String name) async {
    await Hive.openBox(name);
  }

  static bool setValue<T>(
    String boxName,
    String key,
    T value,
  ) {
    if (!Hive.isBoxOpen(boxName)) {
      throw '$boxName Box is not oppened yet!';
    }
    try {
      Hive.box(boxName).put(key, value);
      return true;
    } catch (_) {
      return false;
    }
  }

  static T? getValue<T>(
    String boxName,
    String key,
  ) {
    if (!Hive.isBoxOpen(boxName)) {
      throw '$boxName Box is not oppened yet!';
    }
    try {
      return Hive.box(boxName).get(key.toString());
    } catch (_) {
      return null;
    }
  }
}
