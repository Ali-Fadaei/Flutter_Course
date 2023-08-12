import 'package:flutter/material.dart';
import 'package:shop_app_routing/modules/profile/a_page.dart';
import 'package:shop_app_routing/ui_kit/ui_kit.dart' as U;

class ProfilePage extends StatelessWidget {
//
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
