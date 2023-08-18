import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app_gorouter/modules/profile/b_page.dart';
import 'package:shop_app_gorouter/ui_kit/ui_kit.dart' as U;

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
                onPressed: () => GoRouter.of(context).goNamed(
                  BPage.route,
                  pathParameters: {
                    'id': '110',
                  },
                ),
              ),
              const Spacer(),
              U.Button(
                title: 'go back',
                onPressed: () => GoRouter.of(context).pop(),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
