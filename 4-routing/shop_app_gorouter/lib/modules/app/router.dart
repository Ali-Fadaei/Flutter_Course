import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app_gorouter/modules/home/home_page.dart';
import 'package:shop_app_gorouter/modules/profile/a_page.dart';
import 'package:shop_app_gorouter/modules/profile/b_page.dart';

var router = GoRouter(
  initialLocation: HomePage.route,
  routes: [
    // StatefulShellRoute.indexedStack(branches: []),
    // ShellRoute(
    //   routes: [],
    // ),
    GoRoute(
      name: HomePage.route,
      path: HomePage.route,
      pageBuilder: (context, state) {
        return const MaterialPage(child: HomePage());
      },
      routes: [
        GoRoute(
          path: APage.route,
          name: APage.route,
          pageBuilder: (context, state) {
            return const CupertinoPage(child: APage());
          },
          routes: [
            GoRoute(
              path: BPage.route,
              name: BPage.route,
              pageBuilder: (context, state) {
                return MaterialPage(
                  child: BPage(
                    id: int.parse(state.pathParameters['id'] ?? '1'),
                  ),
                );
              },
            )
          ],
        )
      ],
    ),
  ],
);
