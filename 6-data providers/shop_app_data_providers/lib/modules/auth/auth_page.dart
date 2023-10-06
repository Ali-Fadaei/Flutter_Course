import 'package:flutter/material.dart';
import 'package:shop_app_data_providers/ui_kit/ui_kit.dart' as U;

class AuthPage extends StatelessWidget {
//
  static const route = '/auth';

  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return Scaffold(
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
              child: Column(
                children: [
                  const U.Text(
                    'ورود به حساب‌کاربری',
                    size: U.TextSize.xl,
                    weight: U.TextWeight.medium,
                  ),
                  const U.Divider.horizontal(),
                  const SizedBox(height: 20),
                  U.TextInput(
                    controller: TextEditingController(),
                    title: 'نام کاربری',
                  ),
                  const SizedBox(height: 20),
                  U.TextInput(
                    controller: TextEditingController(),
                    title: 'کلمه‌عبور',
                  ),
                  const SizedBox(height: 40),
                  U.Button(
                    title: 'ورود',
                    color: U.ButtonColor.primary,
                    size: U.ButtonSize.lg,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 20),
                  U.OutlinedButton(
                    title: 'ایجاد حساب‌کاربری',
                    color: U.OutlinedButtonColor.primary,
                    size: U.OutlinedButtonSize.md,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 20),
                  U.OutlinedButton(
                    title: 'فراموشی رمزعبور',
                    color: U.OutlinedButtonColor.primary,
                    size: U.OutlinedButtonSize.sm,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
