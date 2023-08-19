import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_gorouter/modules/profile/a_page.dart';
import 'package:shop_app_gorouter/ui_kit/ui_kit.dart' as U;

class ProfilePage extends StatelessWidget {
//
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
                Navigator.of(context).pushNamed(APage.route);
              },
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
