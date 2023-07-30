import 'package:flutter/material.dart';
import 'package:layout_widgets/box.dart';

class ColumnPage extends StatelessWidget {
//
  const ColumnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.grey.shade200,
      child: const Column(
        children: [
          SizedBox(height: 10),
          Text('Column Page'),
          SizedBox(height: 20),
          Expanded(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Box(color: Colors.teal),
                Box(color: Colors.green),
                Box(color: Colors.lime),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
