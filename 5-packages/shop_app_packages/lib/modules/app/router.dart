// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app_packages/modules/categories/categories_page.dart';
import 'package:shop_app_packages/modules/category/category_page.dart';
import 'package:shop_app_packages/modules/checkout/checkout_page.dart';
import 'package:shop_app_packages/modules/favorites/favorites_page.dart';
import 'package:shop_app_packages/modules/home/home_shell.dart';
// import 'package:shop_app_gorouter/modules/profile/a_page.dart';
// import 'package:shop_app_gorouter/modules/profile/b_page.dart';
import 'package:shop_app_packages/modules/profile/profile_page.dart';
import 'package:shop_app_packages/modules/search/search_page.dart';
import 'package:shop_app_packages/modules/shop_cart/shop_cart_page.dart';
import 'package:shop_app_packages/modules/store/store_page.dart';

final rootNavKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootNavKey,
  initialLocation: StorePage.route,
  redirect: (context, state) {
    print(state.uri.toString());
    if (state.uri.toString() == '/') {
      return StorePage.route;
      // return state.namedLocation(APage.route);
    } else {
      return null;
    }
  },
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // navigationShell.
        return HomeShell(
          // location: state.uri.toString(),
          child: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(
          initialLocation: ProfilePage.route,
          routes: [
            GoRoute(
              path: ProfilePage.route,
              name: ProfilePage.route,
              builder: (context, state) => const ProfilePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          initialLocation: FavoritesPage.route,
          routes: [
            GoRoute(
              path: FavoritesPage.route,
              name: FavoritesPage.route,
              builder: (context, state) => const FavoritesPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          initialLocation: StorePage.route,
          routes: [
            GoRoute(
              path: StorePage.route,
              name: StorePage.route,
              builder: (context, state) => StorePage(
                initialProductId: int.tryParse(
                  state.uri.queryParameters['id'] ?? '',
                ),
              ),
              routes: [
                GoRoute(
                  path: SearchPage.route,
                  name: SearchPage.route,
                  parentNavigatorKey: rootNavKey,
                  builder: (context, state) {
                    return SearchPage(
                        searchTitle: state.pathParameters["searchTitle"]!);
                  },
                )
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          initialLocation: CartPage.route,
          routes: [
            GoRoute(
              path: CartPage.route,
              name: CartPage.route,
              builder: (context, state) => const CartPage(),
              routes: [
                GoRoute(
                  path: CheckoutPage.route,
                  name: CheckoutPage.route,
                  parentNavigatorKey: rootNavKey,
                  builder: (context, state) => CheckoutPage(
                    initialShopItems: state.extra as dynamic,
                  ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          initialLocation: CategoriesPage.route,
          routes: [
            GoRoute(
              path: CategoriesPage.route,
              name: CategoriesPage.route,
              builder: (context, state) => const CategoriesPage(),
              routes: [
                GoRoute(
                  path: CategoryPage.route,
                  name: CategoryPage.route,
                  builder: (context, state) => CategoryPage(
                    id: int.parse(state.pathParameters['id']!),
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    ),

    // ShellRoute(
    //   builder: (context, state, child) {
    //     return HomePage(
    //       location: state.uri.toString(),
    //       child: child,
    //     );
    //   },
    //   routes: [
    //     GoRoute(
    //       path: ProfilePage.route,
    //       name: ProfilePage.route,
    //       builder: (context, state) => const ProfilePage(),
    //     ),
    //     GoRoute(
    //       path: FavoritesPage.route,
    //       name: FavoritesPage.route,
    //       builder: (context, state) => const FavoritesPage(),
    //     ),
    //     GoRoute(
    //       path: StorePage.route,
    //       name: StorePage.route,
    //       builder: (context, state) => const StorePage(),
    //     ),
    //     GoRoute(
    //       path: CartPage.route,
    //       name: CartPage.route,
    //       builder: (context, state) => const CartPage(),
    //     ),
    //     GoRoute(
    //       path: CategoriesPage.route,
    //       name: CategoriesPage.route,
    //       builder: (context, state) => const CategoriesPage(),
    //     ),
    //   ],
    // ),

    // GoRoute(
    //   path: HomePage.route,
    //   name: HomePage.route,
    //   // builder: (context, state) => const HomePage(),
    //   pageBuilder: (context, state) => const MaterialPage(
    //     child: HomePage(),
    //   ),
    //   routes: [
    //     GoRoute(
    //       path: APage.route,
    //       name: APage.route,

    //       // builder: (context, state) => const APage(),
    //       pageBuilder: (context, state) => CustomTransitionPage(
    //         transitionsBuilder:
    //             (context, animation, secondaryAnimation, child) {
    //           return FadeTransition(
    //             opacity: animation,
    //             child: child,
    //           );
    //         },
    //         child: const APage(),
    //       ),
    //       routes: [
    //         GoRoute(
    //           path: BPage.route,
    //           name: BPage.route,
    //           // builder: (context, state) => const BPage(id: 5),
    //           pageBuilder: (context, state) => CupertinoPage(
    //             // child: BPage(id: int.parse(state.pathParameters['id']!)),
    //             child: BPage(
    //               id: int.tryParse(state.uri.queryParameters['id'] ?? '') ?? 5,
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ],
    // ),
  ],
);
