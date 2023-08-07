import 'package:flutter/material.dart';
import 'package:shop_app_uikit/models/product.dart';
import 'package:shop_app_uikit/models/shop_item.dart';
import 'package:shop_app_uikit/pages/favorites/favorites_card.dart';

import 'package:shop_app_uikit/ui_kit/ui_kit.dart' as U;

class FavoritesPage extends StatelessWidget {
//
  final List<Product> products;

  final List<Product> favorites;

  final List<ShopItem> shopItems;

  final void Function(Product product) onFavoritePressed;

  final void Function(Product product) onAddtoShopCartPressed;

  final void Function(Product product) onRemovefromShopCartPressed;

  const FavoritesPage({
    super.key,
    required this.products,
    required this.favorites,
    required this.shopItems,
    required this.onFavoritePressed,
    required this.onAddtoShopCartPressed,
    required this.onRemovefromShopCartPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: favorites.isEmpty
          ? const Center(
              child: SizedBox(
                width: 400,
                child: U.Image(path: 'assets/imgs/vectors/empty_fav.png'),
              ),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: favorites
                    .expand(
                      (element) => [
                        FavoritesCard(
                          product: element,
                          favorites: favorites,
                          shopItems: shopItems,
                          onFavoriatePressed: onFavoritePressed,
                          onAddtoShopCartPressed: onAddtoShopCartPressed,
                          onRemovefromShopCartPressed:
                              onRemovefromShopCartPressed,
                        ),
                        const SizedBox(height: 15)
                      ],
                    )
                    .toList(),
              ),
            ),
    );
  }
}
