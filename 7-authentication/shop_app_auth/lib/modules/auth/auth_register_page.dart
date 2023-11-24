import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app_auth/modules/auth/cubit/auth_cubit.dart';
import 'package:shop_app_auth/ui_kit/ui_kit.dart' as U;

class AuthRegisterPage extends StatelessWidget {
//
  static const route = 'auth/register';

  const AuthRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    var authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (previous, current) =>
          previous.registerLoading != current.registerLoading ||
          previous.userRegisterValidation != current.userRegisterValidation,
      builder: (context, state) {
        return Container(
          color: U.Theme.surface,
          child: Column(
            children: [
              Row(
                children: [
                  const Spacer(flex: 8),
                  const U.Text(
                    'ثبت‌نام',
                    size: U.TextSize.lg,
                    weight: U.TextWeight.bold,
                  ),
                  const Spacer(flex: 6),
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
                      'برای تکمیل ثبت‌نام با شماره موبایل',
                      size: U.TextSize.sm,
                      weight: U.TextWeight.medium,
                    ),
                    U.Text(
                      ' ${authCubit.phoneCtrl.text} ',
                      size: U.TextSize.sm,
                      weight: U.TextWeight.bold,
                    ),
                    const U.Text(
                      'فرم زیر را تکمیل نمایید.',
                      size: U.TextSize.sm,
                      weight: U.TextWeight.medium,
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 2),
              U.TextInput(
                title: 'نام',
                isRequired: true,
                disabled: state.registerLoading,
                controller: authCubit.nameCtrl,
                errMessage: state.userRegisterValidation?.firstName,
              ),
              const Spacer(),
              U.TextInput(
                title: 'نام خانوادگی',
                isRequired: true,
                disabled: state.registerLoading,
                controller: authCubit.lastNameCtrl,
                errMessage: state.userRegisterValidation?.lastName,
              ),
              const Spacer(),
              U.TextInput(
                title: 'ایمیل',
                isRequired: true,
                disabled: state.registerLoading,
                controller: authCubit.emailCtrl,
                errMessage: state.userRegisterValidation?.email,
              ),
              const Spacer(),
              U.TextInput(
                title: 'آدرس ',
                isRequired: true,
                disabled: state.registerLoading,
                hintText: 'استان، شهر، منطقه...',
                controller: authCubit.addressCtrl,
                errMessage: state.userRegisterValidation?.address,
              ),
              const Spacer(flex: 2),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return U.Button(
                    title: 'تایید',
                    color: U.ButtonColor.primary,
                    loading: state.registerLoading,
                    size: U.ButtonSize.lg,
                    onPressed: () {
                      authCubit.onRegisterRequested();
                    },
                  );
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
