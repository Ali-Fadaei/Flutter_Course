import 'package:flutter/material.dart';
import 'package:shop_app_uikit/models/product.dart';
import 'package:shop_app_uikit/models/shop_cart.dart';
import 'package:shop_app_uikit/pages/store/product_btms.dart';

import 'package:shop_app_uikit/ui_kit/ui_kit.dart' as U;

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
      child: U.Card(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            SizedBox(
              width: 120,
              child: U.Image(path: shopItem.product.image),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                U.Text(
                  shopItem.product.title,
                  size: U.TextSize.xl,
                  weight: U.TextWeight.bold,
                ),
                U.Text(
                  shopItem.product.category.title,
                  size: U.TextSize.md,
                  color: U.Theme.outline2,
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                U.Text(
                  '${shopItem.product.price * shopItem.count} تومان',
                  size: U.TextSize.lg,
                  weight: U.TextWeight.bold,
                ),
                const SizedBox(height: 8),
                U.Counter(
                  count: shopItem.count,
                  onIncrementer: () => onAddtoShopCartPressed(shopItem.product),
                  onDecrementer: () =>
                      onRemovefromShopCartPressed(shopItem.product),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
