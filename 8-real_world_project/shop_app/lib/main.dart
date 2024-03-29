import 'package:flutter/material.dart';
import 'package:shop_app/data_providers/hive_db/hive_db.dart';
import 'package:shop_app/data_providers/shop_api/shop_api.dart';
import 'package:shop_app/domains/store_repository/store_repository.dart';
import 'package:shop_app/domains/user_repository/user_repository.dart';
import 'package:shop_app/modules/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveDB.init(appName: 'shopApp');
  final userRepo = await UserRepository.init();
  final storeRepo = await StoreRepository.init();
  ShopApi.init(
    logger: true,
    onUnAuthorized: userRepo.logOut,
  );

  runApp(
    App(
      userRepo: userRepo,
      storeRepo: storeRepo,
    ),
  );
}
