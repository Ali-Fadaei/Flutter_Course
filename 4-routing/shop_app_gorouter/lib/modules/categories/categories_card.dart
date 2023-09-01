import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app_gorouter/domains/store_repository/models/category.dart';
import 'package:shop_app_gorouter/modules/category/category_page.dart';

import 'package:shop_app_gorouter/ui_kit/ui_kit.dart' as U;

class CategoryCard extends StatelessWidget {
//
  final Category category;

  final bool push;

  // final bool fromStore;

  const CategoryCard({
    super.key,
    this.push = false,
    // this.fromStore = false,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (push) {
          GoRouter.of(context).pushNamed(
            CategoryPage.route,
            pathParameters: {'id': category.id.toString()},
          );
        }
        // if (fromStore) {
        //   GoRouter.of(context).goNamed(
        //     StorePage.route + CategoryPage.route,
        //     pathParameters: {'id': category.id.toString()},
        //   );
        // }
        else {
          GoRouter.of(context).goNamed(
            CategoryPage.route,
            pathParameters: {'id': category.id.toString()},
          );
        }
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
