import 'package:flutter/material.dart';
import 'package:shop_app/models/shop_cart.dart';

import '../../models/product.dart';
import 'favorites_card.dart';

class FavoritesPage extends StatelessWidget {
//
  final List<Product> products;

  final List<Product> favorites;

  final ShopCart shopCart;

  final void Function(Product product) onFavoriatePressed;

  final void Function(Product product) onAddtoShopCartPressed;

  final void Function(Product product) onRemovetoShopCartPressed;

  const FavoritesPage({
    super.key,
    required this.products,
    required this.favorites,
    required this.onFavoriatePressed,
    required this.onAddtoShopCartPressed,
    required this.onRemovetoShopCartPressed,
    required this.shopCart,
  });

  @override
  Widget build(BuildContext context) {
    return favorites.isEmpty
        ? Center(
            child: SizedBox(
              width: 400,
              child: Image.asset(
                'assets/vectors/empty_fav.png',
                fit: BoxFit.fill,
              ),
            ),
          )
        : SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: favorites
                  .expand(
                    (element) => [
                      FavoritesCard(
                        product: element,
                        favorites: favorites,
                        shopCard: shopCart,
                        onFavoriatePressed: onFavoriatePressed,
                        onAddtoShopCardPressed: onAddtoShopCartPressed,
                        onRemovetoShopCardPressed: onRemovetoShopCartPressed,
                      ),
                      SizedBox(height: 15)
                    ],
                  )
                  .toList(),
            ),
          );
  }
}
