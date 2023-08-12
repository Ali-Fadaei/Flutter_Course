import 'package:flutter/material.dart';
import 'package:shop_app_navigator/modules/profile/b_page.dart';
import 'package:shop_app_navigator/ui_kit/ui_kit.dart' as U;

class APage extends StatelessWidget {
//
  static const route = '/apage';

  const APage({super.key});

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
              const U.Text('Page-A'),
              const Spacer(),
              U.Button(
                title: 'go to Page B',
                onPressed: () => Navigator.of(context).pushNamed(
                  BPage.route,
                  arguments: 2442,
                ),
              ),
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
