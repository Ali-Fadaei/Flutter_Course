import 'package:flutter/material.dart';
import 'package:layout_widgets/box.dart';

class MediaQueryColumnPage extends StatelessWidget {
//
  const MediaQueryColumnPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      color: Colors.grey.shade200,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.3,
                  child: const Box(color: Colors.teal),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                SizedBox(
                  height: size.height * 0.3,
                  child: const Box(color: Colors.green),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                SizedBox(
                  height: size.height * 0.3,
                  child: const Box(color: Colors.lime),
                ),
              ],
            ),
          ),
          const Positioned(
            left: 10,
            bottom: 10,
            child: Text('Media Query Column Page'),
          ),
        ],
      ),
    );
  }
}
