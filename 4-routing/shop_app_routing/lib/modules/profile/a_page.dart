import 'package:flutter/material.dart';
import 'package:shop_app_routing/ui_kit/ui_kit.dart' as U;

class APage extends StatelessWidget {
//
  static const route = '/apage';

  const APage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: U.Theme.background,
      body: SizedBox.expand(
        child: Column(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: U.Button(
                title: 'go back',
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
