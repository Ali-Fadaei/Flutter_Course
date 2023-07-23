import 'package:flutter/material.dart';
import 'package:shop_app_m3/models/product.dart';
import 'package:shop_app_m3/models/shop_card.dart';

import '../store/product_btms.dart';

class ShopCardItem extends StatelessWidget {
//
  final ShopItem shopItem;

  final List<Product> favorites;

  final Product product;

  final ShopCard shopCard;

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
    required this.product,
    required this.shopCard,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ProductBottomSheet.show(
        context,
        shopItem.product,
        favorites,
        shopCard,
        onFavoriatePressed,
        onAddtoShopCardPressed,
        onRemovetoShopCardPressed,
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              width: 120,
              child: Image.asset(
                shopItem.product.image,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shopItem.product.title,
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    IconButton.outlined(
                      onPressed: () => onRemovetoShopCardPressed(product),
                      icon: Icon(Icons.remove),
                    ),

                    SizedBox(width: 10),
                    Text(
                      shopItem.count.toString(),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(width: 10),
                    IconButton.outlined(
                      onPressed: () => onAddtoShopCardPressed(product),
                      icon: Icon(Icons.add),
                    ),
                    // Text(
                    // " + ",
                    // style: TextStyle(
                    // fontSize: 20,
                    // ),
                    // )
                  ],
                ),
              ],
            ),
            Spacer(),
            Text(
              '${shopItem.product.price * shopItem.count}تومان',
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ]),
        ),
      ),
    );
  }
}
