import 'package:flutter/material.dart' as M;
import 'ui_kit.dart' as U;

class Divider extends M.StatelessWidget {
  ///
  final bool isVertical;

  final double thickness;

  final double space;

  final M.Color? color;

  const Divider.vertical({
    super.key,
    this.color,
    this.space = 20,
    this.thickness = 1,
  }) : isVertical = true;

  const Divider.horizontal({
    super.key,
    this.color,
    this.space = 5,
    this.thickness = 1,
  }) : isVertical = false;

  @override
  M.Widget build(M.BuildContext context) {
    return isVertical
        ? M.VerticalDivider(
            width: space,
            thickness: 1,
            color: color ?? U.Theme.outline2.withOpacity(0.5),
          )
        : M.Divider(
            height: space,
            thickness: 1,
            color: color ?? U.Theme.outline2.withOpacity(0.5),
          );
  }
}
