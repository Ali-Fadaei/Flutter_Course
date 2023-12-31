import 'package:flutter/material.dart';
import 'package:shop_app_uikit/models/product.dart';
import 'package:shop_app_uikit/models/shop_item.dart';
import 'package:shop_app_uikit/pages/shop_cart/shop_item_card.dart';

import 'package:shop_app_uikit/ui_kit/ui_kit.dart' as U;

class CartPage extends StatefulWidget {
//
  final List<Product> products;

  final List<ShopItem> shopItems;

  final List<Product> favorites;

  final void Function(Product product) onFavoritePressed;

  final void Function(Product product) onAddtoShopCartPressed;

  final void Function(Product product) onRemovefromShopCartPressed;

  const CartPage({
    super.key,
    required this.shopItems,
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
      child: widget.shopItems.isEmpty
          ? const Center(
              child: SizedBox(
                width: 400,
                child: U.Image(path: U.Images.cartEmpty),
              ),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: widget.shopItems
                    .expand(
                      (element) => [
                        ShopCardItem(
                          shopItem: element,
                          favorites: widget.favorites,
                          shopItems: widget.shopItems,
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
