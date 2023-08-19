import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app_gorouter/modules/categories/categories_page.dart';
import 'package:shop_app_gorouter/modules/category/category_page.dart';
import 'package:shop_app_gorouter/modules/favorites/favorites_page.dart';
import 'package:shop_app_gorouter/modules/home/cubit/home_cubit.dart';
import 'package:shop_app_gorouter/modules/profile/profile_page.dart';
import 'package:shop_app_gorouter/modules/shop_cart/shop_cart_page.dart';
import 'package:shop_app_gorouter/modules/store/store_page.dart';
import 'package:shop_app_gorouter/ui_kit/ui_kit.dart' as U;

class HomePage extends StatelessWidget {
//
  static const route = '/home';

  final Widget child;

  final String location;

  const HomePage({
    super.key,
    required this.location,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
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
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        backgroundColor: U.Theme.background,
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
              selectedIndex: destinations.indexWhere(
                (element) => location.contains(element.route),
              ),
              onDestnationChange: (selectedIndex) {
                GoRouter.of(context).goNamed(destinations[selectedIndex].route);
              },
              destinations: destinations,
            );
          },
        ),
        body: child,
      ),
    );
  }
}
