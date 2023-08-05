import 'package:flutter/material.dart';
import 'package:shop_app_m3/models/product.dart';
import 'package:shop_app_m3/models/shop_cart.dart';

import '../store/product_btms.dart';

class ShopCardItem extends StatelessWidget {
//
  final ShopItem shopItem;

  final List<Product> favorites;

  final ShopCart shopCard;

  final void Function(Product product) onFavoriatePressed;

  final void Function(Product product) onAddtoShopCardPressed;

  final void Function(Product product) onRemovetoShopCardPressed;

  const ShopCardItem({
    super.key,
    required this.shopItem,
    required this.favorites,
    required this.onFavoriatePressed,
    required this.onAddtoShopCardPressed,
    required this.onRemovetoShopCardPressed,
    required this.shopCard,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ProductBottomSheet.show(
        context,
        product: shopItem.product,
        favorites: favorites,
        shopCart: shopCard,
        onFavoriatePressed: onFavoriatePressed,
        onAddtoShopCartPressed: onAddtoShopCardPressed,
        onRemovefromShopCartPressed: onRemovetoShopCardPressed,
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              SizedBox(
                width: 120,
                child: Image.asset(
                  shopItem.product.image,
                ),
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shopItem.product.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    shopItem.product.category.title,
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      IconButton.filledTonal(
                        onPressed: () =>
                            onRemovetoShopCardPressed(shopItem.product),
                        icon: Icon(Icons.remove),
                      ),
                      SizedBox(width: 10),
                      Text(
                        shopItem.count.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(width: 10),
                      IconButton.filledTonal(
                        onPressed: () =>
                            onAddtoShopCardPressed(shopItem.product),
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Text(
                '\$${shopItem.product.price * shopItem.count}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
