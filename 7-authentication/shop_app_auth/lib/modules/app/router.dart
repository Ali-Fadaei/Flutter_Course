import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app_auth/modules/auth/auth_confirm_page.dart';
import 'package:shop_app_auth/modules/auth/auth_otp_page.dart';
import 'package:shop_app_auth/modules/auth/auth_shell.dart';
import 'package:shop_app_auth/modules/categories/categories_page.dart';
import 'package:shop_app_auth/modules/category/category_page.dart';
import 'package:shop_app_auth/modules/checkout/checkout_page.dart';
import 'package:shop_app_auth/modules/favorites/favorites_page.dart';
import 'package:shop_app_auth/modules/home/home_shell.dart';
import 'package:shop_app_auth/modules/profile/profile_page.dart';
import 'package:shop_app_auth/modules/search/search_page.dart';
import 'package:shop_app_auth/modules/shop_cart/shop_cart_page.dart';
import 'package:shop_app_auth/modules/store/store_page.dart';

final rootNavKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootNavKey,
  initialLocation: StorePage.route,
  redirect: (context, state) {
    if (state.uri.toString() == '/') {
      return state.namedLocation(StorePage.route);
    } else {
      return null;
    }
  },
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return HomeShell(
          child: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: ProfilePage.route,
              name: ProfilePage.route,
              builder: (context, state) {
                return const ProfilePage();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: FavoritesPage.route,
              name: FavoritesPage.route,
              builder: (context, state) {
                return const FavoritesPage();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: StorePage.route,
              name: StorePage.route,
              builder: (context, state) {
                return StorePage(
                  initialProductId: int.tryParse(
                    state.uri.queryParameters['id'] ?? '',
                  ),
                );
              },
              routes: [
                GoRoute(
                  path: SearchPage.route,
                  name: SearchPage.route,
                  builder: (context, state) {
                    return SearchPage(
                      searchTitle: state.pathParameters['title']!,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: CartPage.route,
              name: CartPage.route,
              builder: (context, state) {
                return const CartPage();
              },
              routes: [
                GoRoute(
                  parentNavigatorKey: rootNavKey,
                  path: CheckoutPage.route,
                  name: CheckoutPage.route,
                  builder: (context, state) {
                    return CheckoutPage(
                      shopItems: state.extra as dynamic,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: CategoriesPage.route,
              name: CategoriesPage.route,
              builder: (context, state) {
                return const CategoriesPage();
              },
              routes: [
                GoRoute(
                  path: CategoryPage.route,
                  name: CategoryPage.route,
                  pageBuilder: (context, state) {
                    return CupertinoPage(
                      child: CategoryPage(
                        categoryId: int.parse(state.pathParameters['id']!),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    ShellRoute(
      builder: (context, state, child) {
        return AuthShell(
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: OtpPage.route,
          name: OtpPage.route,
          pageBuilder: (context, state) {
            return const MaterialPage(child: OtpPage());
          },
          routes: [
            GoRoute(
              path: OtpConfirmPage.route,
              name: OtpConfirmPage.route,
              pageBuilder: (context, state) {
                return const MaterialPage(child: OtpConfirmPage());
              },
            ),
          ],
        ),
      ],
    )
    // GoRoute(
    //   path: APage.route,
    //   name: APage.route,
    //   pageBuilder: (context, state) {
    //     return const CupertinoPage(
    //       child: APage(),
    //     );
    //   },
    //   routes: [
    //     GoRoute(
    //       path: BPage.route,
    //       name: BPage.route,
    //       pageBuilder: (context, state) {
    //         return CustomTransitionPage(
    //           transitionsBuilder: (context, anim1, anim2, child) {
    //             return FadeTransition(
    //               opacity: anim1,
    //               child: child,
    //             );
    //           },
    //           child: BPage(
    //             id: int.parse(state.pathParameters['id']!),
    //           ),
    //         );
    //       },
    //     ),
    //   ],
    // ),
  ],
);
