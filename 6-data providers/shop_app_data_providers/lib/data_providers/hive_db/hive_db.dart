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
    required String boxName,
    required String key,
    required T value,
    Map<String, dynamic> Function(T value)? toMap,
  }) {
    if (toMap != null) {
      Hive.box(boxName).put(key, toMap(value));
    } else {
      Hive.box(boxName).put(key, value);
    }
  }

  static T? getValue<T>({
    required String boxName,
    required String key,
    T? Function(dynamic e)? fromMap,
  }) {
    if (fromMap != null) {
      return fromMap(Hive.box(boxName).get(key));
    } else {
      return Hive.box(boxName).get(key);
    }
  }
}
