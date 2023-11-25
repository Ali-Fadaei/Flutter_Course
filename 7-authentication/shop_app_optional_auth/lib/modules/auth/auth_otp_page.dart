import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app_optional_auth/modules/auth/auth_confirm_page.dart';
import 'package:shop_app_optional_auth/modules/auth/cubit/auth_cubit.dart';
import 'package:shop_app_optional_auth/ui_kit/ui_kit.dart' as U;
import 'package:shop_app_optional_auth/tool_kit/tool_kit.dart' as T;

class AuthOtpPage extends StatelessWidget {
  //
  static const route = '/auth/otp';

  const AuthOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          previous.goConfirmPage != current.goConfirmPage,
      listener: (context, state) {
        GoRouter.of(context).goNamed(
          AuthConfirmPage.route,
          extra: state.hashId,
        );
      },
      buildWhen: (previous, current) =>
          previous.otpGenerateLoading != current.otpGenerateLoading,
      builder: (context, state) {
        return Container(
          color: U.Theme.surface,
          child: Column(
            children: [
              const U.Text(
                'ورود | ثبت‌نام',
                size: U.TextSize.lg,
                weight: U.TextWeight.bold,
              ),
              const U.Divider.horizontal(space: 10),
              const Spacer(flex: 2),
              const Row(
                children: [
                  U.Text('سلام!'),
                  Spacer(),
                ],
              ),
              const Row(
                children: [
                  U.Text('برای ادامه شماره موبایل خود را وارد نمایید.'),
                  Spacer(),
                ],
              ),
              const Spacer(),
              U.TextInput(
                title: 'شماره موبایل',
                autoFocus: true,
                disabled: false,
                controller: authCubit.phoneCtrl,
                formatters: [T.Formatter.mobileNumber],
              ),
              const Spacer(flex: 2),
              U.Button(
                title: 'ادامه',
                color: U.ButtonColor.primary,
                loading: state.otpGenerateLoading,
                size: U.ButtonSize.lg,
                onPressed: () => authCubit.onOtpRequested(),
              ),
              const SizedBox(height: 10),
              const U.Text(
                'ورود شما به معنای پذیرش شرایط آمازون و قوانین حریم‌خصوصی است.',
                size: U.TextSize.xs,
              ),
              const Spacer(),
            ],
          ),
        );
      },
    );
  }
}
