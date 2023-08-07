import 'package:flutter/material.dart';
import 'ui_kit.dart' as U;

class Loading extends StatelessWidget {
//
  final bool isSmall;

  final Color color;

  const Loading({
    super.key,
    this.isSmall = false,
    this.color = U.Theme.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: isSmall ? 20 : 40,
        child: CircularProgressIndicator(
          strokeWidth: isSmall ? 2 : 3,
          color: color,
        ),
      ),
    );
  }
}
