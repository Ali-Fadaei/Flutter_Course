import 'package:flutter/material.dart';
import 'package:shop_app/ui_kit/ui_kit.dart' as U;

class CategoriesPage extends StatefulWidget {
//
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
//
  var isChecked1 = false;

  var isChecked2 = false;

  var isChecked3 = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 120),
            child: Column(
              children: [
                U.CheckBox(
                  title: 'لپ‌تاپ',
                  isChecked: isChecked1,
                  onPressed: (checked) {
                    setState(() => isChecked1 = checked);
                  },
                ),
                SizedBox(height: 30),
                U.CheckBox(
                  title: 'موبایل',
                  isChecked: isChecked2,
                  onPressed: (checked) {
                    setState(() => isChecked2 = checked);
                  },
                ),
                SizedBox(height: 30),
                U.CheckBox(
                  title: 'لپ‌تاپ',
                  isChecked: isChecked3,
                  onPressed: (checked) {
                    setState(() => isChecked3 = checked);
                  },
                ),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
