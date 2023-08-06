import 'package:flutter/material.dart';
import 'package:shop_app_m3/models/product.dart';
import 'package:shop_app_m3/models/shop_cart.dart';
import 'package:shop_app_m3/pages/store/product_btms.dart';

class ShopCardItem extends StatelessWidget {
//
  final ShopItem shopItem;

  final List<Product> favorites;

  final ShopCart shopCart;

  final void Function(Product product) onFavoritePressed;

  final void Function(Product product) onAddtoShopCartPressed;

  final void Function(Product product) onRemovefromShopCartPressed;

  const ShopCardItem({
    super.key,
    required this.shopItem,
    required this.favorites,
    required this.onFavoritePressed,
    required this.onAddtoShopCartPressed,
    required this.onRemovefromShopCartPressed,
    required this.shopCart,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ProductBottomSheet.show(
        context,
        product: shopItem.product,
        favorites: favorites,
        shopCart: shopCart,
        onFavoritePressed: onFavoritePressed,
        onAddtoShopCartPressed: onAddtoShopCartPressed,
        onRemovefromShopCartPressed: onRemovefromShopCartPressed,
      ),
      child: SizedBox(
        height: 140,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                SizedBox(
                  width: 120,
                  child: Image.asset(shopItem.product.image),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Text(
                      shopItem.product.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      shopItem.product.category.title,
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    const Spacer(),
                    Text(
                      '\$${shopItem.product.price * shopItem.count}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        IconButton.filledTonal(
                          onPressed: () =>
                              onRemovefromShopCartPressed(shopItem.product),
                          icon: const Icon(Icons.remove),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          shopItem.count.toString(),
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(width: 10),
                        IconButton.filledTonal(
                          onPressed: () =>
                              onAddtoShopCartPressed(shopItem.product),
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    ),
                    const Spacer(),
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
