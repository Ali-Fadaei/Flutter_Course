import 'package:flutter/material.dart';
import 'ui_kit.dart' as U;

class Loading extends StatelessWidget {
//
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        strokeWidth: 4,
        color: U.Theme.primary,
      ),
    );
  }
}
