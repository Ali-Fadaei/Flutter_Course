import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/models/shop_cart.dart';
import '../store/product_btms.dart';

class FavoritesCard extends StatelessWidget {
//
  final Product product;

  final ShopCart shopCard;

  final List<Product> favorites;

  final void Function(Product product) onFavoriatePressed;

  final void Function(Product product) onAddtoShopCardPressed;

  final void Function(Product product) onRemovetoShopCardPressed;

  const FavoritesCard({
    super.key,
    required this.product,
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
        product: product,
        favorites: favorites,
        shopCart: shopCard,
        onFavoriatePressed: onFavoriatePressed,
        onAddtoShopCartPressed: onAddtoShopCardPressed,
        onRemovetoShopCartPressed: onRemovetoShopCardPressed,
      ),
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
                    style: TextStyle(
                      color: Color(0xFF181725),
                      fontSize: 16,
                      fontFamily: 'IRANSans',
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.10,
                    ),
                  ),
                  Text(
                    '${product.price}تومان',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF7C7C7C),
                      fontSize: 14,
                      fontFamily: 'IRANSans',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Spacer(),
              IconButton(
                onPressed: () => onFavoriatePressed(product),
                icon: Icon(Icons.favorite),
              )
            ],
          ),
        ),
      ),
    );
  }
}
