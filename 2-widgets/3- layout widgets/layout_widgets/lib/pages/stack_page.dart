import 'package:flutter/material.dart';
import 'package:layout_widgets/box.dart';

class StackPage extends StatelessWidget {
//
  const StackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.grey.shade200,
      child: const Stack(
        // alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Align(
            alignment: Alignment.center,
            child: Box(
              size: 500,
              color: Colors.teal,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Box(
              size: 250,
              color: Colors.green,
            ),
          ),
          Align(
            alignment: Alignment(0.0, 0.0),
            child: Box(
              size: 125,
              color: Colors.lime,
            ),
          ),
          Positioned(
            top: -100,
            right: 80,
            child: Box(
              size: 125,
              color: Colors.cyan,
            ),
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: Text('Stack Page'),
          )
        ],
      ),
    );
  }
}
