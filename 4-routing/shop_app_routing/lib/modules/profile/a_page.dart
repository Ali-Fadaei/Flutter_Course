import 'package:flutter/material.dart';
import 'package:shop_app_routing/modules/profile/b_page.dart';
import 'package:shop_app_routing/ui_kit/ui_kit.dart' as U;

class APage extends StatelessWidget {
//
  const APage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Spacer(),
              const Text('Page A'),
              const Spacer(),
              U.Button(
                title: 'return',
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              const Spacer(),
              U.Button(
                title: 'goto page B',
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    '/bpage',
                    arguments: 2,
                  );
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
