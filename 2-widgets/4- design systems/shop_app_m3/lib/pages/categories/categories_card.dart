import 'package:flutter/material.dart';
import 'package:shop_app_m3/models/category.dart';

class CategoryCard extends StatelessWidget {
//
  final Category category;

  const CategoryCard({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 300,
      child: Card(
        surfaceTintColor: category.color,
        elevation: 12,
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
            Text(
              category.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
