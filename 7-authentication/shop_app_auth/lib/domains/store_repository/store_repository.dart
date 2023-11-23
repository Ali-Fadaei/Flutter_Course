import 'package:shop_app_auth/data_providers/shop_api/shop_api.dart';
import 'package:shop_app_auth/domains/store_repository/models/category.dart';
import 'package:shop_app_auth/domains/store_repository/models/product.dart';
import 'package:shop_app_auth/domains/store_repository/models/shop_item.dart';
import 'package:shop_app_auth/domains/store_repository/store_box.dart';

class StoreRepository {
//
  static Future<StoreRepository> init() async {
    await StoreBox.open();
    return StoreRepository();
  }

  final latency = 1000;

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

  Future<List<Product>> readFavorites(String token) async {
    final res =
        await ShopApi.client.get(ShopApi.urls.favorite, accessToken: token);
    return List.from(res.data.map((e) => Product.fromMap(e)));
  }

  Future<void> addFavorite(String token, Product product) async {
    await ShopApi.client.post(
      ShopApi.urls.favorite,
      accessToken: token,
      data: {'productId': product.id},
    );
  }

  Future<void> removeFavorite(String token, Product product) async {
    await ShopApi.client.delete(
      ShopApi.urls.favorite,
      accessToken: token,
      ids: [product.id],
    );
  }

  Future<List<ShopItem>> readShopItems(String token) async {
    final res = await ShopApi.client.get(
      ShopApi.urls.shopItem,
      accessToken: token,
    );
    return List.from(
      res.data.map(
        (e) => ShopItem.fromMap(e),
      ),
    );
  }

  // Future<void> updateShopItems(List<ShopItem> shopItems) async {
  //   final res = await ShopApi.client.post(
  //     ShopApi.urls.shopItemIncrement
  //   );
  // }

  Future<void> shopItemIncrement(String token, Product product) async {
    await ShopApi.client.post(
      ShopApi.urls.shopItemIncrement,
      accessToken: token,
      data: {"productId": product.id},
    );
  }

  Future<void> shopItemDecrement(String token, Product product) async {
    await ShopApi.client.post(
      ShopApi.urls.shopItemDecrement,
      accessToken: token,
      data: {"productId": product.id},
    );
  }

  Future<int> readDiscount(String discountCode) async {
    await Future.delayed(Duration(milliseconds: latency));
    return 15;
  }

  Future<String> createOrder(
    List<ShopItem> shopItems,
    String address,
    String discountCode,
  ) async {
    await Future.delayed(Duration(milliseconds: latency));
    return 'https://';
  }
}
