import 'package:flutter/material.dart';
import 'package:shop_app_m3/models/shop_cart.dart';
import 'package:shop_app_m3/pages/shop_cart/shop_item_card.dart';

import '../../models/product.dart';

class CartPage extends StatefulWidget {
//
  final List<Product> products;

  final ShopCart shopCard;

  final List<Product> favorites;

  final void Function(Product product) onFavoriatePressed;

  final void Function(Product product) onAddtoShopCartPressed;

  final void Function(Product product) onRemovefromShopCartPressed;

  const CartPage({
    super.key,
    required this.shopCard,
    required this.favorites,
    required this.onFavoriatePressed,
    required this.onAddtoShopCartPressed,
    required this.products,
    required this.onRemovefromShopCartPressed,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: widget.shopCard.shopItems.isEmpty
          ? Center(
              child: SizedBox(
                width: 400,
                child: Image.asset(
                  'assets/imgs/vectors/empty_cart.png',
                  fit: BoxFit.fill,
                ),
              ),
            )
          : SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 8),
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
                          onAddtoShopCardPressed: widget.onAddtoShopCartPressed,
                          onRemovetoShopCardPressed:
                              widget.onRemovefromShopCartPressed,
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
