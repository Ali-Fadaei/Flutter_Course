import 'package:shop_app_m3/models/product.dart';

class ShopCard {

   List<Product> shopItems;

  String deliveryAddress;

  DateTime? deliveryTime;

  ShopCard({
    required this.shopItems,
    this.deliveryAddress = 'Ohadi',
    this.deliveryTime,
  });

  int get totalAmount {
    return 0;
  }
}

