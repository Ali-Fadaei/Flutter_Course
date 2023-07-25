import 'package:flutter/material.dart';
import 'ui_kit.dart' as U;

class Counter extends StatelessWidget {
//
  final int count;

  final void Function() onIncrementer;

  final void Function() onDecrementer;

  const Counter({
    super.key,
    required this.onIncrementer,
    required this.onDecrementer,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onIncrementer,
          icon: U.Image(
            path: U.Images.addIcon,
            color: U.Theme.primary,
          ),
        ),
        SizedBox(width: 15),
        Container(
          width: 45.67,
          height: 45.67,
          decoration: BoxDecoration(
            border: Border.all(
              color: U.Theme.outline,
              width: 2,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(U.Theme.radius),
          ),
          child: Center(
            child: U.Text(
              count.toString(),
              color: U.Theme.outline2,
              size: U.TextSize.xxl,
              weight: U.TextWeight.bold,
            ),
          ),
        ),
        SizedBox(width: 15),
        IconButton(
          onPressed: onDecrementer,
          icon: U.Image(
            path: U.Images.removeIcon,
            color: U.Theme.secondary,
          ),
        ),
      ],
    );
  }
}
