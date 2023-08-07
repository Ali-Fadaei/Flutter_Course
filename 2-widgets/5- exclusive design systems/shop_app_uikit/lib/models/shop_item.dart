import 'package:shop_app_uikit/models/product.dart';

class ShopItem {
//
  final Product product;

  int count;

  ShopItem({
    required this.product,
    this.count = 1,
  });
}
