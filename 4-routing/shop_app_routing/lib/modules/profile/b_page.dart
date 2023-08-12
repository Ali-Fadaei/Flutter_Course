import 'package:flutter/material.dart';
import 'package:shop_app_routing/ui_kit/ui_kit.dart' as U;

class BPage extends StatelessWidget {
//
  final int id;

  const BPage({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Spacer(),
              Text('Page B , value: $id'),
              const Spacer(),
              U.Button(
                title: 'return',
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
