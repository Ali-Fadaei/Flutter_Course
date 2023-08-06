import 'package:flutter/material.dart' as M;
import 'ui_kit.dart' as U;

class Divider extends M.StatelessWidget {
//
  final bool isVertical;

  const Divider.vertical({super.key}) : isVertical = true;

  const Divider.horizontal({super.key}) : isVertical = false;

  @override
  M.Widget build(M.BuildContext context) {
    return isVertical
        ? M.VerticalDivider(color: U.Theme.outline2.withOpacity(0.5))
        : M.Divider(color: U.Theme.outline2.withOpacity(0.5));
  }
}
