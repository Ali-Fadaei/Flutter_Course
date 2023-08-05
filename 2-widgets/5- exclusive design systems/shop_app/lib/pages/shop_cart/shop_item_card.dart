import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/models/shop_cart.dart';
import 'package:shop_app/pages/store/product_btms.dart';

import 'package:shop_app/ui_kit/ui_kit.dart' as U;

class ShopCardItem extends StatelessWidget {
//
  final ShopItem shopItem;

  final List<Product> favorites;

  final ShopCart shopCard;

  final void Function(Product product) onFavoritePressed;

  final void Function(Product product) onAddtoShopCardPressed;

  final void Function(Product product) onRemovefromShopCardPressed;

  const ShopCardItem({
    super.key,
    required this.shopItem,
    required this.favorites,
    required this.onFavoritePressed,
    required this.onAddtoShopCardPressed,
    required this.onRemovefromShopCardPressed,
    required this.shopCard,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ProductBottomSheet.show(
        context,
        product: shopItem.product,
        favorites: favorites,
        shopCart: shopCard,
        onFavoritePressed: onFavoritePressed,
        onAddtoShopCartPressed: onAddtoShopCardPressed,
        onRemovetoShopCartPressed: onRemovefromShopCardPressed,
      ),
      child: U.Card(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            SizedBox(
              width: 120,
              child: U.Image(path: shopItem.product.image),
            ),
            SizedBox(width: 15),
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
            Spacer(),
            Column(
              children: [
                U.Text(
                  '${shopItem.product.price * shopItem.count} تومان',
                  size: U.TextSize.lg,
                  weight: U.TextWeight.bold,
                ),
                SizedBox(height: 8),
                U.Counter(
                  count: shopItem.count,
                  onIncrementer: () => onAddtoShopCardPressed(shopItem.product),
                  onDecrementer: () =>
                      onRemovefromShopCardPressed(shopItem.product),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
