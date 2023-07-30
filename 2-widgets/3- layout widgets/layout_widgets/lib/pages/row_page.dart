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
      child: const Column(
        children: [
          SizedBox(height: 10),
          Text('Row Page'),
          SizedBox(height: 20),
          Expanded(
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Box(color: Colors.teal, size: 100),
                Box(color: Colors.green, size: 150),
                Box(color: Colors.lime, size: 200),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
