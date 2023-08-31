import 'package:flutter/material.dart';
import 'package:shop_app_m3/models/product.dart';
import 'package:shop_app_m3/models/shop_item.dart';
import 'package:shop_app_m3/pages/store/product_btms.dart';

class ShopItemCard extends StatelessWidget {
//
  final ShopItem shopItem;

  final List<Product> favorites;

  final List<ShopItem> shopItems;

  final void Function(Product product) onFavoritePressed;

  final void Function(Product product) onAddtoShopCartPressed;

  final void Function(Product product) onRemovefromShopCartPressed;

  const ShopItemCard({
    super.key,
    required this.shopItem,
    required this.favorites,
    required this.onFavoritePressed,
    required this.onAddtoShopCartPressed,
    required this.onRemovefromShopCartPressed,
    required this.shopItems,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ProductBottomSheet.show(
        context,
        product: shopItem.product,
        favorites: favorites,
        shopItems: shopItems,
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
                  width: 80,
                  child: Image.asset(shopItem.product.image),
                ),
                const SizedBox(width: 5),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Text(
                        shopItem.product.title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        shopItem.product.category.title,
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                Column(
                  children: [
                    const Spacer(),
                    Text(
                      '\$${shopItem.product.price * shopItem.count}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
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
