import 'package:flutter/material.dart';
import 'package:shop_app_auth/data_providers/hive/hive_db.dart';
import 'package:shop_app_auth/data_providers/shop_api/shop_api.dart';
import 'package:shop_app_auth/domains/store_repository/store_repository.dart';
import 'package:shop_app_auth/modules/app/app.dart';

void main() async {
  //
  ShopApi.init(logger: true);
  await HiveDB.init(appName: 'shopApp');
  final storeRepo = await StoreRepository.init();

  runApp(
    App(storeRepo: storeRepo),
  );
}
