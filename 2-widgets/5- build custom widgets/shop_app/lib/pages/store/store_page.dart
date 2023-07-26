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

  final void Function(Product product) onAddtoShopCartPressed;

  final void Function(Product product) onRemovetoShopCartPressed;

  final void Function(Product) onFavoriatePressed;

  const StorePage({
    super.key,
    this.products = const [],
    this.favorites = const [],
    required this.onFavoriatePressed,
    required this.onAddtoShopCartPressed,
    required this.onRemovetoShopCartPressed,
    required this.shopCart,
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
          SizedBox(height: 25),

          /// search bar
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1000),
            child: U.SearchInput(
              controller: TextEditingController(),
              hintText: 'جستجوی کنید',
              onSearch: (text) => {},
            ),
            // child: U.SearchInput(
            //   controller: TextEditingController(),
            //   onSearch: (text) {},
            // ),
          ),

          // Container(
          //   color: Colors.white,
          //   child: TextField(
          //     enabled: false,
          //     decoration: InputDecoration(
          //       focusColor: Colors.red,
          //       hoverColor: Colors.red,
          //       filled: false,
          //       hintText: 'Search Here',
          //       prefixIcon: Padding(
          //         padding: const EdgeInsetsDirectional.only(start: 12),
          //         child: Icon(Icons.search, color: Colors.black),
          //       ),
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(15),
          //       ),
          //     ),
          //   ),
          // ),
          SizedBox(height: 50),

          /// Exclusive Offers
          Row(
            children: [
              U.Text(
                "پر فروش های هفته",
                color: U.Theme.secondary,
                font: U.TextFont.bYekan,
                size: U.TextSize.xxl,
                weight: U.TextWeight.normal,
              ),
              Spacer(),
              //todo: make styles
              U.Text(
                "همه",
                color: U.Theme.primary,
                font: U.TextFont.iranSans,
                size: U.TextSize.xl,
                weight: U.TextWeight.regular,
              ),
            ],
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 350,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              children: widget.products
                  .expand(
                    (element) => [
                      ProductCard(
                        product: element,
                        favorites: widget.favorites,
                        onFavoriatePressed: widget.onFavoriatePressed,
                        shopCart: widget.shopCart,
                        onAddtoShopCartPressed: widget.onAddtoShopCartPressed,
                        onRemovetoShopCartPressed:
                            widget.onRemovetoShopCartPressed,
                      ),
                      SizedBox(width: 8),
                    ],
                  )
                  .toList(),
            ),
          ),
          SizedBox(height: 20),

          /// Popular Options
          Row(
            children: [
              U.Text(
                "باکیفیت ترین ها",
                color: U.Theme.secondary,
                font: U.TextFont.bYekan,
                size: U.TextSize.xxl,
                weight: U.TextWeight.normal,
              ),
              Spacer(),
              U.Text(
                "همه",
                color: U.Theme.primary,
                font: U.TextFont.iranSans,
                size: U.TextSize.xl,
                weight: U.TextWeight.regular,
              ),
            ],
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 350,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              children: widget.products
                  .expand(
                    (element) => [
                      ProductCard(
                        product: element,
                        favorites: widget.favorites,
                        shopCart: widget.shopCart,
                        onFavoriatePressed: widget.onFavoriatePressed,
                        onAddtoShopCartPressed: widget.onAddtoShopCartPressed,
                        onRemovetoShopCartPressed:
                            widget.onRemovetoShopCartPressed,
                      ),
                      SizedBox(width: 8),
                    ],
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
