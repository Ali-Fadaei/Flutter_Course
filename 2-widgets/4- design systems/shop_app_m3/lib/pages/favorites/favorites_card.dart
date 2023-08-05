import 'package:flutter/material.dart';
import 'package:shop_app_m3/models/product.dart';
import 'package:shop_app_m3/models/shop_cart.dart';
import '../store/product_btms.dart';

class FavoritesCard extends StatelessWidget {
//
  final Product product;

  final ShopCart shopCard;

  final List<Product> favorites;

  final void Function(Product product) onFavoritePressed;

  final void Function(Product product) onAddtoShopCardPressed;

  final void Function(Product product) onRemovetoShopCardPressed;

  const FavoritesCard({
    super.key,
    required this.product,
    required this.favorites,
    required this.onFavoritePressed,
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
        onFavoritePressed: onFavoritePressed,
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
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    product.category.title,
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                  Text(
                    '\$${product.price}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                ],
              ),
              Spacer(),
              IconButton(
                onPressed: () => onFavoritePressed(product),
                icon: Icon(Icons.favorite),
              )
            ],
          ),
        ),
      ),
    );
  }
}
