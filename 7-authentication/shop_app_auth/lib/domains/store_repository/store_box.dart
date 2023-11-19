import 'package:shop_app_auth/data_providers/hive/hive_db.dart';
import 'package:shop_app_auth/domains/store_repository/models/product.dart';
import 'package:shop_app_auth/domains/store_repository/models/shop_item.dart';

enum StoreBoxKeys {
  favorites,
  shopItems,
}

abstract class StoreBox {
  //
  static const name = 'store';

  static var isOpen = false;

  static Future<void> open() async {
    if (!isOpen) {
      await HiveDB.openBox(boxName: name);
    }
  }

  static void setFavorites(List<Product> favs) {
    HiveDB.setValue(
      box: name,
      key: StoreBoxKeys.favorites.index,
      value: favs.map((e) => e.toMap()).toList(),
    );
  }

  static List<Product> getFavorites() {
    final res = HiveDB.getValue(
          box: name,
          key: StoreBoxKeys.favorites.index,
        ) ??
        [];
    return List.from(res.map((e) => Product.fromMap(e)));
  }

  static void setShopItems(List<ShopItem> shopItems) {
    HiveDB.setValue(
      box: name,
      key: StoreBoxKeys.shopItems.index,
      value: shopItems.map((e) => e.toMap()).toList(),
    );
  }

  static List<ShopItem> getShopItems() {
    final result = HiveDB.getValue(
          box: name,
          key: StoreBoxKeys.shopItems.index,
        ) ??
        [];
    return List.from(result.map((e) => ShopItem.fromMap(e)));
  }
}
