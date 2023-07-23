import 'package:flutter/material.dart';
import 'package:shop_app_m3/models/product.dart';
import 'package:shop_app_m3/models/shop_card.dart';
import 'package:shop_app_m3/pages/store/product_btms.dart';

class ProductCard extends StatelessWidget {
//
  final Product product;

  final ShopCard shopCard;

  final List<Product> favorites;

  final void Function(Product product) onAddtoShopCardPressed;

  final void Function(Product product) onRemovetoShopCardPressed;

  final void Function(Product) onFavoriatePressed;

  const ProductCard({
    super.key,
    required this.product,
    required this.favorites,
    required this.shopCard,
    required this.onFavoriatePressed,
    required this.onAddtoShopCardPressed,
    required this.onRemovetoShopCardPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ProductBottomSheet.show(
        context,
        product,
        favorites,
        shopCard,
        onFavoriatePressed,
        onAddtoShopCardPressed,
        onRemovetoShopCardPressed,
      ),
      child: SizedBox(
        width: 220,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(17.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(product.image),
                SizedBox(height: 15),
                Text(product.title, textAlign: TextAlign.right),
                SizedBox(height: 5),
                Text('rating: ${product.rating}', textAlign: TextAlign.right),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      '${product.price} tomans',
                      style: TextStyle(fontSize: 14),
                    ),
                    Spacer(),
                    FloatingActionButton(
                      onPressed: () {
                        onAddtoShopCardPressed(product);
                      },
                      elevation: 2,
                      mini: true,
                      child: Icon(Icons.add),
                    ),
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
