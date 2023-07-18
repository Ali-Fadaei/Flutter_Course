import 'package:flutter/material.dart';
import 'package:shop_app_m3/models/product.dart';

class ProductBottomSheet extends StatefulWidget {
//
  static show(
    BuildContext context,
    Product product,
    List<Product> favorites,
    void Function(Product product) onFavoriatePressed,
  ) {
    // var colorScheme = ColorScheme.fromSeed(seedColor: product.category.color);
    showBottomSheet(
      // backgroundColor: colorScheme.surfaceVariant,
      context: context,
      builder: (context) {
        return ProductBottomSheet(
          product: product,
          onFavoriatePressed: onFavoriatePressed,
          favorits: favorites,
        );
      },
    );
  }

  final Product product;

  final bool isFavorit;

  final void Function(Product product) onFavoriatePressed;

  ProductBottomSheet({
    super.key,
    required List<Product> favorits,
    required this.product,
    required this.onFavoriatePressed,
  }) : isFavorit = favorits.contains(product);

  @override
  State<ProductBottomSheet> createState() => _ProductBottomSheetState();
}

class _ProductBottomSheetState extends State<ProductBottomSheet> {
//
  var count = 1;

  var isFav = false;

  void onCounterIncremented() {
    if (count < 10) {
      setState(() {
        count++;
      });
    }
  }

  void onCounterDecremented() {
    if (count > 1) {
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
    isFav = widget.isFavorit;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var colorCheme = Theme.of(context).colorScheme;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 1000,
      ),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: SingleChildScrollView(
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
                SizedBox(
                  height: 400,
                  child: Image.asset(
                    widget.product.image,
                    fit: BoxFit.contain,
                  ),
                ),

                /// Product Details
                SizedBox(
                  height: 25,
                ),

                Column(
                  children: [
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
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(widget.product.category.title)
                          ],
                        ),
                        Container(
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

                    /// Counter and Price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton.outlined(
                              onPressed: onCounterDecremented,
                              icon: Icon(Icons.remove),
                            ),
                            // Text(
                            //   " - ",
                            //   style: TextStyle(
                            //     fontSize: 20,
                            //   ),
                            // ),
                            SizedBox(width: 10),
                            Text(
                              count.toString(),
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(width: 10),
                            IconButton.outlined(
                              onPressed: onCounterIncremented,
                              icon: Icon(Icons.add),
                            ),
                            // Text(
                            // " + ",
                            // style: TextStyle(
                            // fontSize: 20,
                            // ),
                            // )
                          ],
                        ),
                        Container(
                          child: Text(
                            "${widget.product.price.toString()} تومان",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
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
                              "Product Details",
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
                          "Rates",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${widget.product.rating} from 5",
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
                        child: GestureDetector(
                      child: Container(
                        width: 300,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.red,
                        ),
                        child: Center(
                          child: Text(
                            "Add to Cart",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
