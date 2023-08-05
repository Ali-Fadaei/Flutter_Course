import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/models/shop_cart.dart';
import 'package:shop_app/pages/store/product_btms.dart';

import 'package:shop_app/ui_kit/ui_kit.dart' as U;

class FavoritesCard extends StatelessWidget {
//
  final Product product;

  final ShopCart shopCard;

  final List<Product> favorites;

  final void Function(Product product) onFavoriatePressed;

  final void Function(Product product) onAddtoShopCardPressed;

  final void Function(Product product) onRemovetoShopCardPressed;

  const FavoritesCard({
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
        product: product,
        favorites: favorites,
        shopCart: shopCard,
        onFavoritePressed: onFavoriatePressed,
        onAddtoShopCartPressed: onAddtoShopCardPressed,
        onRemovetoShopCartPressed: onRemovetoShopCardPressed,
      ),
      child: U.Card(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            SizedBox(
              width: 120,
              child: U.Image(path: product.image),
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                U.Text(
                  product.title,
                  size: U.TextSize.lg,
                  weight: U.TextWeight.bold,
                ),
                U.Text(
                  product.category.title,
                  size: U.TextSize.md,
                  color: U.Theme.outline2,
                ),
                U.Text(
                  '${product.price} تومان',
                  size: U.TextSize.md,
                  color: U.Theme.outline2,
                ),
              ],
            ),
            Spacer(),
            IconButton(
              onPressed: () => onFavoriatePressed(product),
              icon: Icon(Icons.favorite),
            )
          ],
        ),
      ),
    );
  }
}
