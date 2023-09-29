import 'package:flutter/material.dart';
import 'ui_kit.dart' as U;

enum CounterSize { md, lg }

class Counter extends StatelessWidget {
  ///
  final int count;

  final CounterSize size;

  final bool loading;

  final bool disabled;

  final void Function() onAddPressed;

  final void Function() onRemovePressed;

  const Counter({
    super.key,
    this.loading = false,
    this.disabled = false,
    this.size = CounterSize.md,
    required this.count,
    required this.onAddPressed,
    required this.onRemovePressed,
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
          U.IconButton(
            disabled: loading || disabled,
            icon: U.Images.addIcon,
            size: U.IconButtonSize.sm,
            iconColor: U.Theme.primary,
            onPressed: onAddPressed,
          ),
          const SizedBox(width: 5),
          U.Card(
            height: _size,
            width: _size,
            child: Center(
              child: loading
                  ? const U.Loading(
                      isSmall: true,
                    )
                  : U.Text(
                      count.toString(),
                      size: _textStyle.size,
                      weight: _textStyle.weight,
                      color: U.Theme.onSurface,
                    ),
            ),
          ),
          const SizedBox(width: 5),
          U.IconButton(
            disabled: loading || disabled,
            icon: count == 1 ? U.Images.removeIcon : U.Images.minIcon,
            size: U.IconButtonSize.sm,
            onPressed: onRemovePressed,
          ),
        ],
      ),
    );
  }
}
