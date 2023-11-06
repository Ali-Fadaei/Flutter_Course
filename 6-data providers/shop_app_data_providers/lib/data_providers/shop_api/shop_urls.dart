import 'package:flutter/foundation.dart';

class ShopServers {
  //
  final develop = 'https://shop.infi-tech.ir';

  final release = 'https://shop.infi-tech.ir';

  String get current => kDebugMode ? develop : release;
}

class ShopUrls {
  //
  final productCategory = '/product-category';
  final product = '/product';
}
