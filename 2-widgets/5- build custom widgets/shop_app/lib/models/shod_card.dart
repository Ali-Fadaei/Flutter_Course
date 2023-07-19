import 'package:shop_app/models/product.dart';

class ShopCard {
//
  List<ShopItem> shopItems;

  String deliveryAddress;

  DateTime? deliveryTime;

  ShopCard({
    this.shopItems = const [],
    this.deliveryAddress = '',
    this.deliveryTime,
  });

  int get totalAmount {
    return 0;
  }
}

class ShopItem {
  //
  Product product;

  int count;

  ShopItem({
    required this.product,
    this.count = 1,
  });
}
