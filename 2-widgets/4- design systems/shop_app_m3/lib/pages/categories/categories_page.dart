import 'package:flutter/material.dart';
import 'package:shop_app_m3/models/category.dart';
import 'package:shop_app_m3/pages/categories/categories_card.dart';

class CategoriesPage extends StatelessWidget {
//
  final List<Category> categories;

  const CategoriesPage({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return SizedBox.expand(
      child: GridView.count(
        crossAxisCount: (screenWidth / 180).floor(),
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 2 / 3,
        padding: EdgeInsets.symmetric(horizontal: 15),
        children: categories.map((e) => CategoryCard(category: e)).toList(),
      ),
    );
  }
}
