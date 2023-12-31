import 'package:flutter/material.dart';
import 'package:layout_widgets/box.dart';

class ExpandedColumnPage extends StatelessWidget {
//
  const ExpandedColumnPage({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(flex: 1),
              Expanded(
                flex: 4,
                child: Box(color: Colors.teal),
              ),
              Spacer(flex: 2),
              Expanded(
                flex: 4,
                child: Box(color: Colors.green),
              ),
              Spacer(flex: 4),
              Expanded(
                flex: 4,
                child: Box(color: Colors.lime),
              ),
              Spacer(flex: 5),
            ],
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: Text('Expanded Column Page'),
          )
        ],
      ),
    );
  }
}
