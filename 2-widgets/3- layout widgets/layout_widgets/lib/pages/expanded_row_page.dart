import 'package:flutter/material.dart';
import 'package:layout_widgets/box.dart';

class ExpandedRowPage extends StatelessWidget {
//
  const ExpandedRowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.grey.shade200,
      child: const Column(
        children: [
          SizedBox(height: 10),
          Text('Expanded Row Page'),
          SizedBox(height: 20),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                Expanded(
                  flex: 20,
                  child: Box(color: Colors.teal, size: 100),
                ),
                Spacer(flex: 1),
                Expanded(
                  flex: 20,
                  child: Box(color: Colors.green, size: 150),
                ),
                Spacer(flex: 1),
                Expanded(
                  flex: 20,
                  child: Box(color: Colors.lime, size: 200),
                ),
                Spacer(flex: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
