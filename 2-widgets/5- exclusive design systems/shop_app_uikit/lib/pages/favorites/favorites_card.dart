import 'package:flutter/material.dart';
import 'package:shop_app_uikit/models/product.dart';
import 'package:shop_app_uikit/models/shop_item.dart';
import 'package:shop_app_uikit/pages/store/product_btms.dart';

import 'package:shop_app_uikit/ui_kit/ui_kit.dart' as U;

class FavoritesCard extends StatelessWidget {
//
  final Product product;

  final List<ShopItem> shopItems;

  final List<Product> favorites;

  final void Function(Product product) onFavoriatePressed;

  final void Function(Product product) onAddtoShopCartPressed;

  final void Function(Product product) onRemovefromShopCartPressed;

  const FavoritesCard({
    super.key,
    required this.product,
    required this.favorites,
    required this.shopItems,
    required this.onFavoriatePressed,
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
        onFavoritePressed: onFavoriatePressed,
        onAddtoShopCartPressed: onAddtoShopCartPressed,
        onRemovefromShopCartPressed: onRemovefromShopCartPressed,
      ),
      child: U.Card(
        height: 140,
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: U.Image(path: product.image),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  U.Text(
                    product.title,
                    size: U.TextSize.md,
                    weight: U.TextWeight.bold,
                  ),
                  U.Text(
                    product.category.title,
                    size: U.TextSize.sm,
                    color: U.Theme.outline2,
                  ),
                  U.Text(
                    '${product.price} تومان',
                    size: U.TextSize.md,
                    color: U.Theme.outline2,
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const SizedBox(width: 5),
            IconButton(
              onPressed: () => onFavoriatePressed(product),
              icon: const Icon(
                Icons.favorite,
                color: U.Theme.primary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
