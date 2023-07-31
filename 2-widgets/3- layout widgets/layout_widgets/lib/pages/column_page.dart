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
      child: const Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Box(color: Colors.teal),
              Box(color: Colors.green),
              Box(color: Colors.lime),
            ],
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: Text('Column Page'),
          ),
        ],
      ),
    );
  }
}
