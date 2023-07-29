import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:shop_app/domains/store_repository/models/product.dart';
// import 'package:shop_app/domains/store_repository/models/shop_cart.dart';
// import 'package:shop_app/domains/store_repository/models/category.dart';
import 'package:shop_app/domains/store_repository/store_repository.dart';
import 'package:shop_app/modules/app/cubit/app_cubit.dart';
import 'package:shop_app/modules/shop_cart/shop_cart_page.dart';
import 'package:shop_app/modules/categories/categories_page.dart';
import 'package:shop_app/modules/favorites/favorites_page.dart';
import 'package:shop_app/modules/profile/profile_page.dart';
import 'package:shop_app/modules/store/store_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/ui_kit/ui_kit.dart' as U;

class App extends StatelessWidget {
//
  const App({super.key});

  @override
  Widget build(BuildContext context) {
//
    return RepositoryProvider(
      create: (context) => StoreRepository(),
      child: BlocProvider(
        create: (context) => AppCubit(),
        child: MaterialApp(
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
            bottomNavigationBar: BlocBuilder<AppCubit, AppState>(
              buildWhen: (previous, current) =>
                  previous.selectedDes != current.selectedDes,
              builder: (context, state) {
                var appcubit = BlocProvider.of<AppCubit>(context);
                return U.NavigationBar(
                  selectedIndex: state.selectedDes,
                  onDestnationChange: appcubit.onDestnationChange,
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
                );
              },
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<AppCubit, AppState>(
                buildWhen: (previous, current) =>
                    previous.selectedDes != current.selectedDes,
                builder: (context, state) {
                  return IndexedStack(
                    index: state.selectedDes,
                    children: [
                      ProfilePage(),
                      FavoritesPage(),
                      StorePage(),
                      CartPage(),
                      CategoriesPage(),
                    ],
                  );
                },
              ),
              // getPage[selectedDes],
            ),
          ),
        ),
      ),
    );
  }
}
