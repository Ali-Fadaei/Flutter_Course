import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_data_providers/modules/auth/cubit/auth_cubit.dart';
import 'package:shop_app_data_providers/ui_kit/ui_kit.dart' as U;

class AuthShell extends StatelessWidget {
//
  final Widget child;

  const AuthShell({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        backgroundColor: U.Theme.background,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Align(
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
            Align(
              alignment: orientation == Orientation.landscape
                  ? const Alignment(-0.5, 0)
                  : const Alignment(0, 0.55),
              child: U.Card(
                height: 500,
                width: 340,
                padding: const EdgeInsets.all(12),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
