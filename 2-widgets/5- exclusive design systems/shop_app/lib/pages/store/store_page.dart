import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/models/shop_cart.dart';
import 'package:shop_app/pages/store/product_card.dart';
import 'package:shop_app/ui_kit/ui_kit.dart' as U;

class StorePage extends StatefulWidget {
//
  final List<Product> products;

  final List<Product> favorites;

  final ShopCart shopCart;

  final void Function(Product) onFavoritePressed;

  final void Function(Product product) onAddtoShopCartPressed;

  final void Function(Product product) onRemovefromShopCartPressed;

  const StorePage({
    super.key,
    this.products = const [],
    this.favorites = const [],
    required this.shopCart,
    required this.onFavoritePressed,
    required this.onAddtoShopCartPressed,
    required this.onRemovefromShopCartPressed,
  });

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //witeSpace
          SizedBox(height: 15),
          // search bar
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1000),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: U.SearchInput(
                controller: TextEditingController(),
                hintText: 'جستجوی کنید',
                onSearch: (text) => {},
              ),
            ),
          ),
          //witeSpace
          SizedBox(height: 30),
          // Exclusive Offers
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                U.Text(
                  'پیشنهادهای ویژه',
                  color: U.Theme.secondary,
                  font: U.TextFont.bYekan,
                  size: U.TextSize.xxxl,
                  weight: U.TextWeight.bold,
                ),
                Spacer(),
                //todo: make styles
                U.Text(
                  "همه",
                  color: U.Theme.primary,
                  font: U.TextFont.iranSans,
                  size: U.TextSize.lg,
                  weight: U.TextWeight.medium,
                ),
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
                        onFavoritePressed: widget.onFavoritePressed,
                        shopCart: widget.shopCart,
                        onAddtoShopCartPressed: widget.onAddtoShopCartPressed,
                        onRemovefromShopCartPressed:
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
          //Best Sellers
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                U.Text(
                  'پرفروش‌ها',
                  color: U.Theme.secondary,
                  font: U.TextFont.bYekan,
                  size: U.TextSize.xxxl,
                  weight: U.TextWeight.bold,
                ),
                Spacer(),
                U.Text(
                  "همه",
                  color: U.Theme.primary,
                  font: U.TextFont.iranSans,
                  size: U.TextSize.lg,
                  weight: U.TextWeight.medium,
                ),
              ],
            ),
          ),
          //witeSpace
          SizedBox(height: 20),
          //Best Sellers listview
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
                        onFavoritePressed: widget.onFavoritePressed,
                        onAddtoShopCartPressed: widget.onAddtoShopCartPressed,
                        onRemovefromShopCartPressed:
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
    );
  }
}
