import 'package:flutter/material.dart';
import 'package:shop_app_m3/models/product.dart';

class ProductBottomSheet extends StatelessWidget {
//
  static show(BuildContext context, Product product) {
    var colorScheme = ColorScheme.fromSeed(seedColor: product.category.color);
    showBottomSheet(
      backgroundColor: colorScheme.surfaceVariant,
      context: context,
      builder: (context) {
        return ProductBottomSheet(product: product);
      },
    );
  }

  final Product product;

  const ProductBottomSheet({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    var colorCheme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 5,
            width: 60,
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: colorCheme.outline,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          SizedBox(
            height: 500,
            child: Image.asset(
              product.image,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(18),
            child: Column(
              children: [],
            ),
          )
        ],
      ),
    );
  }
}
