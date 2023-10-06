import 'package:flutter/material.dart';
import 'package:shop_app_data_providers/data_providers/hive/hive_db.dart';
import 'package:shop_app_data_providers/modules/app/app.dart';

void main() async {
  await HiveDB.init(appName: 'shopApp');
  await HiveDB.openBox('test');
  HiveDB.setValue<String>(
    'test',
    'key1',
    'value1',
  );
  print(HiveDB.getValue('test', 'key1'));

  runApp(const App());
}