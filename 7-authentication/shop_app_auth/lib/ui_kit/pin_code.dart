import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import './ui_kit.dart' as U;

class PinCodeInput extends StatelessWidget {
  final bool loading;
  final TextEditingController controller;
  final Function() onCompleted;

  const PinCodeInput({
    super.key,
    this.loading = false,
    required this.controller,
    required this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      autoFocus: true,
      enabled: !loading,
      animationType: AnimationType.fade,
      onCompleted: (_) => onCompleted(),
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        activeColor: U.Theme.primary,
        inactiveColor: U.Theme.outline2,
        selectedColor: U.Theme.secondary,
        borderRadius: BorderRadius.circular(U.Theme.radius),
      ),
    );
  }
}
