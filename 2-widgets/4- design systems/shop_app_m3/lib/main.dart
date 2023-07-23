import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shop_app_m3/models/category.dart';
import 'package:shop_app_m3/models/product.dart';
import 'package:shop_app_m3/models/shop_card.dart';
import 'package:shop_app_m3/pages/shop_card/cart_page.dart';
import 'package:shop_app_m3/pages/categories/categories_page.dart';
import 'package:shop_app_m3/pages/favorites/favorites_page.dart';
import 'package:shop_app_m3/pages/profile/profile_page.dart';
import 'package:shop_app_m3/pages/store/store_page.dart';

List<Category> categories = [
  Category(
    title: 'e-Devices',
    image: 'assets/imgs/categories/e-devices.png',
    color: Colors.red,
  ),
  Category(
    title: 'e-Devices',
    image: 'assets/imgs/categories/e-devices.png',
    color: Colors.redAccent,
  ),
  Category(
    title: 'e-Devices',
    image: 'assets/imgs/categories/e-devices.png',
    color: Colors.cyan,
  ),
  Category(
    title: 'e-Devices',
    image: 'assets/imgs/categories/e-devices.png',
    color: Colors.cyan,
  ),
  Category(
    title: 'e-Devices',
    image: 'assets/imgs/categories/e-devices.png',
    color: Colors.cyan,
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

List<Product> shopItems = [];

ShopCard shopCard = ShopCard(shopItems: shopItems);
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

  void onCounterIncremented(Product product) {
    setState(() {
      product.count++;
    });
  }

  void onCounterDecremented(Product product) {
    setState(() {
      if (product.count <= 1) {
        
        print("products count became 0!");
        List<Product> newShopItems = List.from(shopItems);
        shopItems.remove(product);
        print(shopItems);
        newShopItems.remove(product);
      }
      else{
        product.count--;
      }
    });
  }

  void onAddtoShopCardPressed(Product product) {
    setState(
      () {
        // for (var element in shopCard.shopItems) {
        //   if (element.product == product) {
        //     print("product counter incremented correclty");
        //     element.count++;
        //   } else {
        //     print("on Add shop Card Pressed Event is Working Correctly from main when that item doesnt exist in shop item list");
        //     shopCard.shopItems.add(
        //       ShopItem(product: product),

        //     );
        //   }
        // }
        // Create a new list and copy all the elements from the original list.
        List<Product> newShopItems = List.from(shopItems);

        // Now, you can modify the new list as usual.
        newShopItems.add(product);
      shopCard.shopItems.add(product);
        // Update the shopItems property in the ShopCard class.
      },
      
    );
  }

  // void onRemovetoShopCardPressed(Product product) {
  //   setState(
  //     () {
  //       for (var element in shopCard.shopItems) {
  //         if (element.product == product) {
  //           if (element.count <= 1) {
  //             shopCard.shopItems.remove(element);
  //           } else {
  //             element.count--;
  //           }
  //         }
  //       }
  //     },
  //   );
  // }
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
      theme: ThemeData.from(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          // brightness: Brightness.dark,
          brightness: Brightness.light,
          seedColor: Colors.cyan,
        ),
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
      locale: Locale('en', 'US'),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 65,
          title: Center(child: Image.asset('assets/icons/Amazon.png')),
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
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          onDestinationSelected: (index) {
            setState(() {
              selectedDes = index;
            });
          },
          selectedIndex: selectedDes,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.person_2_outlined),
              label: 'profile',
              tooltip: '',
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite_border_outlined),
              label: 'favorites',
              tooltip: '',
            ),
            NavigationDestination(
              icon: Icon(Icons.store_mall_directory_outlined),
              label: 'store',
              tooltip: '',
            ),
            NavigationDestination(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'cart',
              tooltip: '',
            ),
            NavigationDestination(
              icon: Icon(Icons.manage_search_outlined),
              label: 'categories',
              tooltip: '',
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
                  onFavoriatePressed: onFavoriatePressed,
                  onAddtoShopCardPressed: onAddtoShopCardPressed,
                  products: products),
              StorePage(
                products: products,
                favorites: favorites,
                onFavoriatePressed: onFavoriatePressed,
                onAddtoShopCardPressed: onAddtoShopCardPressed,
              ),
              CartPage(
                favorites: favorites,
                onFavoriatePressed: onFavoriatePressed,
                onAddtoShopCardPressed: onAddtoShopCardPressed,
                products: products,
                shopCard: shopCard,
                onCounterDecremented: onCounterDecremented,
                onCounterIncremented: onCounterIncremented,
              ),
              CategoriesPage(),
            ],
          ),
        ),
      ),
    );
  }
}
