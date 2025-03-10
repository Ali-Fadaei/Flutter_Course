import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// -Apple Design: https://developer.apple.com/design/human-interface-guidelines/

class AppleCupertino extends StatelessWidget {
//
  const AppleCupertino({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'cupertino',
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: CupertinoColors.systemGrey,
          middle: Text('Center Title'),
        ),
        child: Center(
          child: Text(
            'test',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
