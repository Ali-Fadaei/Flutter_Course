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

  final void Function(Product product) onRemovetoShopCartPressed;

  const CartPage({
    super.key,
    required this.shopCard,
    required this.favorites,
    required this.onFavoriatePressed,
    required this.onAddtoShopCartPressed,
    required this.products,
    required this.onRemovetoShopCartPressed,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
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
                  onAddtoShopCardPressed: widget.onAddtoShopCartPressed,
                  onRemovetoShopCardPressed: widget.onRemovetoShopCartPressed,
                  product: element.product,
                ),
                SizedBox(height: 15)
              ],
            )
            .toList(),
      ),
    );
=======
    return widget.shopCard.shopItems.isEmpty
        ? Center(
            child: Container(
              width: 400,
              child: Image.asset(
                'assets/imgs/vectors/empty_cart.png',
                fit: BoxFit.fill,
              ),
            ),
          )
        : SingleChildScrollView(
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
                            widget.onRemovetoShopCartPressed,
                        product: element.product,
                      ),
                      SizedBox(height: 15)
                    ],
                  )
                  .toList(),
            ),
          );
>>>>>>> 3d1fc743488bd078c9b88eb7763132fb3b544e58
  }
}
