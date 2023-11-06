import 'package:shop_app_data_providers/data_providers/hive/hive_db.dart';
import 'package:shop_app_data_providers/domains/store_repository/models/product.dart';
import 'package:shop_app_data_providers/domains/store_repository/models/shop_item.dart';

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
      await HiveDB.openBox(name);
      isOpen = true;
    }
  }

  static void setFavorites(List<Product> favs) {
    return HiveDB.setValue(
      box: name,
      key: StoreBoxKeys.favorites.toString(),
      value: favs.map((e) => e.toMap()),
    );
  }

  static List<Product> getFavorites() {
    final res = HiveDB.getValue(
          box: name,
          key: StoreBoxKeys.favorites.toString(),
        ) ??
        [];
    return List.from(res.map((e) => Product.fromMap(e)));
  }

  static void setShopItems(List<ShopItem> items) {
    return HiveDB.setValue(
      box: name,
      key: StoreBoxKeys.shopItems.toString(),
      value: items.map((e) => e.toMap()),
    );
  }

  static List<ShopItem> getShopItems() {
    final res = HiveDB.getValue(
          box: name,
          key: StoreBoxKeys.shopItems.toString(),
        ) ??
        [];
    return List.from(res.map((e) => ShopItem.fromMap(e)));
  }
}
