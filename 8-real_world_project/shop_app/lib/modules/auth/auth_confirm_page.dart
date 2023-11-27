import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app/modules/auth/cubit/auth_cubit.dart';
import 'package:shop_app/modules/auth/register_page.dart';
import 'package:shop_app/ui_kit/ui_kit.dart' as U;
// import 'package:shop_app_packages/tool_kit.dart/tool_kit.dart' as T;

class AuthConfirmPage extends StatelessWidget {
  //
  static const route = 'confirm';

  const AuthConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    var authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          previous.goRegisterPage != current.goRegisterPage,
      listener: (context, state) {
        GoRouter.of(context).goNamed(
          AuthRegisterPage.route,
          extra: state.hashId,
        );
      },
      buildWhen: (previous, current) =>
          previous.otpConfirmLoading != current.otpConfirmLoading,
      builder: (context, state) {
        return Container(
          color: U.Theme.surface,
          child: Column(
            children: [
              Row(
                children: [
                  const Spacer(flex: 2),
                  const U.Text(
                    'تایید کد یکبارمصرف',
                    size: U.TextSize.lg,
                    weight: U.TextWeight.bold,
                  ),
                  const Spacer(flex: 1),
                  U.IconButton(
                    icon: U.Images.arrowLeftIcon,
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                  ),
                ],
              ),
              const U.Divider.horizontal(space: 10),
              const Spacer(flex: 2),
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.start,
                  children: [
                    const U.Text(
                      'کد تایید ارسال شده به شماره موبایل',
                      size: U.TextSize.sm,
                      weight: U.TextWeight.medium,
                    ),
                    U.Text(
                      ' ${authCubit.phoneCtrl.text} ',
                      size: U.TextSize.sm,
                      weight: U.TextWeight.bold,
                    ),
                    const U.Text(
                      'را وارد نمایید.',
                      size: U.TextSize.sm,
                      weight: U.TextWeight.medium,
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 2),
              U.PinInput(
                controller: authCubit.otpCtrl,
                onCompleted: authCubit.onOtpConfirmed,
                loading: state.otpConfirmLoading,
              ),
              const Spacer(),
              BlocBuilder<AuthCubit, AuthState>(
                buildWhen: (previous, current) =>
                    previous.timer != current.timer ||
                    previous.otpGenerateLoading != current.otpGenerateLoading,
                builder: (context, state) {
                  return Container(
                    height: 40,
                    alignment: Alignment.center,
                    child: state.timer != 0
                        ? U.Text(
                            '${state.timer} ثانیه مانده تا دریافت مجدد کد',
                            size: U.TextSize.md,
                            weight: U.TextWeight.medium,
                          )
                        : U.OutlinedButton(
                            title: 'ارسال مجدد',
                            color: U.OutlinedButtonColor.secondary,
                            size: U.OutlinedButtonSize.md,
                            onPressed: authCubit.onOtpRequested,
                            loading: state.otpGenerateLoading,
                          ),
                  );
                },
              ),
              const Spacer(),
              U.Button(
                title: 'تایید',
                loading: state.otpConfirmLoading,
                color: U.ButtonColor.primary,
                size: U.ButtonSize.lg,
                onPressed: () {
                  authCubit.onOtpConfirmed();
                },
              ),
              const Spacer(),
            ],
          ),
        );
      },
    );
  }
}
