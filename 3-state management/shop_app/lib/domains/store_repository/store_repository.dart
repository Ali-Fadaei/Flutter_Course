import 'package:flutter/material.dart';
import 'package:shop_app/domains/store_repository/models/category.dart';
import 'package:shop_app/domains/store_repository/models/product.dart';
import 'package:shop_app/domains/store_repository/models/shop_cart.dart';

class StoreRepository {
//
  // List<Category> categories = [];

  // List<Product> products = [];

  List<Product> _favorites = [];

  List<ShopItem> _shopItems = [];

  String _deliveryAddress = '';

  String _deliveryTime = '';

  // StoreRepository()

  Future<List<Product>> readProducts() async {
    await Future.delayed(const Duration(milliseconds: 100));
    var cats = await readCategories();
    return [
      Product(
        id: 0,
        title: 'Samsung A14',
        rating: 5,
        price: 545454545,
        image: 'assets/imgs/products/a14.png',
        description:
            'sdfvsdfasdfasdfasdfasdfsd asdf.,sdjn fsdlkfjsdn fkljsdn flasdkj fhasdlfjkasdhklfjsd nflkasdj fnasdlkfjnasd lkjasdn flksdjn fsdklfjnasdl kjdbn flasdkj fnasd; kfjna;',
        category: cats[0],
      ),
      Product(
        id: 1,
        title: 'Samsung Dokme',
        rating: 2,
        price: 12312,
        image: 'assets/imgs/products/dokme.png',
        description:
            'sdfvsdfasdfasdfasdfasdfsd asdf.,sdjn fsdlkfjsdn fkljsdn flasdkj fhasdlfjkasdhklfjsd nflkasdj fnasdlkfjnasd lkjasdn flksdjn fsdklfjnasdl kjdbn flasdkj fnasd; kfjna;',
        category: cats[0],
      ),
      Product(
        id: 2,
        title: 'lenovo idepad',
        rating: 5,
        price: 456320,
        image: 'assets/imgs/products/ideapad.png',
        description:
            'sdfvsdfasdfasdfasdfasdfsd asdf.,sdjn fsdlkfjsdn fkljsdn flasdkj fhasdlfjkasdhklfjsd nflkasdj fnasdlkfjnasd lkjasdn flksdjn fsdklfjnasdl kjdbn flasdkj fnasd; kfjna;',
        category: cats[0],
      ),
      Product(
        id: 3,
        title: 'Asus VivoBook',
        rating: 5,
        price: 1221000,
        image: 'assets/imgs/products/vivabook.png',
        description:
            'sdfvsdfasdfasdfasdfasdfsd asdf.,sdjn fsdlkfjsdn fkljsdn flasdkj fhasdlfjkasdhklfjsd nflkasdj fnasdlkfjnasd lkjasdn flksdjn fsdklfjnasdl kjdbn flasdkj fnasd; kfjna;',
        category: cats[0],
      ),
      Product(
        id: 4,
        title: 'Asus VivoBook',
        rating: 5,
        price: 9990009,
        image: 'assets/imgs/products/vivabook.png',
        description:
            'sdfvsdfasdfasdfasdfasdfsd asdf.,sdjn fsdlkfjsdn fkljsdn flasdkj fhasdlfjkasdhklfjsd nflkasdj fnasdlkfjnasd lkjasdn flksdjn fsdklfjnasdl kjdbn flasdkj fnasd; kfjna;',
        category: cats[0],
      ),
      Product(
        id: 5,
        title: 'Asus VivoBook',
        rating: 5,
        price: 33434,
        image: 'assets/imgs/products/vivabook.png',
        description:
            'sdfvsdfasdfasdfasdfasdfsd asdf.,sdjn fsdlkfjsdn fkljsdn flasdkj fhasdlfjkasdhklfjsd nflkasdj fnasdlkfjnasd lkjasdn flksdjn fsdklfjnasdl kjdbn flasdkj fnasd; kfjna;',
        category: cats[0],
      ),
    ];
  }

  Future<List<Category>> readCategories() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Category(
        id: 0,
        title: 'e-Devices',
        image: 'assets/imgs/categories/e-devices.png',
        color: Color.fromARGB(255, 161, 207, 178),
      ),
      Category(
        id: 1,
        title: 'e-Devices',
        image: 'assets/imgs/categories/e-devices.png',
        color: Color.fromARGB(255, 255, 210, 161),
      ),
      Category(
        id: 2,
        title: 'e-Devices',
        image: 'assets/imgs/categories/e-devices.png',
        color: Color.fromARGB(255, 217, 197, 224),
      ),
      Category(
        id: 3,
        title: 'e-Devices',
        image: 'assets/imgs/categories/e-devices.png',
        color: Color.fromARGB(255, 218, 241, 254),
      ),
    ];
  }

  Future<List<Product>> readFavorites() async {
    await Future.delayed(const Duration(seconds: 1));
    return _favorites;
  }

  Future<bool> updateFavorites(List<Product> favs) async {
    _favorites = favs;
    return true;
  }

  Future<List<ShopItem>> readShopItems() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _shopItems;
  }

  Future<bool> updateShopItems(List<ShopItem> shopItems) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _shopItems = shopItems;
    return true;
  }

  Future<String> readDeliveryAddress() async {
    await Future.delayed(const Duration(seconds: 1));
    return _deliveryAddress;
  }

  Future<bool> updateDeliveryAddress(String address) async {
    await Future.delayed(const Duration(seconds: 1));
    _deliveryAddress = address;
    return true;
  }

  Future<String> readDeliveryTime() async {
    await Future.delayed(const Duration(seconds: 1));
    return _deliveryTime;
  }

  Future<bool> updateDeliveryTime(String time) async {
    await Future.delayed(const Duration(seconds: 1));
    _deliveryTime = time;
    return true;
  }
}
