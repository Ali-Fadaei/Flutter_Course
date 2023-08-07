import 'package:flutter/material.dart';
import 'package:shop_app_m3/models/shop_item.dart';
import 'package:shop_app_m3/pages/shop_cart/shop_item_card.dart';

import '../../models/product.dart';

class CartPage extends StatefulWidget {
//
  final List<Product> products;

  final List<ShopItem> shopCart;

  final List<Product> favorites;

  final void Function(Product product) onFavoritePressed;

  final void Function(Product product) onAddtoShopCartPressed;

  final void Function(Product product) onRemovefromShopCartPressed;

  const CartPage({
    super.key,
    required this.shopCart,
    required this.favorites,
    required this.onFavoritePressed,
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
      child: widget.shopCart.isEmpty
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
              padding: const EdgeInsets.symmetric(horizontal: 8),
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: widget.shopCart
                    .expand(
                      (element) => [
                        ShopCardItem(
                          shopItem: element,
                          favorites: widget.favorites,
                          shopCart: widget.shopCart,
                          onFavoritePressed: widget.onFavoritePressed,
                          onAddtoShopCartPressed: widget.onAddtoShopCartPressed,
                          onRemovefromShopCartPressed:
                              widget.onRemovefromShopCartPressed,
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
