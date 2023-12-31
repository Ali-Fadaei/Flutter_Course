import 'package:flutter/material.dart';
import 'package:shop_app_navigator/domains/store_repository/models/category.dart';
import 'package:shop_app_navigator/modules/category/category_page.dart';
// import 'package:shop_app_routing/modules/categories/category/category_page.dart';

import 'package:shop_app_navigator/ui_kit/ui_kit.dart' as U;

class CategoryCard extends StatelessWidget {
//
  final Category category;

  const CategoryCard({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) {
        //       return CategoryPage(categoryId: category.id);
        //     },
        //   ),
        // );
        Navigator.of(context).pushNamed(
          CategoryPage.route,
          arguments: category.id,
        );
      },
      child: Container(
        width: 200,
        height: 300,
        decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.circular(U.Theme.radius),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 150,
              height: 150,
              child: Image.asset(
                category.image,
                fit: BoxFit.contain,
              ),
            ),
            U.Text(
              category.title,
              size: U.TextSize.lg,
              weight: U.TextWeight.medium,
            ),
          ],
        ),
      ),
    );
  }
}
