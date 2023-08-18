import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app_gorouter/modules/profile/a_page.dart';
import 'package:shop_app_gorouter/ui_kit/ui_kit.dart' as U;

class ProfilePage extends StatelessWidget {
//
  static const route = '/profile';

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        children: [
          U.AppBar.primary(
            onMenuPressed: () {},
            onNotifPressed: () {},
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: U.Button(
              title: 'go Page a',
              onPressed: () {
                GoRouter.of(context).goNamed(APage.route);
                // GoRouter.of(context).goNamed(
                //   BPage.route,
                //   pathParameters: {'id': '552'},
                // );
              },
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
