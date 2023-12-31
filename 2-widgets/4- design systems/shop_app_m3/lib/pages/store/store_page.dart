import 'package:flutter/material.dart';
import 'package:shop_app_m3/models/product.dart';
import 'package:shop_app_m3/models/shop_item.dart';
import 'package:shop_app_m3/pages/store/product_card.dart';

class StorePage extends StatefulWidget {
//
  final List<Product> products;

  final List<Product> favorites;

  final List<ShopItem> shopItems;

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
    required this.shopItems,
  });

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            //witeSpace
            const SizedBox(height: 15),
            // search bar
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search Here',
                    contentPadding: const EdgeInsets.only(left: 80),
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            //witeSpace
            const SizedBox(height: 30),
            // Exclusive Offers
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Text(
                    'Exclusive Offers',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            //witeSpace
            const SizedBox(height: 20),
            //Exclusive Offers listview
            SizedBox(
              height: 320,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                children: widget.products
                    .expand(
                      (element) => [
                        const SizedBox(width: 8),
                        ProductCard(
                          product: element,
                          favorites: widget.favorites,
                          onFavoritePressed: widget.onFavoriatePressed,
                          shopItems: widget.shopItems,
                          onAddtoShopCartPressed: widget.onAddtoShopCartPressed,
                          onRemovefromShopCartPressed:
                              widget.onRemovefromShopCartPressed,
                        ),
                        if (element == widget.products.last)
                          const SizedBox(width: 8),
                      ],
                    )
                    .toList(),
              ),
            ),
            //witeSpace
            const SizedBox(height: 30),
            //BestPrice
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Text(
                    'Best Sellers',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            //witeSpace
            const SizedBox(height: 20),
            //Best Sellers listview
            SizedBox(
              height: 350,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                children: widget.products.reversed
                    .expand(
                      (element) => [
                        const SizedBox(width: 8),
                        ProductCard(
                          product: element,
                          favorites: widget.favorites,
                          shopItems: widget.shopItems,
                          onFavoritePressed: widget.onFavoriatePressed,
                          onAddtoShopCartPressed: widget.onAddtoShopCartPressed,
                          onRemovefromShopCartPressed:
                              widget.onRemovefromShopCartPressed,
                        ),
                        if (element == widget.products.last)
                          const SizedBox(width: 8),
                      ],
                    )
                    .toList(),
              ),
            ),
            //witeSpace
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
