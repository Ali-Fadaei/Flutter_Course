import 'package:flutter/material.dart';
import 'package:shop_app_data_providers/data_providers/hive_db/hive_db.dart';
import 'package:shop_app_data_providers/data_providers/shop_api/shop_api.dart';
import 'package:shop_app_data_providers/domains/store_repository/models/category.dart';
import 'package:shop_app_data_providers/domains/store_repository/models/product.dart';
import 'package:shop_app_data_providers/domains/store_repository/store_box.dart';

void main() async {
  ShopApi.init(logger: true);
  await HiveDB.init(appName: 'shopApp');

  await StoreBox.open();

  StoreBox.setFavorites([
    const Product(
      id: 1,
      title: 'title',
      rating: 0,
      price: 0,
      image: 'image',
      description: 'description',
      category: Category(
        id: 1,
        title: 'title',
        image: 'image',
        color: Colors.transparent,
      ),
    )
  ]);

  print(StoreBox.getFavorites());

  // runApp(const App());
}
