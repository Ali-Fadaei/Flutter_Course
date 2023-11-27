import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app/modules/app/cubit/app_cubit.dart';
import 'package:shop_app/modules/auth/auth_otp_page.dart';
import 'package:shop_app/modules/profile/cubit/profile_cubit.dart';
import 'package:shop_app/ui_kit/ui_kit.dart' as U;

class ProfilePage extends StatelessWidget {
//
  static const route = '/profile';

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, appState) {
        return BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            final profileCubit = BlocProvider.of<ProfileCubit>(context);
            return Column(
              children: [
                U.AppBar.primary(
                  onMenuPressed: () {},
                  onNotifPressed: () {},
                ),
                if (appState.jwtAuthCheck)
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              U.Text(
                                '${state.user!.firstName} ${state.user!.lastName}',
                                color: U.Theme.secondary,
                                font: U.TextFont.iranSans,
                                size: U.TextSize.lg,
                                weight: U.TextWeight.medium,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              U.Text(
                                state.user!.mobileNumber,
                                color: U.Theme.outline2,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              U.Text(
                                state.user!.address,
                                color: U.Theme.outline2,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: SizedBox(
                            height: 60,
                            child: Row(
                              children: [
                                const Spacer(),
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    U.Text(
                                      state.doneOrders.toString(),
                                      color: U.Theme.primary,
                                      weight: U.TextWeight.bold,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const U.Text(
                                      "سفارش تحویل شده ",
                                      color: U.Theme.secondary,
                                      size: U.TextSize.sm,
                                    )
                                  ],
                                ),
                                const Spacer(),
                                const U.Divider.vertical(),
                                const Spacer(),
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    U.Text(
                                      state.processingOrders.toString(),
                                      color: U.Theme.primary,
                                      weight: U.TextWeight.bold,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const U.Text(
                                      "سفارش درحال پردازش",
                                      color: U.Theme.secondary,
                                      size: U.TextSize.sm,
                                    )
                                  ],
                                ),
                                const Spacer(),
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
                            size: U.ButtonSize.md,
                            color: U.ButtonColor.primary,
                            loading: state.logOutLoading,
                            onPressed: profileCubit.onLogOutPressed,
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                if (!appState.jwtAuthCheck)
                  Expanded(
                    child: Column(
                      children: [
                        const Spacer(flex: 2),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: U.Button(
                            title: 'ورود به حساب کاربری',
                            onPressed: () => GoRouter.of(context).goNamed(
                              AuthOtpPage.route,
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  )
              ],
            );
          },
        );
      },
    );
  }
}
