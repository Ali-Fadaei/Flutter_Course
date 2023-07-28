import 'package:shop_app/domains/store_repository/models/product.dart';

class ShopCart {
//
  final List<ShopItem> shopItems;

  final String deliveryAddress;

  final String deliveryTime;

  const ShopCart({
    this.shopItems = const [],
    this.deliveryAddress = '',
    this.deliveryTime = '',
  });

  int get totalAmount {
    var temp = 0;
    for (var element in shopItems) {
      temp += element.product.price;
    }
    return temp;
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
