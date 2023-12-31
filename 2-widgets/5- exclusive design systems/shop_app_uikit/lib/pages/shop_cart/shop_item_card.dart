import 'package:flutter/material.dart';
import 'package:shop_app_uikit/models/product.dart';
import 'package:shop_app_uikit/models/shop_item.dart';
import 'package:shop_app_uikit/pages/store/product_btms.dart';

import 'package:shop_app_uikit/ui_kit/ui_kit.dart' as U;

class ShopCardItem extends StatelessWidget {
//
  final ShopItem shopItem;

  final List<Product> favorites;

  final List<ShopItem> shopItems;

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
      child: U.Card(
        height: 140,
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            SizedBox(
              width: 80,
              child: U.Image(path: shopItem.product.image),
            ),
            const SizedBox(width: 5),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  U.Text(
                    shopItem.product.title,
                    size: U.TextSize.md,
                    weight: U.TextWeight.bold,
                  ),
                  U.Text(
                    shopItem.product.category.title,
                    size: U.TextSize.sm,
                    color: U.Theme.outline2,
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const SizedBox(width: 5),
            Column(
              children: [
                const Spacer(),
                U.Text(
                  '${shopItem.product.price * shopItem.count} تومان',
                  size: U.TextSize.md,
                  weight: U.TextWeight.medium,
                ),
                const SizedBox(height: 8),
                U.Counter(
                  count: shopItem.count,
                  size: U.CounterSize.md,
                  onAddPressed: () => onAddtoShopCartPressed(shopItem.product),
                  onRemovePressed: () =>
                      onRemovefromShopCartPressed(shopItem.product),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
