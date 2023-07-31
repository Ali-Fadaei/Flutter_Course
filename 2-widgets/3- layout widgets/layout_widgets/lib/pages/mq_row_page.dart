import 'package:flutter/material.dart';
import 'package:layout_widgets/box.dart';

class MediaQueryRowPage extends StatelessWidget {
//
  const MediaQueryRowPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      color: Colors.grey.shade200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Positioned(
            left: 10,
            bottom: 10,
            child: Text('Media Query Row Page'),
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width * 0.3,
                child: const Box(color: Colors.teal, size: 100),
              ),
              SizedBox(
                width: size.width * 0.05,
              ),
              SizedBox(
                width: size.width * 0.3,
                child: const Box(color: Colors.green, size: 100),
              ),
              SizedBox(
                width: size.width * 0.05,
              ),
              SizedBox(
                width: size.width * 0.3,
                child: const Box(color: Colors.lime, size: 100),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
