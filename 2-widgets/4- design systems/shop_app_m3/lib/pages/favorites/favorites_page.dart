import 'package:flutter/material.dart';

import '../../main.dart';
import '../../models/product.dart';
import 'favorites_card.dart';

class FavoritesPage extends StatefulWidget {
//
  final List<Product> products;
  final List<Product> favorites;
  final void Function(Product) onFavoriatePressed;
  // final void Function(Product product) onDisLikePressed;

  const FavoritesPage(
      {super.key,
      required this.products,
      required this.favorites,
      required this.onFavoriatePressed,
      });

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
          children: widget.favorites
              .expand(
                (element) => [
                  FavoritesCard(
                      product: element,
                      favorites: widget.favorites,
                      onFavoriatePressed: widget.onFavoriatePressed,
                      // onDisLikePressed: widget.onDisLikePressed,
                      ),
                  SizedBox(
                    height: 15,
                  )
                ],
              )
              .toList()),
    );
  }
}
