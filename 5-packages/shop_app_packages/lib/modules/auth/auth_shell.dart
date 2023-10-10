import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_packages/modules/app/transitions.dart';
import 'package:shop_app_packages/modules/auth/auth_confirm_page.dart';
import 'package:shop_app_packages/modules/auth/auth_otp_page.dart';
import 'package:shop_app_packages/modules/auth/cubit/auth_cubit.dart';
import 'package:shop_app_packages/ui_kit/ui_kit.dart' as U;

class AuthShell extends StatelessWidget {
//
  final Widget child;

  final String route;

  const AuthShell({
    super.key,
    required this.route,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: U.Theme.background,
          body: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedAlign(
                duration: goDefaultDuration,
                alignment: orientation == Orientation.landscape
                    ? const Alignment(0.5, 0)
                    : const Alignment(0, -0.85),
                child: const SizedBox.square(
                  dimension: 150,
                  child: FittedBox(
                    child: U.Image(path: U.Images.shopLogo),
                  ),
                ),
              ),
              AnimatedAlign(
                duration: goDefaultDuration,
                alignment: orientation == Orientation.landscape
                    ? const Alignment(-0.5, 0)
                    : const Alignment(0, 0.4),
                child: AnimatedContainer(
                  height: route.endsWith(AuthOtpPage.route)
                      ? 280
                      : route.endsWith(AuthConfirmPage.route)
                          ? 330
                          : 450,
                  width: 340,
                  duration: goDefaultDuration,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: U.Theme.surface,
                    borderRadius: BorderRadius.circular(U.Theme.radius),
                    border: Border.all(color: U.Theme.outline),
                  ),
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
