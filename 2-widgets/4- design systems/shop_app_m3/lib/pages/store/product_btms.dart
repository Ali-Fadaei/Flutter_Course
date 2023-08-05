import 'package:flutter/material.dart';
import 'package:shop_app_m3/models/product.dart';
import 'package:shop_app_m3/models/shop_cart.dart';

class ProductBottomSheet extends StatefulWidget {
//
  static show(
    BuildContext context, {
    required Product product,
    required ShopCart shopCart,
    required List<Product> favorites,
    required void Function(Product product) onFavoriatePressed,
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
          favorites: favorites,
          onFavoriatePressed: onFavoriatePressed,
          onAddtoShopCardPressed: onAddtoShopCartPressed,
          onRemovefromShopCartPressed: onRemovefromShopCartPressed,
        );
      },
    );
  }

  final Product product;

  final List<Product> favorites;

  final ShopCart shopCart;

  final void Function(Product product) onFavoriatePressed;

  final void Function(Product product) onAddtoShopCardPressed;

  final void Function(Product product) onRemovefromShopCartPressed;

  const ProductBottomSheet({
    super.key,
    required this.product,
    required this.favorites,
    required this.shopCart,
    required this.onFavoriatePressed,
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

  void _onAddtoShopCardPressed() {
    if (count < 10) {
      widget.onAddtoShopCardPressed(widget.product);
      setState(() {
        count++;
      });
    }
  }

  void _onRemovetoShopCardPressed() {
    if (count > 0) {
      widget.onRemovefromShopCartPressed(widget.product);
      setState(() {
        count--;
      });
    }
  }

  void _onFavoriatePressed() {
    widget.onFavoriatePressed(widget.product);
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
    isFav = widget.favorites.contains(widget.product);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: widget.product.category.color.withOpacity(0.15),
        borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
      ),
      padding: const EdgeInsets.all(11.0),
      child: Column(
        children: [
          Container(
            height: 5,
            width: 60,
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: theme.colorScheme.outline,
              borderRadius: BorderRadius.circular(15),
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
                        child: Image.asset(widget.product.image),
                      ),
                      SizedBox(height: 25),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.product.title,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(widget.product.category.title)
                            ],
                          ),
                          Spacer(),
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
                      SizedBox(
                        height: 25,
                        child: Divider(),
                      ),

                      // Product Details
                      Row(
                        children: [
                          Text(
                            "Product Details",
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.keyboard_arrow_down_rounded),
                          )
                        ],
                      ),
                      Text(widget.product.description),
                      SizedBox(
                        height: 25,
                        child: Divider(),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  "Rating: ",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "${widget.product.rating}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: VerticalDivider(),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  "Price: ",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  count == 0
                                      ? "\$${widget.product.price}"
                                      : "\$${widget.product.price * count}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 25),
                      // Add to Cart
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(0, 0.95),
                  child: SizedBox(
                    height: 45,
                    width: 400,
                    child: count == 0
                        ? ElevatedButton(
                            onPressed: _onAddtoShopCardPressed,
                            child: Text(
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
                                onPressed: _onRemovetoShopCardPressed,
                                icon: Icon(Icons.remove),
                              ),
                              SizedBox(width: 25),
                              Text(
                                count.toString(),
                                style: TextStyle(
                                  fontSize: 24,
                                ),
                              ),
                              SizedBox(width: 25),
                              IconButton.filledTonal(
                                onPressed: _onAddtoShopCardPressed,
                                icon: Icon(Icons.add),
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
