import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import './ui_kit.dart' as U;
import 'package:shop_app_optional_auth/tool_kit/tool_kit.dart' as T;

class PinInput extends StatelessWidget {
  //
  final bool loading;

  final TextEditingController controller;

  final Function() onCompleted;

  const PinInput({
    super.key,
    this.loading = false,
    required this.controller,
    required this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        appContext: context,
        controller: controller,
        autoDisposeControllers: false,
        length: 4,
        autoFocus: true,
        enabled: !loading,
        animationType: AnimationType.fade,
        keyboardType: TextInputType.number,
        onCompleted: (_) => onCompleted(),
        inputFormatters: [T.Formatter.pinCode],
        textStyle: const TextStyle(
          fontFamily: 'iranSans',
          fontSize: 18,
          color: U.Theme.onSurface,
        ),
        pinTheme: PinTheme(
          fieldWidth: 45,
          fieldHeight: 45,
          shape: PinCodeFieldShape.box,
          activeColor: U.Theme.primary,
          inactiveColor: U.Theme.outline2,
          selectedColor: U.Theme.secondary,
          borderRadius: BorderRadius.circular(U.Theme.radius),
        ),
      ),
    );
  }
}
