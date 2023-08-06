import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shop_app_bloc/domains/store_repository/store_repository.dart';
import 'package:shop_app_bloc/modules/app/cubit/app_cubit.dart';
import 'package:shop_app_bloc/modules/shop_cart/shop_cart_page.dart';
import 'package:shop_app_bloc/modules/categories/categories_page.dart';
import 'package:shop_app_bloc/modules/favorites/favorites_page.dart';
import 'package:shop_app_bloc/modules/profile/profile_page.dart';
import 'package:shop_app_bloc/modules/store/store_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_bloc/ui_kit/ui_kit.dart' as U;

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
          theme: ThemeData(useMaterial3: true),
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
              PointerDeviceKind.stylus,
              PointerDeviceKind.unknown,
            },
          ),
          localizationsDelegates: const [
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('fa', 'IR'),
            Locale('en', 'US'),
          ],
          locale: const Locale('fa', 'IR'),
          home: Scaffold(
            backgroundColor: U.Theme.background,
            appBar: U.AppBar.primary(
              onMenuPressed: () {},
              onNotifPressed: () {},
            ),
            drawer: const Drawer(
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
                  destinations: const [
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
            body: BlocBuilder<AppCubit, AppState>(
              buildWhen: (previous, current) =>
                  previous.selectedDes != current.selectedDes,
              builder: (context, state) {
                return IndexedStack(
                  index: state.selectedDes,
                  children: const [
                    ProfilePage(),
                    FavoritesPage(),
                    StorePage(),
                    CartPage(),
                    CategoriesPage(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
