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
        SizedBox(width: 10),
        U.Card(
          width: 40,
          height: 40,
          child: Center(
            child: U.Text(
              count.toString(),
              size: U.TextSize.xl,
              color: U.Theme.onSurface,
              weight: U.TextWeight.bold,
            ),
          ),
        ),
        SizedBox(width: 10),
        IconButton(
          onPressed: onDecrementer,
          icon: U.Image(
            path: U.Images.removIcon,
            color: U.Theme.secondary,
          ),
        ),
      ],
    );
  }
}
