import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app_data_providers/modules/auth/cubit/auth_cubit.dart';
import 'package:shop_app_data_providers/ui_kit/ui_kit.dart' as U;
// import 'package:shop_app_data_providers/tool_kit.dart/tool_kit.dart' as T;

class OtpConfirmPage extends StatelessWidget {
  //
  static const route = 'confirm';

  const OtpConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    var authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (previous, current) => previous.loading != current.loading,
      builder: (context, state) {
        return Container(
          color: U.Theme.surface,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const U.Text(
                'تایید کد یکبارمصرف',
                size: U.TextSize.xl,
                weight: U.TextWeight.medium,
              ),
              const U.Divider.horizontal(),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: U.PinCodeInput(
                  controller: authCubit.otpCtrl,
                  onCompleted: authCubit.onConfirmPressed,
                  loading: state.loading,
                ),
              ),
              const SizedBox(height: 20),
              BlocBuilder<AuthCubit, AuthState>(
                buildWhen: (previous, current) =>
                    previous.timer != current.timer,
                builder: (context, state) {
                  return state.timer != 0
                      ? U.Text(
                          state.timer.toString(),
                          size: U.TextSize.lg,
                          weight: U.TextWeight.medium,
                        )
                      : InkWell(
                          onTap: authCubit.onOtpCompleted,
                          child: const U.Text(
                            'ارسال مجدد',
                            size: U.TextSize.lg,
                            weight: U.TextWeight.medium,
                          ),
                        );
                },
              ),
              const SizedBox(height: 20),
              const Spacer(),
              U.Button(
                title: 'تایید',
                loading: state.loading,
                color: U.ButtonColor.primary,
                size: U.ButtonSize.lg,
                onPressed: () {
                  authCubit.onConfirmPressed();
                },
              ),
              const SizedBox(height: 10),
              U.OutlinedButton(
                title: 'بازگشت',
                color: U.OutlinedButtonColor.secondary,
                size: U.OutlinedButtonSize.md,
                onPressed: () {
                  GoRouter.of(context).pop();
                },
              ),
              const SizedBox(height: 100),
            ],
          ),
        );
      },
    );
  }
}
