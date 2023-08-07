import 'package:shop_app_m3/models/product.dart';

class ShopItem {
//
  final Product product;

  int count;

  ShopItem({
    required this.product,
    this.count = 1,
  });
}
