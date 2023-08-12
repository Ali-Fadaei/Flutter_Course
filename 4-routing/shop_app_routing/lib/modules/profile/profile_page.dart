import 'package:flutter/cupertino.dart';
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
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(24),
            child: U.Button(
              title: 'goto Page A',
              onPressed: () {
                Navigator.of(context).pushNamed('/apage');
              },
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}