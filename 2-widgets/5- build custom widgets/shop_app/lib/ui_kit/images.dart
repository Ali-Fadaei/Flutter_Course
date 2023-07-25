import 'package:flutter/material.dart' as M;

abstract class Images {
//
  // Logos
  static const shopLogo = 'assets/logos/Amazon.png';

  //products
  static const a14 = 'assets/imgs/products/a14.png';
  static const dokme = 'assets/imgs/products/dokme.png';
  static const hdmiCharger = 'assets/imgs/products/hdmicharger.png';
  static const ideapad = 'assets/imgs/products/ideapad.png';
  static const inpuds = 'assets/imgs/products/inpuds.png';
  static const iphone = 'assets/imgs/products/iphone.png';
  static const katana = 'assets/imgs/products/katana.png';
  static const keymouse = 'assets/imgs/products/keymouse.png';
  static const keypad = 'assets/imgs/products/keypad.png';
  static const m10 = 'assets/imgs/products/m10.png';
  static const macM1 = 'assets/imgs/products/macm1.png';
  static const modem = 'assets/imgs/products/modem.png';
  static const netStrg = 'assets/imgs/products/netstrg.png';
  static const r12 = 'assets/imgs/products/r12.png';
  static const redmi = 'assets/imgs/products/redmi.png';
  static const rog = 'assets/imgs/products/rog.png';
  static const vivaBook = 'assets/imgs/products/vivabook.png';

  //categories
  static const eDevices = 'assets/imgs/categories/e-devices.png';

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
  static const requiredIcon = 'assets/icons/required.png';
}

class Image extends M.StatelessWidget {
//
  final String path;

  final M.Color? color;

  const Image({super.key, required this.path, this.color});

  @override
  M.Widget build(M.BuildContext context) {
    return M.Image.asset(
      path,
      color: color,
    );
  }
}

class NetworkImage extends M.StatelessWidget {
//
  final String url;

  const NetworkImage({super.key, required this.url});

  @override
  M.Widget build(M.BuildContext context) {
    return M.Image.network(url);
  }
}
