import 'package:flutter/material.dart';
import 'ui_kit.dart' as U;

class BottomSheet extends StatelessWidget {
  ///
  static Future<T?> show<T>(
    BuildContext context, {
    double? maxWidth,
    double? maxHeight,
    required Widget Function(BuildContext context) builder,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxWidth: maxWidth ?? 1024,
        maxHeight: maxHeight ?? MediaQuery.of(context).size.height * 0.80,
      ),
      builder: builder,
    );
  }

  final Widget child;

  const BottomSheet({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: U.Theme.background,
        borderRadius: BorderRadius.circular(U.Theme.radius),
      ),
      child: Column(
        children: [
          Container(
            height: 5,
            width: 70,
            decoration: BoxDecoration(
              color: U.Theme.outline2,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(child: child),
        ],
      ),
    );
  }
}
