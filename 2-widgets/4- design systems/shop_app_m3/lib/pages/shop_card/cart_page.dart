import 'package:flutter/material.dart';
import 'package:shop_app_m3/models/shop_card.dart';
import 'package:shop_app_m3/pages/shop_card/shop_card_item.dart';

import '../../models/product.dart';

class CartPage extends StatefulWidget {
//
  final List<Product> products;

  final ShopCard shopCard;

  final List<Product> favorites;

  final void Function(Product product) onFavoriatePressed;

  final void Function(Product product) onAddtoShopCardPressed;

  final void Function(Product product) onRemovetoShopCardPressed;

  const CartPage({
    super.key,
    required this.shopCard,
    required this.favorites,
    required this.onFavoriatePressed,
    required this.onAddtoShopCardPressed,
    required this.products,
    required this.onRemovetoShopCardPressed,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: widget.shopCard.shopItems
            .expand(
              (element) => [
                ShopCardItem(
                  shopItem: element,
                  favorites: widget.favorites,
                  shopCard: widget.shopCard,
                  onFavoriatePressed: widget.onFavoriatePressed,
                  onAddtoShopCardPressed: widget.onAddtoShopCardPressed,
                  onRemovetoShopCardPressed: widget.onRemovetoShopCardPressed,
                  product: element.product,
                ),
                SizedBox(height: 15)
              ],
            )
            .toList(),
      ),
    );
  }
}
