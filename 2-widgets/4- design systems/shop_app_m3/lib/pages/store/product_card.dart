import 'package:flutter/material.dart';
import 'package:shop_app_m3/models/product.dart';
import 'package:shop_app_m3/models/shop_item.dart';
import 'package:shop_app_m3/pages/store/product_btms.dart';

class ProductCard extends StatelessWidget {
//
  final Product product;

  final List<ShopItem> shopItems;

  final List<Product> favorites;

  final void Function(Product) onFavoritePressed;

  final void Function(Product product) onAddtoShopCartPressed;

  final void Function(Product product) onRemovefromShopCartPressed;

  const ProductCard({
    super.key,
    required this.product,
    required this.favorites,
    required this.shopItems,
    required this.onFavoritePressed,
    required this.onAddtoShopCartPressed,
    required this.onRemovefromShopCartPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ProductBottomSheet.show(
        context,
        product: product,
        favorites: favorites,
        shopItems: shopItems,
        onFavoritePressed: onFavoritePressed,
        onAddtoShopCartPressed: onAddtoShopCartPressed,
        onRemovefromShopCartPressed: onRemovefromShopCartPressed,
      ),
      child: SizedBox(
        width: 185,
        height: 350,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(product.image),
                const SizedBox(height: 15),
                Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      'rating: ${product.rating}',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                    Icon(
                      Icons.star,
                      size: 14,
                      color: Colors.amber.shade700,
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    IconButton.filledTonal(
                      icon: const Icon(Icons.add),
                      onPressed: () => onAddtoShopCartPressed(product),
                    ),
                    const Spacer(),
                    Text(
                      '\$${product.price}',
                      style: const TextStyle(
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
