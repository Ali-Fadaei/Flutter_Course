import 'package:flutter/material.dart' as M;
import 'ui_kit.dart' as U;

class Tooltip extends M.StatelessWidget {
//
  final String message;

  final M.Widget child;

  const Tooltip({
    super.key,
    required this.message,
    required this.child,
  });

  @override
  M.Widget build(M.BuildContext context) {
    return M.Tooltip(
      message: message,
      textStyle: const M.TextStyle(
        fontSize: 11,
        fontFamily: 'iranSans',
        color: U.Theme.surface,
      ),
      decoration: M.BoxDecoration(
        color: U.Theme.outline2.withOpacity(0.85),
        borderRadius: M.BorderRadius.circular(U.Theme.radius),
      ),
      child: child,
    );
  }
}
