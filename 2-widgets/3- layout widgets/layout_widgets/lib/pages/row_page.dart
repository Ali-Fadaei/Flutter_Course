import 'package:flutter/material.dart';
import 'package:layout_widgets/box.dart';

class RowPage extends StatelessWidget {
//
  const RowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.grey.shade200,
      child: const Stack(
        alignment: Alignment.center,
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Box(color: Colors.teal, size: 100),
              Box(color: Colors.green, size: 150),
              Box(color: Colors.lime, size: 200),
            ],
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: Text('Row Page'),
          ),
        ],
      ),
    );
  }
}
