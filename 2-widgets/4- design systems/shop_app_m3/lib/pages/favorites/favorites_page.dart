import 'package:flutter/material.dart';
import 'package:shop_app_m3/models/shop_cart.dart';

import '../../models/product.dart';
import 'favorites_card.dart';

class FavoritesPage extends StatelessWidget {
//
  final List<Product> products;

  final List<Product> favorites;

  final ShopCart shopCart;

  final void Function(Product product) onFavoriatePressed;

  final void Function(Product product) onAddtoShopCartPressed;

  final void Function(Product product) onRemovefromShopCartPressed;

  const FavoritesPage({
    super.key,
    required this.products,
    required this.favorites,
    required this.shopCart,
    required this.onFavoriatePressed,
    required this.onAddtoShopCartPressed,
    required this.onRemovefromShopCartPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: favorites.isEmpty
          ? Center(
              child: SizedBox(
                width: 400,
                child: Image.asset(
                  'assets/imgs/vectors/empty_fav.png',
                  fit: BoxFit.fill,
                ),
              ),
            )
          : SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 8),
              physics: BouncingScrollPhysics(),
              child: Column(
                children: favorites
                    .expand(
                      (element) => [
                        FavoritesCard(
                          product: element,
                          favorites: favorites,
                          shopCard: shopCart,
                          onFavoritePressed: onFavoriatePressed,
                          onAddtoShopCardPressed: onAddtoShopCartPressed,
                          onRemovetoShopCardPressed:
                              onRemovefromShopCartPressed,
                        ),
                        SizedBox(height: 15)
                      ],
                    )
                    .toList(),
              ),
            ),
    );
  }
}
