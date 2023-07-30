import 'package:flutter/material.dart';

class CounterText extends StatelessWidget {
//
  final int count;

  const CounterText({
    super.key,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'counter: ${count.toString()}',
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
