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
  final otpGenerate = '/client/otp/generate';
  final otpConfirm = '/client/otp/confirm';
  final otpRegister = '/client/otp/register';
  final refresh = '/client/auth/refresh';
  final logout = '/client/auth/logout';
  final favorite = '/client/favorite';
  final shopItem = '/client/shopItem/';
  final shopItemIncrement = '/client/shopItem/inc';
  final shopItemDecrement = '/client/shopItem/dec';
}
