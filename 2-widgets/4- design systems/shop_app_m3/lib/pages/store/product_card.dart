import 'package:flutter/material.dart';
import 'package:shop_app_m3/models/product.dart';
import 'package:shop_app_m3/pages/store/product_btms.dart';

class ProductCard extends StatelessWidget {
//
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ProductBottomSheet.show(context, product),
      child: SizedBox(
        width: 220,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.asset(product.image),
                SizedBox(height: 15),
                Text(product.title, textAlign: TextAlign.right),
                SizedBox(height: 5),
                Text('rating: ${product.rating}', textAlign: TextAlign.right),
                SizedBox(height: 20),
                Row(
                  children: [
                    FloatingActionButton(
                      onPressed: () {},
                      elevation: 2,
                      mini: true,
                      child: Icon(Icons.add),
                    ),
                    Spacer(),
                    Text(
                      '${product.price} tomans',
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
