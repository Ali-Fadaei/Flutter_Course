import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shop_app_m3/pages/cart/cart_page.dart';
import 'package:shop_app_m3/pages/categories/categories_page.dart';
import 'package:shop_app_m3/pages/favorites/favorites_page.dart';
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
    FavoritesPage(),
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
