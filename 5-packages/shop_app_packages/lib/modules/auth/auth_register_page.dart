import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app_packages/modules/auth/cubit/auth_cubit.dart';
import 'package:shop_app_packages/modules/store/store_page.dart';
import 'package:shop_app_packages/ui_kit/ui_kit.dart' as U;
import 'package:shop_app_packages/tool_kit.dart/tool_kit.dart' as T;

class AuthRegisterPage extends StatelessWidget {
//
  static const route = 'register';

  const AuthRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    var authCubit = BlocProvider.of<AuthCubit>(context);

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
            controller: TextEditingController(),
            title: 'نام',
            formatters: [T.Formatter.mobileNumber],
          ),
          const Spacer(),
          U.TextInput(
            controller: TextEditingController(),
            title: 'نام خانوادگی',
            formatters: [T.Formatter.mobileNumber],
          ),
          const Spacer(),
          U.TextInput(
            controller: TextEditingController(),
            title: 'ایمیل',
            formatters: [T.Formatter.mobileNumber],
          ),
          const Spacer(),
          U.TextInput(
            title: 'آدرس ',
            hintText: 'استان، شهر، منطقه...',
            isRequired: true,
            controller: authCubit.adressCtrl,
          ),
          const Spacer(flex: 2),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return U.Button(
                title: 'تایید',
                color: U.ButtonColor.primary,
                loading: state.loading,
                size: U.ButtonSize.lg,
                onPressed: () {
                  GoRouter.of(context).goNamed(StorePage.route);
                },
              );
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
