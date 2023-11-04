import 'package:flutter/material.dart';
import 'package:shop_app_data_providers/data_providers/hive_db/hive_db.dart';
import 'package:shop_app_data_providers/data_providers/shop_api/shop_api.dart';
import 'package:shop_app_data_providers/domains/store_repository/models/category.dart';

void main() async {
  ShopApi.init(logger: true);
  await HiveDB.init(appName: 'shopApp');

  const mammad = 'mammmad';

  await HiveDB.openBox(boxName: mammad);

  HiveDB.setValue(
    boxName: mammad,
    key: 'flutter',
    value: const Category(
      id: 0,
      title: 'title',
      image: 'image',
      color: Colors.transparent,
    ),
    toMap: (value) => value.toMap(),
  );

  final res = HiveDB.getValue(
    boxName: mammad,
    key: 'flutter',
    fromMap: (e) => Category.fromMap(e),
  );

  // HiveDB.setValue(
  //   boxName: mammad,
  //   key: 'flutter',
  //   value: const Category(
  //     id: 0,
  //     title: 'title',
  //     image: 'image',
  //     color: Colors.transparent,
  //   ).toMap(),
  // );

  // final res = Category.fromMap(
  //   HiveDB.getValue(boxName: mammad, key: 'flutter'),
  // );

  print(res);
  // runApp(const App());
}
