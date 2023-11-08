import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app_auth/modules/auth/auth_confirm_page.dart';
import 'package:shop_app_auth/modules/auth/cubit/auth_cubit.dart';
import 'package:shop_app_auth/ui_kit/ui_kit.dart' as U;
import 'package:shop_app_auth/tool_kit/tool_kit.dart' as T;

class OtpPage extends StatelessWidget {
  //
  static const route = '/otp';

  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listenWhen: (previous, current) => previous.hashId != current.hashId,
      listener: (context, state) {
        GoRouter.of(context).goNamed(OtpConfirmPage.route);
      },
      buildWhen: (previous, current) => previous.loading != current.loading,
      builder: (context, state) {
        return Container(
          color: U.Theme.surface,
          child: Column(
            children: [
              const U.Text(
                'ورود | ثبت‌نام حساب‌کاربری',
                size: U.TextSize.xl,
                weight: U.TextWeight.medium,
              ),
              const U.Divider.horizontal(),
              const Spacer(),
              U.TextInput(
                controller: TextEditingController(),
                title: 'شماره موبایل',
                formatters: [T.Formatter.mobileNumber],
              ),
              const Spacer(),
              U.Button(
                title: 'ادامه',
                color: U.ButtonColor.primary,
                loading: state.loading,
                size: U.ButtonSize.lg,
                onPressed: () => authCubit.onOtpCompleted(),
              ),
              const SizedBox(height: 100),
            ],
          ),
        );
      },
    );
  }
}
