import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app_gorouter/modules/category/category_page.dart';
import 'package:shop_app_gorouter/modules/home/home_page.dart';
import 'package:shop_app_gorouter/modules/profile/a_page.dart';
import 'package:shop_app_gorouter/modules/profile/b_page.dart';

var router = GoRouter(
  initialLocation: HomePage.route,
  redirect: (context, state) {
    print(state.uri.toString());
    if (state.uri.toString() == '/') return HomePage.route;
    return null;
  },
  routes: [
    GoRoute(
      path: HomePage.route,
      name: HomePage.route,
      pageBuilder: (context, state) {
        return const MaterialPage(
          child: HomePage(),
        );
      },
      routes: [
        GoRoute(
          path: APage.route,
          name: APage.route,
          pageBuilder: (context, state) {
            return const CupertinoPage(
              child: APage(),
            );
          },
          routes: [
            GoRoute(
              path: BPage.route,
              name: BPage.route,
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  transitionsBuilder: (context, anim1, anim2, child) {
                    return FadeTransition(
                      opacity: anim1,
                      child: child,
                    );
                  },
                  child: BPage(
                    id: int.parse(state.pathParameters['id']!),
                  ),
                );
              },
            ),
          ],
        ),
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
);
