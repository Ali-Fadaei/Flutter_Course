import 'package:flutter/material.dart';
import 'package:shop_app_gorouter/ui_kit/ui_kit.dart' as U;

class BPage extends StatelessWidget {
//
  final int id;

  static const route = '/bpage';

  const BPage({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: U.Theme.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SizedBox.expand(
          child: Column(
            children: [
              const Spacer(),
              U.Text('Page-B, id: $id'),
              const Spacer(),
              U.Button(
                title: 'go back',
                onPressed: () => Navigator.of(context).pop(),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
