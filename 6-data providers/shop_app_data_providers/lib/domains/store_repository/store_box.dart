import 'package:shop_app_data_providers/data_providers/hive/hive_db.dart';

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

  static bool setFavorites(List<int> favs) {
    return HiveDB.setValue(
      name,
      StoreBoxKeys.favorites.toString(),
      favs,
    );
  }

  static List<int> getFavorites() {
    return HiveDB.getValue(
      name,
      StoreBoxKeys.favorites.toString(),
    );
  }

  static bool setShopItems(List<int> items) {
    return HiveDB.setValue(
      name,
      StoreBoxKeys.shopItems.toString(),
      items,
    );
  }

  static List<int> getShopItems() {
    return HiveDB.getValue(
      name,
      StoreBoxKeys.shopItems.toString(),
    );
  }
}
