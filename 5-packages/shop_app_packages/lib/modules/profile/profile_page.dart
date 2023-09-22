import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app_packages/modules/profile/a_page.dart';
import 'package:shop_app_packages/ui_kit/ui_kit.dart' as U;

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
            onMenuPressed: () => Scaffold.of(context).openDrawer(),
            onNotifPressed: () {},
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(24),
            child: U.Button(
              title: 'goto Page A',
              onPressed: () {
                GoRouter.of(context).goNamed(APage.route);
              },
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
