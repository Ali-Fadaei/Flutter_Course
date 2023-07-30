import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/domains/store_repository/models/product.dart';
import 'package:shop_app/modules/favorites/cubit/favoriets_cubit.dart';
import 'package:shop_app/modules/shop_cart/cubit/shop_cart_cubit.dart';
import 'package:shop_app/modules/store/product_btms.dart';

class ProductCard extends StatelessWidget {
//
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    var shopCartCubit = BlocProvider.of<ShopCartCubit>(context);
    var favoritesCubit = BlocProvider.of<FavoritesCubit>(context);
    return GestureDetector(
      onTap: () => ProductBottomSheet.show(
        context,
        product: product,
        shopCartCubit: shopCartCubit,
        favoritesCubit: favoritesCubit,
      ),
      child: Container(
        width: 173.32,
        height: 248.51,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 0.50, color: Color(0xFFE2E2E2)),
            borderRadius: BorderRadius.circular(18),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x00000000),
              blurRadius: 12,
              offset: Offset(0, 6),
              spreadRadius: 0,
            )
          ],
        ),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(17.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(product.image),
                SizedBox(height: 15),
                Text(
                  product.title,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontFamily: 'IRANSans',
                      fontSize: 16,
                      color: Color(0xFF100D39),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  'امتیاز: ${product.rating}',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFF7C7C7C),
                    fontSize: 12,
                    fontFamily: 'IRANSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        shopCartCubit.onAddtoShopCartPressed(product);
                      },
                      elevation: 2,
                      mini: true,
                      child: Container(
                        width: 45.67,
                        height: 45.67,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xFFF34E4E),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      '${product.price} T',
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 0.10,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'IRANSans'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
