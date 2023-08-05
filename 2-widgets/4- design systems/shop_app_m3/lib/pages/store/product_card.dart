import 'package:flutter/material.dart';
import 'package:shop_app_m3/models/product.dart';
import 'package:shop_app_m3/models/shop_cart.dart';
import 'package:shop_app_m3/pages/store/product_btms.dart';

class ProductCard extends StatelessWidget {
//
  final Product product;

  final ShopCart shopCart;

  final List<Product> favorites;

  final void Function(Product) onFavoritePressed;

  final void Function(Product product) onAddtoShopCartPressed;

  final void Function(Product product) onRemovetoShopCartPressed;

  const ProductCard({
    super.key,
    required this.product,
    required this.favorites,
    required this.shopCart,
    required this.onFavoritePressed,
    required this.onAddtoShopCartPressed,
    required this.onRemovetoShopCartPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ProductBottomSheet.show(
        context,
        product: product,
        favorites: favorites,
        shopCart: shopCart,
        onFavoritePressed: onFavoritePressed,
        onAddtoShopCartPressed: onAddtoShopCartPressed,
        onRemovefromShopCartPressed: onRemovetoShopCartPressed,
      ),
      child: SizedBox(
        width: 180,
        height: 350,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(product.image),
                SizedBox(height: 15),
                Text(
                  product.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'rating: ${product.rating}',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
                SizedBox(height: 20),
                Spacer(),
                Row(
                  children: [
                    IconButton.filledTonal(
                      icon: Icon(Icons.add),
                      onPressed: () => onAddtoShopCartPressed(product),
                    ),
                    Spacer(),
                    Text(
                      '\$${product.price}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
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
