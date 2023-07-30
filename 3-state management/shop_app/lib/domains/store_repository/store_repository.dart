import 'package:flutter/material.dart';
import 'package:shop_app/domains/store_repository/models/category.dart';
import 'package:shop_app/domains/store_repository/models/product.dart';
import 'package:shop_app/domains/store_repository/models/shop_cart.dart';

class StoreRepository {
//
  List<Category> categories = [];

  List<Product> products = [];

  List<Product> favorites = [];

  List<ShopItem> shopItems = [];

  String deliveryAddress = '';

  String deliveryTime = '';

  StoreRepository() {
    categories = [
      Category(
        title: 'e-Devices',
        image: 'assets/imgs/categories/e-devices.png',
        color: Color.fromARGB(255, 161, 207, 178),
      ),
      Category(
        title: 'e-Devices',
        image: 'assets/imgs/categories/e-devices.png',
        color: Color.fromARGB(255, 255, 210, 161),
      ),
      Category(
        title: 'e-Devices',
        image: 'assets/imgs/categories/e-devices.png',
        color: Color.fromARGB(255, 217, 197, 224),
      ),
      Category(
        title: 'e-Devices',
        image: 'assets/imgs/categories/e-devices.png',
        color: Color.fromARGB(255, 218, 241, 254),
      ),
    ];
    products = [
      Product(
        title: 'Samsung A14',
        rating: 5,
        price: 545454545,
        image: 'assets/imgs/products/a14.png',
        description:
            'sdfvsdfasdfasdfasdfasdfsd asdf.,sdjn fsdlkfjsdn fkljsdn flasdkj fhasdlfjkasdhklfjsd nflkasdj fnasdlkfjnasd lkjasdn flksdjn fsdklfjnasdl kjdbn flasdkj fnasd; kfjna;',
        category: categories[0],
      ),
      Product(
        title: 'Samsung Dokme',
        rating: 2,
        price: 12312,
        image: 'assets/imgs/products/dokme.png',
        description:
            'sdfvsdfasdfasdfasdfasdfsd asdf.,sdjn fsdlkfjsdn fkljsdn flasdkj fhasdlfjkasdhklfjsd nflkasdj fnasdlkfjnasd lkjasdn flksdjn fsdklfjnasdl kjdbn flasdkj fnasd; kfjna;',
        category: categories[0],
      ),
      Product(
        title: 'lenovo idepad',
        rating: 5,
        price: 456320,
        image: 'assets/imgs/products/ideapad.png',
        description:
            'sdfvsdfasdfasdfasdfasdfsd asdf.,sdjn fsdlkfjsdn fkljsdn flasdkj fhasdlfjkasdhklfjsd nflkasdj fnasdlkfjnasd lkjasdn flksdjn fsdklfjnasdl kjdbn flasdkj fnasd; kfjna;',
        category: categories[0],
      ),
      Product(
        title: 'Asus VivoBook',
        rating: 5,
        price: 1221000,
        image: 'assets/imgs/products/vivabook.png',
        description:
            'sdfvsdfasdfasdfasdfasdfsd asdf.,sdjn fsdlkfjsdn fkljsdn flasdkj fhasdlfjkasdhklfjsd nflkasdj fnasdlkfjnasd lkjasdn flksdjn fsdklfjnasdl kjdbn flasdkj fnasd; kfjna;',
        category: categories[0],
      ),
      Product(
        title: 'Asus VivoBook',
        rating: 5,
        price: 9990009,
        image: 'assets/imgs/products/vivabook.png',
        description:
            'sdfvsdfasdfasdfasdfasdfsd asdf.,sdjn fsdlkfjsdn fkljsdn flasdkj fhasdlfjkasdhklfjsd nflkasdj fnasdlkfjnasd lkjasdn flksdjn fsdklfjnasdl kjdbn flasdkj fnasd; kfjna;',
        category: categories[0],
      ),
      Product(
        title: 'Asus VivoBook',
        rating: 5,
        price: 33434,
        image: 'assets/imgs/products/vivabook.png',
        description:
            'sdfvsdfasdfasdfasdfasdfsd asdf.,sdjn fsdlkfjsdn fkljsdn flasdkj fhasdlfjkasdhklfjsd nflkasdj fnasdlkfjnasd lkjasdn flksdjn fsdklfjnasdl kjdbn flasdkj fnasd; kfjna;',
        category: categories[0],
      ),
    ];
  }

  void updateFavs(List<Product> favs) {
    favorites = favs;
  }

  void updateShopItems(List<ShopItem> shopItems) {
    this.shopItems = shopItems;
  }

  void updateDeliveryAddress(String address) {
    deliveryAddress = address;
  }

  void updateDeliveryTime(String time) {
    deliveryTime = time;
  }
}
