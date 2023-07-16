import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shop_app_m3/pages/cart/cart_page.dart';
import 'package:shop_app_m3/pages/categories/categories_page.dart';
import 'package:shop_app_m3/pages/faviorates/faviorates_page.dart';
import 'package:shop_app_m3/pages/profile/profile_page.dart';
import 'package:shop_app_m3/pages/store/store_page.dart';

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

  List<Widget> pages = [
    ProfilePage(),
    FavioratesPage(),
    StorePage(),
    CartPage(),
    CategoriesPage(),
  ];

  @override
  Widget build(BuildContext context) {
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
      home: Scaffold(
        appBar: AppBar(
          actions: [
            SizedBox.square(
              dimension: 50,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_none_rounded,
                ),
              ),
            ),
          ],
          centerTitle: true,
          title: Image.asset('assets/icons/Amazon.png'),
        ),
        drawer: Drawer(
          child: Column(
            children: [],
          ),
        ),
        bottomNavigationBar: NavigationBar(
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
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite_border_outlined),
              label: 'faviorates',
            ),
            NavigationDestination(
              icon: Icon(Icons.store_mall_directory_outlined),
              label: 'store',
            ),
            NavigationDestination(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'cart',
            ),
            NavigationDestination(
              icon: Icon(Icons.manage_search_outlined),
              label: 'categories',
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(12),
          child: pages[selectedDes],
        ),
        // body: IndexedStack(
        //   index: selectedDes,
        //   children: [
        //     ProfilePage(),
        //     FavioratesPage(),
        //     StorePage(),
        //     CartPage(),
        //     CategoriesPage(),
        //   ],
        // ),
      ),
    );
  }
}
