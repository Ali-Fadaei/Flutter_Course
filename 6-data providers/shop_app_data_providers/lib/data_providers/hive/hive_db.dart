import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'package:shop_app_data_providers/tool_kit/tool_kit.dart' as T;

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

  static void setValue<T>({
    required String box,
    required String key,
    required T? value,
  }) {
    if (!Hive.isBoxOpen(box)) {
      throw '$box Box is not oppened yet!';
    }
    Hive.box(box).put(key, value);
  }

  static T? getValue<T>({
    required String box,
    required String key,
  }) {
    if (!Hive.isBoxOpen(box)) {
      throw '$box Box is not oppened yet!';
    }
    return Hive.box(box).get(key);
  }
}
