import 'package:flutter/material.dart' as M;
import 'package:flutter/widgets.dart';

abstract class Images {
  /// Logos
  static const shopLogo = 'assets/logos/Amazon.png';

  // Icons
  static const addIcon = 'assets/icons/add.png';
  static const arrowLeftIcon = 'assets/icons/arrow_left.png';
  static const categoriesIcon = 'assets/icons/categories.png';
  static const favoriteIcon = 'assets/icons/favorite.png';
  static const filterIcon = 'assets/icons/filter.png';
  static const menuIcon = 'assets/icons/menu.png';
  static const minIcon = 'assets/icons/min.png';
  static const notifIcon = 'assets/icons/notif.png';
  static const profileIcon = 'assets/icons/profile.png';
  static const removeIcon = 'assets/icons/remove.png';
  static const searchIcon = 'assets/icons/search.png';
  static const shareIcon = 'assets/icons/share.png';
  static const shopCartIcon = 'assets/icons/shopCart.png';
  static const storeIcon = 'assets/icons/store.png';
  static const checkBoxFilledIcon = 'assets/icons/check_box_fill.png';
  static const checkBoxEmptyIcon = 'assets/icons/check_box_empty.png';
  static const radioBoxFilledIcon = 'assets/icons/radio_box_fill.png';
  static const radioBoxEmptyIcon = 'assets/icons/radio_box_empty.png';
  static const requiredIcon = 'assets/icons/required.png';
  static const removIcon = 'assets/icons/removIcon.png';
  static const orderIcon = 'assets/icons/order.png';
  static const paymentIcon = 'assets/icons/payment.png';
  static const userInfoIcon = 'assets/icons/user_info.png';
  static const locationIcon = 'assets/icons/location.png';
  static const infoIcon = 'assets/icons/info.png';
  static const discountIcon = 'assets/icons/discount.png';

  // Vectors
  static const favEmpty = 'assets/imgs/vectors/empty_fav.png';
  static const cartEmpty = 'assets/imgs/vectors/empty_cart.png';
}

class Image extends M.StatelessWidget {
  ///
  final String path;

  final double? size;

  final M.Color? color;

  final M.BoxFit fit;

  const Image({
    super.key,
    required this.path,
    this.fit = BoxFit.contain,
    this.color,
    this.size,
  });

  @override
  M.Widget build(M.BuildContext context) {
    return M.Image.asset(
      path,
      color: color,
      height: size,
      width: size,
      fit: fit,
    );
  }
}

class NetworkImage extends M.StatelessWidget {
  ///
  final String url;

  const NetworkImage({super.key, required this.url});

  @override
  M.Widget build(M.BuildContext context) {
    return M.Image.network(url);
  }
}
