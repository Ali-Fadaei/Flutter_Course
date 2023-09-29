import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app_gorouter/domains/store_repository/store_repository.dart';
import 'package:shop_app_gorouter/modules/categories/categories_page.dart';
import 'package:shop_app_gorouter/modules/categories/cubit/categories_cubit.dart';
import 'package:shop_app_gorouter/modules/favorites/cubit/favoriets_cubit.dart';
import 'package:shop_app_gorouter/modules/favorites/favorites_page.dart';
import 'package:shop_app_gorouter/modules/home/cubit/home_cubit.dart';
import 'package:shop_app_gorouter/modules/profile/profile_page.dart';
import 'package:shop_app_gorouter/modules/shop_cart/cubit/shop_cart_cubit.dart';
import 'package:shop_app_gorouter/modules/shop_cart/shop_cart_page.dart';
import 'package:shop_app_gorouter/modules/store/cubit/store_cubit.dart';
import 'package:shop_app_gorouter/modules/store/store_page.dart';
import 'package:shop_app_gorouter/ui_kit/ui_kit.dart' as U;

class HomeShell extends StatelessWidget {
  //
  // final String route;

  // final Widget child;

  final StatefulNavigationShell child;

  const HomeShell({
    super.key,
    // required this.route,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    //
    const destinations = [
      U.NavigationBarDestination(
        title: 'پروفایل',
        icon: U.Images.profileIcon,
        route: ProfilePage.route,
      ),
      U.NavigationBarDestination(
        title: 'علاقه‌مندی‌ها',
        icon: U.Images.favoriteIcon,
        route: FavoritesPage.route,
      ),
      U.NavigationBarDestination(
        title: 'فروشگاه',
        icon: U.Images.storeIcon,
        route: StorePage.route,
      ),
      U.NavigationBarDestination(
        title: 'سبدخرید',
        icon: U.Images.shopCartIcon,
        route: CartPage.route,
      ),
      U.NavigationBarDestination(
        title: 'دسته‌بندی',
        icon: U.Images.categoriesIcon,
        route: CategoriesPage.route,
      ),
    ];

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
          drawer: const Drawer(
            child: Column(
              children: [],
            ),
          ),
          bottomNavigationBar: Builder(
            builder: (context) {
              var homeCubit = BlocProvider.of<HomeCubit>(context);
              // var currentIndex = destinations.indexWhere(
              //   (element) => route.contains(element.route),
              // );
              var currentIndex = child.currentIndex;
              homeCubit.onDestnationChange(currentIndex);
              return U.NavigationBar(
                selectedIndex: currentIndex,
                onDestnationChange: (i) =>
                    // GoRouter.of(context).goNamed(destinations[i].route),
                    child.goBranch(i),
                destinations: destinations,
              );
            },
          ),
          body: child,
        ),
      ),
    );
  }
}
