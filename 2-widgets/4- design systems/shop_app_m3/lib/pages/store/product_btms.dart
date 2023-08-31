import 'package:flutter/material.dart';
import 'package:shop_app_m3/models/product.dart';
import 'package:shop_app_m3/models/shop_item.dart';

class ProductBottomSheet extends StatefulWidget {
//
  static show(
    BuildContext context, {
    required Product product,
    required List<ShopItem> shopItems,
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
        maxHeight: MediaQuery.of(context).size.height * 0.80,
      ),
      builder: (context) {
        return ProductBottomSheet(
          product: product,
          shopItems: shopItems,
          favorites: favorites,
          onFavoritePressed: onFavoritePressed,
          onAddtoShopCardPressed: onAddtoShopCartPressed,
          onRemovefromShopCartPressed: onRemovefromShopCartPressed,
        );
      },
    );
  }

  final Product product;

  final List<Product> favorites;

  final List<ShopItem> shopItems;

  final void Function(Product product) onFavoritePressed;

  final void Function(Product product) onAddtoShopCardPressed;

  final void Function(Product product) onRemovefromShopCartPressed;

  const ProductBottomSheet({
    super.key,
    required this.product,
    required this.favorites,
    required this.shopItems,
    required this.onFavoritePressed,
    required this.onAddtoShopCardPressed,
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
      widget.onAddtoShopCardPressed(widget.product);
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
    for (var element in widget.shopItems) {
      if (element.product == widget.product) {
        count = element.count;
      }
    }
    isFav = widget.favorites.contains(widget.product);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Container(
            height: 5,
            width: 60,
            decoration: BoxDecoration(
              color: theme.colorScheme.outline,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 300,
                        child: Image.asset(widget.product.image),
                      ),
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.product.title,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                widget.product.category.title,
                                style: const TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: _onFavoriatePressed,
                            icon: Icon(
                              isFav
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                            ),
                          )
                        ],
                      ),

                      const SizedBox(
                        height: 25,
                        child: Divider(),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                const Text(
                                  'Rating: ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  '${widget.product.rating}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
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
                            child: VerticalDivider(),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                const Text(
                                  'Price: ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  count == 0
                                      ? '\$${widget.product.price}'
                                      : '\$${widget.product.price * count}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                        child: Divider(),
                      ),
                      // Product Details
                      Row(
                        children: [
                          const Text(
                            'Product Details',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.keyboard_arrow_down_rounded),
                          )
                        ],
                      ),
                      Text(
                        widget.product.description,
                        style: const TextStyle(fontSize: 12),
                      ),
                      const SizedBox(height: 80),
                    ],
                  ),
                ),
                Align(
                  alignment: const Alignment(0, 0.95),
                  child: SizedBox(
                    height: 45,
                    width: 500,
                    child: count == 0
                        ? ElevatedButton(
                            onPressed: _onAddtoShopCartPressed,
                            child: const Text(
                              'Add To Cart',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton.filledTonal(
                                onPressed: _onRemovefromShopCartPressed,
                                icon: const Icon(Icons.remove),
                              ),
                              const SizedBox(width: 25),
                              Text(
                                count.toString(),
                                style: const TextStyle(
                                  fontSize: 24,
                                ),
                              ),
                              const SizedBox(width: 25),
                              IconButton.filledTonal(
                                onPressed: _onAddtoShopCartPressed,
                                icon: const Icon(Icons.add),
                              ),
                            ],
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
