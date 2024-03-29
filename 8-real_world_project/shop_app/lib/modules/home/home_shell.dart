import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app/domains/store_repository/store_repository.dart';
import 'package:shop_app/domains/user_repository/user_repository.dart';
import 'package:shop_app/modules/app/cubit/app_cubit.dart';
import 'package:shop_app/modules/categories/cubit/categories_cubit.dart';
import 'package:shop_app/modules/favorites/cubit/favoriets_cubit.dart';
import 'package:shop_app/modules/home/cubit/home_cubit.dart';
import 'package:shop_app/modules/profile/cubit/profile_cubit.dart';
import 'package:shop_app/modules/shop_cart/cubit/shop_cart_cubit.dart';
import 'package:shop_app/modules/store/cubit/store_cubit.dart';
import 'package:shop_app/ui_kit/ui_kit.dart' as U;

class HomeShell extends StatelessWidget {
//
  // final Widget child;

  // final String location;

  final StatefulNavigationShell child;

  const HomeShell({
    super.key,
    // required this.location,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(
            userRepo: RepositoryProvider.of<UserRepository>(context),
          ),
        ),
        BlocProvider(
          create: (context) => FavoritesCubit(
            userRepo: RepositoryProvider.of<UserRepository>(context),
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
              userRepo: RepositoryProvider.of<UserRepository>(context)),
        ),
        BlocProvider(
          create: (context) => CategoriesCubit(
            storeRepo: RepositoryProvider.of<StoreRepository>(context),
          ),
        ),
      ],
      child: BlocListener<AppCubit, AppState>(
        listenWhen: (previous, current) =>
            previous.jwtAuthCheck != current.jwtAuthCheck,
        listener: (context, state) {
          BlocProvider.of<FavoritesCubit>(context).init();
          BlocProvider.of<ShopCartCubit>(context).init();
        },
        child: SafeArea(
          child: Scaffold(
            backgroundColor: U.Theme.background,
            drawer: const Drawer(
              child: Column(
                children: [],
              ),
            ),
            bottomNavigationBar: BlocBuilder<ShopCartCubit, ShopCartState>(
              buildWhen: (previous, current) =>
                  previous.shopItems.length != current.shopItems.length,
              builder: (context, state) {
                var homeCubit = BlocProvider.of<HomeCubit>(context);
                var selectedIndex = child.currentIndex;
                var destinations = [
                  const U.NavigationBarDestination(
                    title: 'پروفایل',
                    icon: U.Images.profileIcon,
                    // route: ProfilePage.route,
                  ),
                  const U.NavigationBarDestination(
                    title: 'علاقه‌مندی‌ها',
                    icon: U.Images.favoriteIcon,
                    // route: FavoritesPage.route,
                  ),
                  const U.NavigationBarDestination(
                    title: 'فروشگاه',
                    icon: U.Images.storeIcon,
                    // route: StorePage.route,
                  ),
                  U.NavigationBarDestination(
                    title: 'سبدخرید',
                    icon: U.Images.shopCartIcon,
                    badgeCount:
                        state.shopItems.isEmpty ? null : state.shopItems.length,
                    // route: CartPage.route,
                  ),
                  const U.NavigationBarDestination(
                    title: 'دسته‌بندی',
                    icon: U.Images.categoriesIcon,
                    // route: CategoriesPage.route,
                  ),
                ];
                homeCubit.onDestnationChange(selectedIndex);
                return U.NavigationBar(
                  selectedIndex: selectedIndex,
                  destinations: destinations,
                  onDestnationChange: (i) => child.goBranch(i),
                );
              },
            ),
            body: child,
          ),
        ),
      ),
    );
  }
}
