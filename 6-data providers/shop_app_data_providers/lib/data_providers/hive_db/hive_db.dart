import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

abstract class HiveDB {
  //

  static Future<void> init({required String appName}) async {
    final docDir = await getApplicationDocumentsDirectory();
    final appDir = await Directory('${docDir.path}/$appName').create();
    Hive.init(kIsWeb ? '' : appDir.path);
  }

  static Future<void> openBox({required String boxName}) async {
    await Hive.openBox(boxName);
  }

  static void setValue<T>({
    required String box,
    required int key,
    required T value,
  }) {
    if (!Hive.isBoxOpen(box)) {
      throw Exception('$box box is not openned yet!');
    }
    Hive.box(box).put(key.toString(), value);
  }

  static T? getValue<T>({
    required String box,
    required int key,
  }) {
    if (!Hive.isBoxOpen(box)) {
      throw Exception('$box box is not openned yet!');
    }
    return Hive.box(box).get(key.toString());
  }
}
