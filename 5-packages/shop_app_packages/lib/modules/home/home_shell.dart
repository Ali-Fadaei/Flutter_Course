import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app_packages/modules/home/cubit/home_cubit.dart';
import 'package:shop_app_packages/ui_kit/ui_kit.dart' as U;

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
    const destinations = [
      U.NavigationBarDestination(
        title: 'پروفایل',
        icon: U.Images.profileIcon,
        // route: ProfilePage.route,
      ),
      U.NavigationBarDestination(
        title: 'علاقه‌مندی‌ها',
        icon: U.Images.favoriteIcon,
        // route: FavoritesPage.route,
      ),
      U.NavigationBarDestination(
        title: 'فروشگاه',
        icon: U.Images.storeIcon,
        // route: StorePage.route,
      ),
      U.NavigationBarDestination(
        title: 'سبدخرید',
        icon: U.Images.shopCartIcon,
        // route: CartPage.route,
      ),
      U.NavigationBarDestination(
        title: 'دسته‌بندی',
        icon: U.Images.categoriesIcon,
        // route: CategoriesPage.route,
      ),
    ];
    return BlocProvider(
      create: (context) => HomeCubit(),
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
              var selectedIndex = child.currentIndex;
              homeCubit.onDestnationChange(selectedIndex);
              return U.NavigationBar(
                selectedIndex: selectedIndex,
                onDestnationChange: (i) => child.goBranch(i),
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
