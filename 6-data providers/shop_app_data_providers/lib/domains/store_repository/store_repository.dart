import 'package:shop_app_data_providers/data_providers/shop_api/shop_api.dart';
import 'package:shop_app_data_providers/domains/store_repository/models/category.dart';
import 'package:shop_app_data_providers/domains/store_repository/models/product.dart';
import 'package:shop_app_data_providers/domains/store_repository/models/shop_item.dart';
import 'package:shop_app_data_providers/domains/store_repository/store_box.dart';

class StoreRepository {
//

  static Future<StoreRepository> init() async {
    await StoreBox.open();
    return StoreRepository();
  }

  // List<Product> _favorites = [];

  // List<ShopItem> _shopItems = [];

  // final latency = 1000;

  Future<List<Product>> readProducts({
    int? id,
    String? title,
    double? minRating,
    double? maxRating,
    int? minPrice,
    int? maxPrice,
    List<int>? categoriesIds,
    int? sort,
    int? order,
  }) async {
    final res = await ShopApi.client.get(
      ShopApi.urls.product,
      param: id?.toString(),
      queryParams: {
        'start': 0,
        'offset': 100,
        'categoryIds': categoriesIds,
        'title': title,
        'minRate': minRating,
        'maxRate': maxRating,
        'minPrice': minPrice,
        'maxPrice': maxPrice,
        'sort': sort,
        'order': order,
        'isActive': true,
      },
    );

    if (id == null) {
      return List.from(res.data.map((e) => Product.fromMap(e)));
    } else {
      return [Product.fromMap(res.data)];
    }
  }

  Future<List<Category>> readCategories({int? id}) async {
    final res = await ShopApi.client.get(
      ShopApi.urls.productCategory,
      param: id?.toString(),
    );
    if (id == null) {
      return List.from(res.data.map((e) => Category.fromMap(e)));
    } else {
      return [Category.fromMap(res.data)];
    }
  }

  Future<List<Product>> readFavorites() async {
    return StoreBox.getFavorites();
  }

  Future<void> updateFavorites(List<Product> favs) async {
    StoreBox.setFavorites(favs);
  }

  Future<List<ShopItem>> readShopItems() async {
    return StoreBox.getShopItems();
  }

  Future<void> updateShopItems(List<ShopItem> shopItems) async {
    StoreBox.setShopItems(shopItems);
  }

  Future<int> readDiscount(String discountCode) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return 15;
  }

  Future<String> createOrder(
    List<ShopItem> shopItems,
    String address,
    String discountCode,
  ) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return 'https://';
  }
}
