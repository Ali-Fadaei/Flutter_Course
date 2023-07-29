import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/domains/store_repository/models/product.dart';
import 'package:shop_app/modules/app/cubit/app_cubit.dart';

class ProductBottomSheet extends StatelessWidget {
//
  static show(
    BuildContext context, {
    required Product product,
    required AppCubit appCubit,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxWidth: 1024,
        maxHeight: MediaQuery.of(context).size.height * 0.90,
      ),
      builder: (context) {
        return BlocProvider.value(
          value: appCubit,
          child: ProductBottomSheet(
            product: product,
          ),
        );
      },
    );
  }

  final Product product;

  const ProductBottomSheet({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    var appCubit = BlocProvider.of<AppCubit>(context);
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
                        product.image,
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
                              product.title,
                              style: TextStyle(
                                color: Color(0xFF181725),
                                fontSize: 20,
                                fontFamily: 'IRANSans',
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.10,
                              ),
                            ),
                            Text(
                              product.category.title,
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
                            onPressed: () =>
                                appCubit.onFavoriatePressed(product),
                            icon: BlocBuilder<AppCubit, AppState>(
                              buildWhen: (previous, current) =>
                                  previous.favorites != current.favorites,
                              builder: (context, state) {
                                return Icon(
                                  state.favorites.contains(product)
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                );
                              },
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
                        "${product.price.toString()} تومان",
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
                        Text(product.description)
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
                          "${product.rating} از5 ",
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
                      child: GestureDetector(
                        onTap: () => {
                          appCubit.onAddtoShopCartPressed(product),
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () =>
                                  appCubit.onRemovefromShopCartPressed(product),
                              icon: Icon(
                                Icons.remove,
                                size: 24,
                                color: Color(0xFFF34E4E),
                              ),
                            ),
                            // Text(
                            //   " - ",
                            //   style: TextStyle(
                            //     fontSize: 20,
                            //   ),
                            // ),
                            SizedBox(width: 15),
                            Container(
                              width: 45.67,
                              height: 45.67,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromARGB(255, 222, 222, 222),
                                      width: 2,
                                      style: BorderStyle.solid),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                child: BlocBuilder<AppCubit, AppState>(
                                  buildWhen: (previous, current) =>
                                      previous.shopCart.shopItems !=
                                      current.shopCart.shopItems,
                                  builder: (context, state) {
                                    var count = 0;
                                    try {
                                      count = state.shopCart.shopItems
                                          .firstWhere(
                                            (element) =>
                                                element.product == product,
                                          )
                                          .count;
                                    } catch (_) {}
                                    return Text(
                                      count.toString(),
                                      style: TextStyle(
                                        fontSize: 24,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            IconButton(
                              onPressed: () =>
                                  appCubit.onAddtoShopCartPressed(product),
                              icon: Icon(
                                Icons.add,
                                size: 24,
                                color: Colors.grey,
                              ),
                            ),
                            // Text(
                            // " + ",
                            // style: TextStyle(
                            // fontSize: 20,
                            // ),
                            // )
                          ],
                        ),
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
