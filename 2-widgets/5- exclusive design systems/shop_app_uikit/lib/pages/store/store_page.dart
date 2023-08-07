import 'package:flutter/material.dart';
import 'package:shop_app_uikit/models/product.dart';
import 'package:shop_app_uikit/models/shop_item.dart';
import 'package:shop_app_uikit/pages/store/product_card.dart';
import 'package:shop_app_uikit/ui_kit/ui_kit.dart' as U;

class StorePage extends StatefulWidget {
//
  final List<Product> products;

  final List<Product> favorites;

  final List<ShopItem> shopItems;

  final void Function(Product) onFavoritePressed;

  final void Function(Product product) onAddtoShopCartPressed;

  final void Function(Product product) onRemovefromShopCartPressed;

  const StorePage({
    super.key,
    this.products = const [],
    this.favorites = const [],
    required this.shopItems,
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
          const SizedBox(height: 15),
          // search bar
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
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
          const SizedBox(height: 30),
          // Exclusive Offers
          const Padding(
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
          const SizedBox(height: 20),
          //products listview
          SizedBox(
            height: 350,
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
                        onFavoritePressed: widget.onFavoritePressed,
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
          //Best Sellers
          const Padding(
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
                        onFavoritePressed: widget.onFavoritePressed,
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
    );
  }
}
