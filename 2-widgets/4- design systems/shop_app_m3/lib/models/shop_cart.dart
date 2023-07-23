import 'package:shop_app_m3/models/product.dart';

class ShopCart {
//
  List<ShopItem> shopItems;

  String deliveryAddress;

  DateTime? deliveryTime;

  ShopCart({
    required this.shopItems,
    this.deliveryAddress = '',
    this.deliveryTime,
  });

  int get totalAmount {
    return 0;
  }
}

class ShopItem {
//
  final Product product;

  int count;

  ShopItem({
    required this.product,
    this.count = 1,
  });
}
