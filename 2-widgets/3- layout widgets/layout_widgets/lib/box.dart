import 'package:flutter/material.dart';

class Box extends StatelessWidget {
//
  final double size;

  final Color color;

  const Box({
    super.key,
    this.size = 200,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      color: color,
      // padding: const EdgeInsets.all(25),
      // margin: const EdgeInsets.all(25),
      child: Text('size: $size\ncolor: ${color.value}'),
    );
  }
}
