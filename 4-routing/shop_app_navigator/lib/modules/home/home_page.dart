import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_navigator/domains/store_repository/store_repository.dart';
import 'package:shop_app_navigator/modules/categories/categories_page.dart';
import 'package:shop_app_navigator/modules/categories/cubit/categories_cubit.dart';
import 'package:shop_app_navigator/modules/category/category_page.dart';
import 'package:shop_app_navigator/modules/favorites/cubit/favoriets_cubit.dart';
import 'package:shop_app_navigator/modules/favorites/favorites_page.dart';
import 'package:shop_app_navigator/modules/home/cubit/home_cubit.dart';
import 'package:shop_app_navigator/modules/profile/profile_page.dart';
import 'package:shop_app_navigator/modules/shop_cart/cubit/shop_cart_cubit.dart';
import 'package:shop_app_navigator/modules/shop_cart/shop_cart_page.dart';
import 'package:shop_app_navigator/modules/store/cubit/store_cubit.dart';
import 'package:shop_app_navigator/modules/store/store_page.dart';
import 'package:shop_app_navigator/ui_kit/ui_kit.dart' as U;

class HomePage extends StatelessWidget {
  ///
  static const route = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => FavoritesCubit(
            storeRepo: RepositoryProvider.of<StoreRepository>(context),
          ),
        ),
        BlocProvider(
          create: (context) => StoreCubit(
            storeRepo: RepositoryProvider.of<StoreRepository>(context),
          ),
        ),
        BlocProvider(
          create: (context) => ShopCartCubit(
            storeRepo: RepositoryProvider.of<StoreRepository>(context),
          ),
        ),
        BlocProvider(
          create: (context) => CategoriesCubit(
            storeRepo: RepositoryProvider.of<StoreRepository>(context),
          ),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          backgroundColor: U.Theme.background,
          // appBar: U.AppBar.primary(
          //   onMenuPressed: () {},
          //   onNotifPressed: () {},
          // ),
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
                children: [
                  const ProfilePage(),
                  const FavoritesPage(),
                  const StorePage(),
                  const CartPage(),
                  Navigator(
                    initialRoute: CategoriesPage.route,
                    onGenerateRoute: (settings) {
                      switch (settings.name) {
                        case CategoriesPage.route:
                          return MaterialPageRoute(
                            settings: settings,
                            builder: (context) => const CategoriesPage(),
                          );
                        case CategoryPage.route:
                          return MaterialPageRoute(
                            settings: settings,
                            builder: (context) => CategoryPage(
                              categoryId: settings.arguments as int,
                            ),
                          );
                        default:
                          return MaterialPageRoute(
                            settings: const RouteSettings(
                              name: CategoriesPage.route,
                            ),
                            builder: (context) => const CategoriesPage(),
                          );
                      }
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
