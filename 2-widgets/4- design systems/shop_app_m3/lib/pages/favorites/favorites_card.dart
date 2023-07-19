import 'package:flutter/material.dart';
import 'package:shop_app_m3/models/product.dart';

class FavoritesCard extends StatelessWidget {
//
  final Product product;

  final List<Product> favorites;

  final void Function(Product) onFavoriatePressed;
  // final void Function(Product product) onDisLikePressed;


  const FavoritesCard({
    super.key,
    required this.product,
    required this.favorites,
    required this.onFavoriatePressed,
    //  required this.onDisLikePressed,
    
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
                )),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text('${product.price}تومان', textAlign: TextAlign.right),
              ],
            ),
            Spacer(),
            Icon(Icons.favorite)
          ],
        ),
      ),
    );
  }
}
