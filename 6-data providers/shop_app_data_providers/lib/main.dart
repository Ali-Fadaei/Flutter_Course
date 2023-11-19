import 'package:flutter/material.dart';
import 'package:shop_app_data_providers/data_providers/hive_db/hive_db.dart';
import 'package:shop_app_data_providers/data_providers/shop_api/shop_api.dart';
import 'package:shop_app_data_providers/domains/store_repository/store_repository.dart';
import 'package:shop_app_data_providers/modules/app/app.dart';

void main() async {
  //
  ShopApi.init(logger: true);
  await HiveDB.init(appName: 'shopApp');
  final storeRepo = await StoreRepository.init();

  runApp(
    App(storeRepo: storeRepo),
  );
}
