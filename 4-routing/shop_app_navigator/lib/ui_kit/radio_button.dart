import 'package:flutter/material.dart';
import 'ui_kit.dart' as U;

class RadioButton<T> extends StatelessWidget {
  ///
  final String title;

  final T value;

  final T groupValue;

  final bool enabled;

  final void Function(T value) onPressed;

  const RadioButton({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onPressed,
  }) : enabled = value == groupValue;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(value),
      child: Row(
        children: [
          U.Text(
            title,
            size: U.TextSize.lg,
            weight: U.TextWeight.medium,
            color: enabled ? U.Theme.primary : U.Theme.secondary,
          ),
          const SizedBox(width: 8),
          U.Image(
            path: enabled
                ? U.Images.radioBoxFilledIcon
                : U.Images.radioBoxEmptyIcon,
          ),
        ],
      ),
    );
  }
}
