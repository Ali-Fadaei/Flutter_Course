import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_routing/modules/categories/categories_page.dart';
import 'package:shop_app_routing/modules/favorites/favorites_page.dart';
import 'package:shop_app_routing/modules/home/cubit/home_cubit.dart';
import 'package:shop_app_routing/modules/profile/profile_page.dart';
import 'package:shop_app_routing/modules/shop_cart/shop_cart_page.dart';
import 'package:shop_app_routing/modules/store/store_page.dart';
import 'package:shop_app_routing/ui_kit/ui_kit.dart' as U;

class HomePage extends StatelessWidget {
  ///
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
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
        bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (previous, current) =>
              previous.selectedDes != current.selectedDes,
          builder: (context, state) {
            var homeCubit = BlocProvider.of<HomeCubit>(context);
            return U.NavigationBar(
              selectedIndex: state.selectedDes,
              onDestnationChange: homeCubit.onDestnationChange,
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
        body: BlocBuilder<HomeCubit, HomeState>(
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
                // Navigator(
                //   initialRoute: '/categories',
                //   onGenerateRoute: (settings) {
                //     switch (settings.name) {
                //       case '/categories':
                //         return MaterialPageRoute(
                //           builder: (context) => const CategoriesPage(),
                //         );
                //       case '/category':
                //         return MaterialPageRoute(
                //           builder: (context) => CategoryPage(
                //             categoryId: settings.arguments as int,
                //           ),
                //         );
                //     }
                //   },
                // ),
              ],
            );
          },
        ),
      ),
    );
  }
}
