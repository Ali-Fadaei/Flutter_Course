import 'package:flutter/material.dart';
import 'package:shop_app/ui_kit/ui_kit.dart' as U;

class CategoriesPage extends StatelessWidget {
//
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Spacer(),
          U.Button(
            title: 'افزودن به سبد خرید',
            color: U.ButtonColor.primary,
            size: U.ButtonSize.lg,
            // trailing: U.Text('salam'),
            onPressed: () {
              print('salam');
            },
          ),
          Spacer(),
        ],
      ),
    );
  }
}
