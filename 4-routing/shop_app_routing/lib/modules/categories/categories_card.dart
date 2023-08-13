import 'package:flutter/material.dart';
import 'package:shop_app_routing/domains/store_repository/models/category.dart';
import 'package:shop_app_routing/modules/category/category_page.dart';

import 'package:shop_app_routing/ui_kit/ui_kit.dart' as U;

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
      onTap: () => Navigator.of(context).pushNamed(
        CategoryPage.route,
        arguments: category.id,
      ),
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
              size: U.TextSize.xl,
              weight: U.TextWeight.medium,
            ),
          ],
        ),
      ),
    );
  }
}
