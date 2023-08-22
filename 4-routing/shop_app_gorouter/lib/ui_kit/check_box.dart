import 'package:flutter/material.dart';
import './ui_kit.dart' as U;

class CheckBox extends StatelessWidget {
  ///
  final String title;

  final bool isChecked;

  final void Function(bool checked) onPressed;

  const CheckBox({
    super.key,
    required this.title,
    required this.isChecked,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(!isChecked),
      child: Row(
        children: [
          U.Text(
            title,
            size: U.TextSize.md,
            weight: U.TextWeight.medium,
            color: isChecked ? U.Theme.primary : U.Theme.secondary,
          ),
          const SizedBox(width: 8),
          U.Image(
            path: isChecked
                ? U.Images.checkBoxFilledIcon
                : U.Images.checkBoxEmptyIcon,
          ),
        ],
      ),
    );
  }
}
