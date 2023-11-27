import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/profile/cubit/profile_cubit.dart';
import 'package:shop_app/ui_kit/ui_kit.dart' as U;

class ProfileBottomSheet extends StatelessWidget {
  const ProfileBottomSheet({super.key});

  static Future show(
    BuildContext context, {
    required ProfileCubit profileCubit,
  }) {
    return U.BottomSheet.show(
      context,
      builder: (context) {
        return BlocProvider.value(
          value: profileCubit,
          child: const ProfileBottomSheet(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return U.BottomSheet(
      child: Center(
        child: Text("data"),
      ),
    );
  }
}
