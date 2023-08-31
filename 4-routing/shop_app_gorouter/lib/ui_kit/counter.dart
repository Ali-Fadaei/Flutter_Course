import 'package:flutter/material.dart';
import 'ui_kit.dart' as U;

enum CounterSize { md, lg }

class Counter extends StatelessWidget {
  ///
  final int count;

  final CounterSize size;

  final void Function() onIncrementer;

  final void Function() onDecrementer;

  const Counter({
    super.key,
    required this.count,
    this.size = CounterSize.md,
    required this.onIncrementer,
    required this.onDecrementer,
  });

  double get _size {
    switch (size) {
      case CounterSize.md:
        return 40;
      case CounterSize.lg:
        return 50;
    }
  }

  ({U.TextSize size, U.TextWeight weight}) get _textStyle {
    switch (size) {
      case CounterSize.md:
        return (size: U.TextSize.md, weight: U.TextWeight.bold);
      case CounterSize.lg:
        return (size: U.TextSize.lg, weight: U.TextWeight.bold);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _size,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: onIncrementer,
            icon: const U.Image(
              size: 12,
              path: U.Images.addIcon,
              color: U.Theme.primary,
            ),
          ),
          const SizedBox(width: 5),
          U.Card(
            height: _size,
            width: _size,
            child: Center(
              child: U.Text(
                count.toString(),
                size: _textStyle.size,
                weight: _textStyle.weight,
                color: U.Theme.onSurface,
              ),
            ),
          ),
          const SizedBox(width: 5),
          IconButton(
            onPressed: onDecrementer,
            icon: const U.Image(
              size: 12,
              path: U.Images.removIcon,
              color: U.Theme.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
