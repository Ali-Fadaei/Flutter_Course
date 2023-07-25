import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shop_app/models/category.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/models/shop_cart.dart';
import 'package:shop_app/pages/shop_cart/shop_cart_page.dart';
import 'package:shop_app/pages/categories/categories_page.dart';
import 'package:shop_app/pages/favorites/favorites_page.dart';
import 'package:shop_app/pages/profile/profile_page.dart';
import 'package:shop_app/pages/store/store_page.dart';
import 'ui_kit/ui_kit.dart' as U;

List<Category> categories = [
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

  void onFavoriatePressed(Product product) {
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

  // Widget getPage(int index) {
  //   var temp = [
  //     ProfilePage(),
  //     FavoritesPage(
  //       favorites: favorites,
  //       onFavoriatePressed: onFavoriatePressed,
  //       onAddtoShopCardPressed: onAddtoShopCardPressed,
  //       products: products,
  //     ),
  //     StorePage(
  //       products: products,
  //       onFavoriatePressed: onFavoriatePressed,
  //       onAddtoShopCardPressed: onAddtoShopCardPressed,
  //     ),
  //     CartPage(
  //       shopCard: shopCard,
  //     ),
  //     CategoriesPage(),
  //   ];
  //   return temp[index];
  // }

  @override
  Widget build(BuildContext context) {
//
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
      ),
      scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {
        PointerDeviceKind.mouse,
        PointerDeviceKind.touch,
        PointerDeviceKind.stylus,
        PointerDeviceKind.unknown,
      }),
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('fa', 'IR'),
        Locale('en', 'US'),
      ],
      locale: Locale('fa', 'IR'),
      home: Scaffold(
        backgroundColor: U.Theme.background,
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 65,
          title: Center(
            child: U.Image(path: U.Images.shopLogo),
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
        bottomNavigationBar: U.NavigationBar(
          selectedIndex: selectedDes,
          onDestnationChange: (index) => setState(() => selectedDes = index),
          destinations: [
            U.NavigationBarDestination(
              title: 'پروفایل',
              icon: U.Images.profileIcon,
            ),
            U.NavigationBarDestination(
              title: 'علاقه‌مندی‌ها',
              icon: U.Images.favoriteIcon,
            ),
            U.NavigationBarDestination(
              title: 'فروشگاه',
              icon: U.Images.storeIcon,
            ),
            U.NavigationBarDestination(
              title: 'سبدخرید',
              icon: U.Images.shopCartIcon,
            ),
            U.NavigationBarDestination(
              title: 'دسته‌بندی',
              icon: U.Images.categoriesIcon,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IndexedStack(
            index: selectedDes,
            children: [
              ProfilePage(),
              FavoritesPage(
                favorites: favorites,
                shopCart: shopCart,
                products: products,
                onFavoriatePressed: onFavoriatePressed,
                onAddtoShopCartPressed: onAddtoShopCartPressed,
                onRemovetoShopCartPressed: onRemovefromShopCartPressed,
              ),
              StorePage(
                products: products,
                favorites: favorites,
                shopCart: shopCart,
                onFavoriatePressed: onFavoriatePressed,
                onAddtoShopCartPressed: onAddtoShopCartPressed,
                onRemovetoShopCartPressed: onRemovefromShopCartPressed,
              ),
              CartPage(
                products: products,
                shopCard: shopCart,
                favorites: favorites,
                onFavoriatePressed: onFavoriatePressed,
                onAddtoShopCartPressed: onAddtoShopCartPressed,
                onRemovetoShopCartPressed: onRemovefromShopCartPressed,
              ),
              CategoriesPage(),
            ],
          ),
          // getPage[selectedDes],
        ),
      ),
    );
  }
}
