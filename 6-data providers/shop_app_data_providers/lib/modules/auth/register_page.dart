import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_data_providers/modules/auth/cubit/auth_cubit.dart';
import 'package:shop_app_data_providers/ui_kit/ui_kit.dart' as U;
import 'package:shop_app_data_providers/tool_kit/tool_kit.dart' as T;

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    var authCubit = BlocProvider.of<AuthCubit>(context);

    return Container(
      color: U.Theme.surface,
      child: Column(
        children: [
          const U.Text(
            'ثبت نام',
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
          U.TextInput(
            controller: TextEditingController(),
            title: 'نام',
            formatters: [T.Formatter.mobileNumber],
          ),
          U.TextInput(
            controller: TextEditingController(),
            title: 'نام خانوادگی',
            formatters: [T.Formatter.mobileNumber],
          ),
          U.TextInput(
            title: 'آدرس ',
            hintText: 'استان، شهر، منطقه...',
            isRequired: true,
            controller: authCubit.adressCtrl,
          ),
          const Spacer(),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return U.Button(
                title: 'ثبت نام',
                color: U.ButtonColor.primary,
                loading: state.loading,
                size: U.ButtonSize.lg,
                onPressed: () => authCubit.onOtpCompleted(),
              );
            },
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
