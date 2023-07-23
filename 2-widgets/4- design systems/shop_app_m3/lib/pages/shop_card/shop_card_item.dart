import 'package:flutter/material.dart';
import 'package:shop_app_m3/models/product.dart';
import 'package:shop_app_m3/models/shop_card.dart';

import '../store/product_btms.dart';

class ShopCardItem extends StatelessWidget {
  final ShopCard shopCard;
  final Product product;

  final List<Product> favorites;

  final void Function(Product product) onFavoriatePressed;
  final void Function(Product product) onAddtoShopCardPressed;
  final void Function(Product product) onCounterIncremented;
  final void Function(Product product) onCounterDecremented;

  const ShopCardItem({
    super.key,
    required this.shopCard,
    required this.product,
    required this.favorites,
    required this.onFavoriatePressed,
    required this.onAddtoShopCardPressed,
    required this.onCounterIncremented,
    required this.onCounterDecremented,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ProductBottomSheet.show(
          context,
          product,
          favorites,
          onFavoriatePressed,
          onAddtoShopCardPressed),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 120,
                child: Image.asset(
                  product.image,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('${product.price}تومان',
                      textAlign: TextAlign.right),
                  Row(
                    children: [
                      IconButton.outlined(
                        onPressed: () =>
                          onCounterDecremented(product),
                        icon: Icon(Icons.remove),
                      ),
                      // Text(
                      //   " - ",
                      //   style: TextStyle(
                      //     fontSize: 20,
                      //   ),
                      // ),
                      SizedBox(width: 10),
                      Text(
                        product.count.toString(),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(width: 10),
                      IconButton.outlined(
                        onPressed: () =>
                          onCounterIncremented(product),
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
              Text(shopCard.deliveryAddress)
            ],
          ),
        ),
      ),
    );
  }
}
