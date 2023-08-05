import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shop_app_m3/models/category.dart';
import 'package:shop_app_m3/models/product.dart';
import 'package:shop_app_m3/models/shop_cart.dart';
import 'package:shop_app_m3/pages/shop_cart/shop_cart_page.dart';
import 'package:shop_app_m3/pages/categories/categories_page.dart';
import 'package:shop_app_m3/pages/favorites/favorites_page.dart';
import 'package:shop_app_m3/pages/profile/profile_page.dart';
import 'package:shop_app_m3/pages/store/store_page.dart';

List<Category> categories = [
  Category(
    title: 'Mobile Phone',
    image: 'assets/imgs/categories/mobile.png',
    color: Color.fromARGB(255, 161, 207, 178),
  ),
  Category(
    title: 'Laptop',
    image: 'assets/imgs/categories/laptop.png',
    color: Color.fromARGB(255, 255, 210, 161),
  ),
  Category(
    title: 'AirBuds',
    image: 'assets/imgs/categories/headphone.png',
    color: Color.fromARGB(255, 217, 197, 224),
  ),
  Category(
    title: 'Network Devices',
    image: 'assets/imgs/categories/network.png',
    color: Color.fromARGB(255, 218, 241, 254),
  ),
];

List<Product> products = [
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
    category: categories[1],
  ),
  Product(
    title: 'Asus VivoBook',
    rating: 5,
    price: 1221000,
    image: 'assets/imgs/products/vivabook.png',
    description:
        'sdfvsdfasdfasdfasdfasdfsd asdf.,sdjn fsdlkfjsdn fkljsdn flasdkj fhasdlfjkasdhklfjsd nflkasdj fnasdlkfjnasd lkjasdn flksdjn fsdklfjnasdl kjdbn flasdkj fnasd; kfjna;',
    category: categories[1],
  ),
  Product(
    title: 'Asus VivoBook',
    rating: 5,
    price: 9990009,
    image: 'assets/imgs/products/vivabook.png',
    description:
        'sdfvsdfasdfasdfasdfasdfsd asdf.,sdjn fsdlkfjsdn fkljsdn flasdkj fhasdlfjkasdhklfjsd nflkasdj fnasdlkfjnasd lkjasdn flksdjn fsdklfjnasdl kjdbn flasdkj fnasd; kfjna;',
    category: categories[1],
  ),
  Product(
    title: 'Asus VivoBook',
    rating: 5,
    price: 33434,
    image: 'assets/imgs/products/vivabook.png',
    description:
        'sdfvsdfasdfasdfasdfasdfsd asdf.,sdjn fsdlkfjsdn fkljsdn flasdkj fhasdlfjkasdhklfjsd nflkasdj fnasdlkfjnasd lkjasdn flksdjn fsdklfjnasdl kjdbn flasdkj fnasd; kfjna;',
    category: categories[1],
  ),
];

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
//
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
//
  int selectedDes = 2;

  List<Product> favorites = [];

  ShopCart shopCart = ShopCart(shopItems: []);

  void onFavoritePressed(Product product) {
    setState(
      () {
        if (favorites.contains(product)) {
          favorites.remove(product);
        } else {
          favorites.add(product);
        }
      },
    );
  }

  void onAddtoShopCartPressed(Product product) {
    setState(
      () {
        // var existingShopItemIndex = shopCard.shopItems.indexWhere(
        //   (element) => element.product == product,
        // );
        // if (existingShopItemIndex == -1) {
        //   shopCard.shopItems.add(ShopItem(product: product));
        // } else {
        //   var existingShopItem = shopCard.shopItems[existingShopItemIndex];
        //   if (existingShopItem.count <= 10) existingShopItem.count++;
        // }
        try {
          var existingShopItem = shopCart.shopItems.firstWhere((element) {
            return element.product == product;
          });
          if (existingShopItem.count <= 10) existingShopItem.count++;
        } catch (_) {
          shopCart.shopItems.add(ShopItem(product: product));
        }
      },
    );
  }

  void onRemovefromShopCartPressed(Product product) {
    setState(
      () {
        // var existingShopItemIndex = shopCard.shopItems.indexWhere(
        //   (element) => element.product == product,
        // );
        // if (existingShopItemIndex != -1) {
        //   var existingShopItem = shopCard.shopItems[existingShopItemIndex];
        //   if (existingShopItem.count <= 1) {
        //     shopCard.shopItems.remove(existingShopItem);
        //   } else {
        //     existingShopItem.count--;
        //   }
        // }
        try {
          var existingShopItem = shopCart.shopItems.firstWhere((element) {
            return element.product == product;
          });
          if (existingShopItem.count <= 1) {
            shopCart.shopItems.remove(existingShopItem);
          } else {
            existingShopItem.count--;
          }
        } catch (_) {}
      },
    );
  }

  @override
  Widget build(BuildContext context) {
//
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          // brightness: Brightness.dark,
          seedColor: Colors.cyan,
        ),
      ),
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown,
        },
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 65,
          title: Center(
            child: Image.asset('assets/icons/Amazon.png'),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_none_rounded),
            ),
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: [],
          ),
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: selectedDes,
          onDestinationSelected: (index) => setState(() => selectedDes = index),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          destinations: const [
            NavigationDestination(
              icon: Icon(
                Icons.person_2_outlined,
                size: 28,
              ),
              label: 'profile',
              tooltip: '',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.favorite_border_outlined,
                size: 28,
              ),
              label: 'favorites',
              tooltip: '',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.store_mall_directory_outlined,
                size: 28,
              ),
              label: 'store',
              tooltip: '',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 28,
              ),
              label: 'shop cart',
              tooltip: '',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.manage_search_outlined,
                size: 28,
              ),
              label: 'categories',
              tooltip: '',
            ),
          ],
        ),
        body: IndexedStack(
          index: selectedDes,
          children: [
            ProfilePage(),
            FavoritesPage(
              favorites: favorites,
              shopCart: shopCart,
              products: products,
              onFavoriatePressed: onFavoritePressed,
              onAddtoShopCartPressed: onAddtoShopCartPressed,
              onRemovefromShopCartPressed: onRemovefromShopCartPressed,
            ),
            StorePage(
              products: products,
              favorites: favorites,
              shopCart: shopCart,
              onFavoriatePressed: onFavoritePressed,
              onAddtoShopCartPressed: onAddtoShopCartPressed,
              onRemovefromShopCartPressed: onRemovefromShopCartPressed,
            ),
            CartPage(
              products: products,
              shopCard: shopCart,
              favorites: favorites,
              onFavoriatePressed: onFavoritePressed,
              onAddtoShopCartPressed: onAddtoShopCartPressed,
              onRemovefromShopCartPressed: onRemovefromShopCartPressed,
            ),
            CategoriesPage(
              categories: categories,
            ),
          ],
        ),
      ),
    );
  }
}
