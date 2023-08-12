import 'package:flutter/material.dart';
import 'ui_kit.dart' as U;

class Card extends StatelessWidget {
  ///
  final double? height;

  final double? width;

  final EdgeInsets? padding;

  final Widget? child;

  const Card({
    super.key,
    this.height,
    this.width,
    this.padding,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
        color: U.Theme.surface,
        borderRadius: BorderRadius.circular(U.Theme.radius),
        border: Border.all(color: U.Theme.outline),
      ),
      child: child,
    );
  }
}
