import 'package:flutter/material.dart';
import 'package:shop_app_m3/models/product.dart';
import 'package:shop_app_m3/models/shop_cart.dart';
import 'package:shop_app_m3/pages/store/product_card.dart';

class StorePage extends StatefulWidget {
//
  final List<Product> products;

  final List<Product> favorites;

  final ShopCart shopCart;

  final void Function(Product product) onAddtoShopCartPressed;

  final void Function(Product product) onRemovefromShopCartPressed;

  final void Function(Product) onFavoriatePressed;

  const StorePage({
    super.key,
    required this.products,
    required this.favorites,
    required this.onFavoriatePressed,
    required this.onAddtoShopCartPressed,
    required this.onRemovefromShopCartPressed,
    required this.shopCart,
  });

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            //witeSpace
            SizedBox(height: 15),
            // search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Here',
                  contentPadding: const EdgeInsets.only(left: 80),
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            //witeSpace
            SizedBox(height: 30),
            // Exclusive Offers
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Text(
                    'Exclusive Offers',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'all',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            //witeSpace
            SizedBox(height: 20),
            //products listview
            SizedBox(
              height: 350,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                children: widget.products
                    .expand(
                      (element) => [
                        SizedBox(width: 8),
                        ProductCard(
                          product: element,
                          favorites: widget.favorites,
                          onFavoritePressed: widget.onFavoriatePressed,
                          shopCart: widget.shopCart,
                          onAddtoShopCartPressed: widget.onAddtoShopCartPressed,
                          onRemovetoShopCartPressed:
                              widget.onRemovefromShopCartPressed,
                        ),
                        if (element == widget.products.last) SizedBox(width: 8),
                      ],
                    )
                    .toList(),
              ),
            ),
            //witeSpace
            SizedBox(height: 30),
            //BestPrice
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Text(
                    'BestPrice',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'all',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            //witeSpace
            SizedBox(height: 20),
            //products listview
            SizedBox(
              height: 350,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                children: widget.products.reversed
                    .expand(
                      (element) => [
                        SizedBox(width: 8),
                        ProductCard(
                          product: element,
                          favorites: widget.favorites,
                          shopCart: widget.shopCart,
                          onFavoritePressed: widget.onFavoriatePressed,
                          onAddtoShopCartPressed: widget.onAddtoShopCartPressed,
                          onRemovetoShopCartPressed:
                              widget.onRemovefromShopCartPressed,
                        ),
                        if (element == widget.products.last) SizedBox(width: 8),
                      ],
                    )
                    .toList(),
              ),
            ),
            //witeSpace
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
