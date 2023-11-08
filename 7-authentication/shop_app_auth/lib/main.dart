import 'package:flutter/material.dart';
import 'package:shop_app_auth/data_providers/hive_db/hive_db.dart';
import 'package:shop_app_auth/data_providers/shop_api/shop_api.dart';
import 'package:shop_app_auth/domains/store_repository/store_repository.dart';
import 'package:shop_app_auth/modules/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ShopApi.init(logger: false);
  await HiveDB.init(appName: 'shopApp');
  final storeRepo = await StoreRepository.init();
  runApp(
    App(storeRepo: storeRepo),
  );
}
