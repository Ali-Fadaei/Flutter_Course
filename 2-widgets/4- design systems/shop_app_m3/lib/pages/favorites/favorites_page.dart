import 'package:flutter/material.dart';
import 'package:shop_app_m3/models/shop_card.dart';

import '../../models/product.dart';
import 'favorites_card.dart';

class FavoritesPage extends StatefulWidget {
//
  final List<Product> products;

  final List<Product> favorites;

  final ShopCard shopCard;

  final void Function(Product product) onFavoriatePressed;

  final void Function(Product product) onAddtoShopCardPressed;

  final void Function(Product product) onRemovetoShopCardPressed;

  const FavoritesPage({
    super.key,
    required this.products,
    required this.favorites,
    required this.onFavoriatePressed,
    required this.onAddtoShopCardPressed,
    required this.onRemovetoShopCardPressed,
    required this.shopCard,
  });

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
//
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: widget.favorites
            .expand(
              (element) => [
                FavoritesCard(
                  product: element,
                  favorites: widget.favorites,
                  shopCard: widget.shopCard,
                  onFavoriatePressed: widget.onFavoriatePressed,
                  onAddtoShopCardPressed: widget.onAddtoShopCardPressed,
                  onRemovetoShopCardPressed: widget.onRemovetoShopCardPressed,
                ),
                SizedBox(height: 15)
              ],
            )
            .toList(),
      ),
    );
  }
}
