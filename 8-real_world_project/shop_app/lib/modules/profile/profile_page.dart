import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/app/cubit/app_cubit.dart';
import 'package:shop_app/ui_kit/ui_kit.dart' as U;

class ProfilePage extends StatelessWidget {
//
  static const route = '/profile';

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Column(
          children: [
            U.AppBar.primary(
              onMenuPressed: () {},
              onNotifPressed: () {},
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  U.Text(
                    "محمد حسین تهباز رضازاده",
                    color: U.Theme.secondary,
                    font: U.TextFont.iranSans,
                    size: U.TextSize.lg,
                    weight: U.TextWeight.medium,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  U.Text(
                    "09144244622",
                    color: U.Theme.outline2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  U.Text(
                    "تبریز ، خیابان ولیعصر ، اوحدی ، جنب شهرکتاب طبقه دوم پلاک A",
                    // alignment: TextAlign.center,
                    color: U.Theme.outline2,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                height: 60,
                child: Row(
                  children: [
                    Spacer(),
                    Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        U.Text(
                          "10",
                          color: U.Theme.primary,
                          weight: U.TextWeight.bold,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        U.Text(
                          "سفارش تحویل شده ",
                          color: U.Theme.secondary,
                          size: U.TextSize.sm,
                        )
                      ],
                    ),
                    Spacer(),
                    U.Divider.vertical(),
                    Spacer(),
                    Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        U.Text(
                          "2",
                          color: U.Theme.primary,
                          weight: U.TextWeight.bold,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        U.Text(
                          "سفارش درحال پردازش",
                          color: U.Theme.secondary,
                          size: U.TextSize.sm,
                        )
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
            Container(
              width: 1000,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: const U.Divider.horizontal(),
            ),
            const Spacer(),
            Container(
              width: 500,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  const Spacer(),
                  SizedBox(
                    height: 60,
                    width: 160,
                    child: U.OutlinedButton(
                      title: "حساب کاربری",
                      color: U.OutlinedButtonColor.secondary,
                      size: U.OutlinedButtonSize.md,
                      onPressed: () {},
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 60,
                    width: 160,
                    child: U.OutlinedButton(
                      title: "سفارشات",
                      color: U.OutlinedButtonColor.secondary,
                      size: U.OutlinedButtonSize.md,
                      onPressed: () {},
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 500,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  const Spacer(),
                  SizedBox(
                    height: 60,
                    width: 160,
                    child: U.OutlinedButton(
                      title: "حالت شب",
                      color: U.OutlinedButtonColor.secondary,
                      size: U.OutlinedButtonSize.md,
                      onPressed: () {},
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 60,
                    width: 160,
                    child: U.OutlinedButton(
                      title: 'بیومتریک',
                      color: U.OutlinedButtonColor.secondary,
                      size: U.OutlinedButtonSize.md,
                      onPressed: () {},
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 500,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  const Spacer(),
                  SizedBox(
                    height: 60,
                    width: 160,
                    child: U.OutlinedButton(
                      title: "درباره‌ما",
                      color: U.OutlinedButtonColor.secondary,
                      size: U.OutlinedButtonSize.md,
                      onPressed: () {},
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 60,
                    width: 160,
                    child: U.OutlinedButton(
                      title: "پشتیبانی",
                      color: U.OutlinedButtonColor.secondary,
                      size: U.OutlinedButtonSize.md,
                      onPressed: () {},
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const Spacer(),
            Container(
              width: 500,
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: U.Button(
                title: "خروج از حساب کاربری",
                color: U.ButtonColor.primary,
                onPressed: () {},
                size: U.ButtonSize.md,
              ),
            ),
            const SizedBox(height: 40),
          ],
        );
      },
    );
  }
}
