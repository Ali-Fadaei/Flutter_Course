import 'package:flutter/material.dart';
import 'package:shop_app_uikit/models/product.dart';
import 'package:shop_app_uikit/models/shop_cart.dart';
import 'package:shop_app_uikit/ui_kit/ui_kit.dart' as U;

class ProductBottomSheet extends StatefulWidget {
//
  static show(
    BuildContext context, {
    required Product product,
    required ShopCart shopCart,
    required List<Product> favorites,
    required void Function(Product product) onFavoritePressed,
    required void Function(Product product) onAddtoShopCartPressed,
    required void Function(Product product) onRemovefromShopCartPressed,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxWidth: 1024,
        maxHeight: MediaQuery.of(context).size.height * 0.90,
      ),
      builder: (context) {
        return ProductBottomSheet(
          product: product,
          shopCart: shopCart,
          favorits: favorites,
          onFavoritePressed: onFavoritePressed,
          onAddtoShopCartPressed: onAddtoShopCartPressed,
          onRemovefromShopCartPressed: onRemovefromShopCartPressed,
        );
      },
    );
  }

  final Product product;

  final List<Product> favorits;

  final ShopCart shopCart;

  final void Function(Product product) onFavoritePressed;

  final void Function(Product product) onAddtoShopCartPressed;

  final void Function(Product product) onRemovefromShopCartPressed;

  const ProductBottomSheet({
    super.key,
    required this.product,
    required this.favorits,
    required this.shopCart,
    required this.onFavoritePressed,
    required this.onAddtoShopCartPressed,
    required this.onRemovefromShopCartPressed,
  });

  @override
  State<ProductBottomSheet> createState() => ProductBottomSheetState();
}

class ProductBottomSheetState extends State<ProductBottomSheet> {
//
  var count = 0;

  var isFav = false;

  void _onAddtoShopCartPressed() {
    if (count < 10) {
      widget.onAddtoShopCartPressed(widget.product);
      setState(() {
        count++;
      });
    }
  }

  void _onRemovefromShopCartPressed() {
    if (count > 0) {
      widget.onRemovefromShopCartPressed(widget.product);
      setState(() {
        count--;
      });
    }
  }

  void _onFavoriatePressed() {
    widget.onFavoritePressed(widget.product);
    setState(() {
      isFav = !isFav;
    });
  }

  @override
  void initState() {
    for (var element in widget.shopCart.shopItems) {
      if (element.product == widget.product) {
        count = element.count;
      }
    }
    isFav = widget.favorits.contains(widget.product);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: U.Theme.background,
        borderRadius: BorderRadius.circular(U.Theme.radius),
      ),
      child: Column(
        children: [
          Container(
            height: 5,
            width: 70,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: U.Theme.outline2,
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 400,
                        child: U.Image(path: widget.product.image),
                      ),
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              U.Text(
                                widget.product.title,
                                size: U.TextSize.xxl,
                                weight: U.TextWeight.bold,
                              ),
                              U.Text(widget.product.category.title)
                            ],
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: _onFavoriatePressed,
                            icon: Icon(
                              isFav
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: isFav
                                  ? U.Theme.primary
                                  : U.Theme.onBackground,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                        child: U.Divider.horizontal(),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                const U.Text(
                                  "امتیاز: ",
                                  size: U.TextSize.xl,
                                  weight: U.TextWeight.bold,
                                ),
                                const Spacer(),
                                U.Text(
                                  "${widget.product.rating}",
                                  size: U.TextSize.xl,
                                  weight: U.TextWeight.bold,
                                ),
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                            child: U.Divider.vertical(),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                const U.Text(
                                  "قیمت: ",
                                  size: U.TextSize.xl,
                                  weight: U.TextWeight.bold,
                                ),
                                const Spacer(),
                                U.Text(
                                  count == 0
                                      ? '${widget.product.price} تومان'
                                      : '${widget.product.price * count} تومان',
                                  size: U.TextSize.xl,
                                  weight: U.TextWeight.bold,
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                        child: U.Divider.horizontal(),
                      ),
                      // Product Details
                      Row(
                        children: [
                          const U.Text(
                            'توضیحات محصول',
                            size: U.TextSize.xl,
                            weight: U.TextWeight.bold,
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: U.Theme.onBackground,
                            ),
                          )
                        ],
                      ),
                      U.Text(widget.product.description),
                      const SizedBox(height: 80),
                    ],
                  ),
                ),
                Align(
                  alignment: const Alignment(0, 0.95),
                  child: SizedBox(
                    width: 400,
                    child: count == 0
                        ? U.Button(
                            title: 'افزودن به سبدخرید',
                            size: U.ButtonSize.lg,
                            onPressed: _onAddtoShopCartPressed,
                          )
                        : U.Counter(
                            count: count,
                            size: U.CounterSize.lg,
                            onIncrementer: _onAddtoShopCartPressed,
                            onDecrementer: _onRemovefromShopCartPressed,
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
