import 'package:flutter/material.dart';
import './ui_kit.dart' as U;

class CheckBox extends StatelessWidget {
//
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
    return Material(
      borderRadius: BorderRadius.circular(U.Theme.radius),
      child: InkWell(
        borderRadius: BorderRadius.circular(U.Theme.radius),
        onTap: () => onPressed(!isChecked),
        child: Row(
          children: [
            U.Image(
              path: isChecked
                  ? U.Images.checkBoxFilledIcon
                  : U.Images.checkBoxEmptyIcon,
            ),
            SizedBox(width: 12),
            U.Text(
              title,
              color: isChecked ? U.Theme.primary : U.Theme.secondary,
              weight: U.TextWeight.bold,
              size: U.TextSize.lg,
            ),
          ],
        ),
      ),
    );
  }
}
