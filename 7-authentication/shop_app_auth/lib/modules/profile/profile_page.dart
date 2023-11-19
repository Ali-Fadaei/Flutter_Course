import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_auth/domains/user_repository/user_repository.dart';
import 'package:shop_app_auth/ui_kit/ui_kit.dart' as U;

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
              title: 'logOut',
              onPressed: () {
                RepositoryProvider.of<UserRepository>(context).logOut();
              },
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
