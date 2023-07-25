import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/models/shop_cart.dart';
import 'package:shop_app/ui_kit/ui_kit.dart' as U;

class ProductBottomSheet extends StatefulWidget {
//
  static show(
    BuildContext context, {
    required Product product,
    required ShopCart shopCart,
    required List<Product> favorites,
    required void Function(Product product) onFavoriatePressed,
    required void Function(Product product) onAddtoShopCartPressed,
    required void Function(Product product) onRemovetoShopCartPressed,
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
          onFavoriatePressed: onFavoriatePressed,
          onAddtoShopCardPressed: onAddtoShopCartPressed,
          onRemovetoShopCardPressed: onRemovetoShopCartPressed,
        );
      },
    );
  }

  final Product product;

  final List<Product> favorits;

  final ShopCart shopCart;

  final void Function(Product product) onFavoriatePressed;

  final void Function(Product product) onAddtoShopCardPressed;

  final void Function(Product product) onRemovetoShopCardPressed;
  final isEmpty;

  const ProductBottomSheet({
    super.key,
    required this.product,
    required this.favorits,
    required this.shopCart,
    required this.onFavoriatePressed,
    required this.onAddtoShopCardPressed,
    required this.onRemovetoShopCardPressed,
    this.isEmpty,
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
      widget.onRemovetoShopCardPressed(widget.product);
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
    isFav = widget.favorits.contains(widget.product);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var colorCheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 5,
              width: 60,
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: colorCheme.outline,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      child: Image.asset(
                        widget.product.image,
                        fit: BoxFit.contain,
                      ),
                    ),

                    /// Product Details
                    SizedBox(
                      height: 25,
                    ),

                    /// Name and Category ,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.product.title,
                              style: TextStyle(
                                color: Color(0xFF181725),
                                fontSize: 20,
                                fontFamily: 'IRANSans',
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.10,
                              ),
                            ),
                            Text(
                              widget.product.category.title,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontFamily: 'IRANSans',
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.10,
                              ),
                            )
                          ],
                        ),
                        Center(
                          child: IconButton(
                            onPressed: _onFavoriatePressed,
                            icon: Icon(
                              isFav
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),

                    ///  Price
                    Center(
                      child: Text(
                        "${widget.product.price.toString()} تومان",
                        style: TextStyle(
                          color: Color(0xFF181725),
                          fontSize: 24,
                          fontFamily: 'IRANSans',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.10,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),

                    /// Product Details
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "توضیحات محصول",
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.keyboard_arrow_down_rounded))
                          ],
                        ),
                        Text(widget.product.description)
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),

                    /// Rating
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "امتیاز",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${widget.product.rating} از5 ",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),

                    /// Add to Cart
                    SizedBox(
                      width: 300,
                      child: U.Counter(
                        count: count,
                        onIncrementer: _onAddtoShopCardPressed,
                        onDecrementer: _onRemovetoShopCardPressed,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
