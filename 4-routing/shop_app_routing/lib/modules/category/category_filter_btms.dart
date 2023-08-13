import 'package:flutter/material.dart';
import 'package:shop_app_routing/ui_kit/ui_kit.dart' as U;

class CategoryFilterBtms extends StatelessWidget {
//
  static Future show(
    BuildContext context,
  ) async {
    U.BottomSheet.show(
      context,
      maxHeight: 500,
      builder: (context) {
        return const CategoryFilterBtms();
      },
    );
  }

  const CategoryFilterBtms({super.key});

  @override
  Widget build(BuildContext context) {
    return U.BottomSheet(
      child: Column(
        children: [
          const Row(
            children: [
              U.Text(
                'بر اساس امتیاز: ',
                size: U.TextSize.xl,
                weight: U.TextWeight.medium,
              ),
              Spacer()
            ],
          ),
          Row(
            children: [
              Expanded(
                child: U.RangeSlider(
                  minValue: 0,
                  maxValue: 5,
                  minRangeValue: 0,
                  maxRangeValue: 5,
                  divisions: 10,
                  sign: const Icon(Icons.star, color: Colors.amber),
                  onChanged: (min, max) {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          const Row(
            children: [
              U.Text(
                'بر اساس قیمت: ',
                size: U.TextSize.xl,
                weight: U.TextWeight.medium,
              ),
              Spacer()
            ],
          ),
          Row(
            children: [
              Expanded(
                child: U.RangeSlider(
                  minValue: 0,
                  maxValue: 500000000,
                  minRangeValue: 0,
                  maxRangeValue: 500000000,
                  divisions: 500,
                  sign: const U.Text('تومان'),
                  onChanged: (min, max) {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Row(
            children: [
              const U.Text(
                'به ترتیب: ',
                size: U.TextSize.xl,
                weight: U.TextWeight.medium,
              ),
              const Spacer(),
              U.RadioButton<int>(
                groupValue: 1,
                value: 1,
                title: 'قیمت',
                onPressed: (value) {},
              ),
              const Spacer(),
              U.RadioButton<int>(
                groupValue: 1,
                value: 2,
                title: 'امتیاز',
                onPressed: (value) {},
              ),
              const Spacer(),
              const SizedBox(height: 25, child: U.Divider.vertical()),
              const Spacer(),
              U.RadioButton<int>(
                groupValue: 1,
                value: 1,
                title: 'صعودی',
                onPressed: (value) {},
              ),
              const Spacer(),
              U.RadioButton<int>(
                groupValue: 1,
                value: 2,
                title: 'نزولی',
                onPressed: (value) {},
              ),
              const Spacer(),
            ],
          ),
          const Spacer(),
          U.Button(
            title: 'اعمال فیلتر',
            onPressed: () {},
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
