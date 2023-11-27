import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app/domains/user_repository/user_repository.dart';
import 'package:shop_app/modules/app/cubit/app_cubit.dart';
import 'package:shop_app/modules/auth/auth_otp_page.dart';
import 'package:shop_app/ui_kit/ui_kit.dart' as U;

class ProfilePage extends StatelessWidget {
//
  static const route = '/profile';

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
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
                  title: state.jwtAuthCheck ? 'logOut' : 'signIn',
                  onPressed: () {
                    state.jwtAuthCheck
                        ? RepositoryProvider.of<UserRepository>(context)
                            .logOut()
                        : GoRouter.of(context).goNamed(AuthOtpPage.route);
                  },
                ),
              ),
              const Spacer(),
            ],
          ),
        );
      },
    );
  }
}
