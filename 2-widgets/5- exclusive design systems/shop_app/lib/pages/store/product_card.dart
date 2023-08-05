import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/models/shop_cart.dart';
import 'package:shop_app/pages/store/product_btms.dart';
import 'package:shop_app/ui_kit/ui_kit.dart' as U;

class ProductCard extends StatelessWidget {
//
  final Product product;

  final ShopCart shopCart;

  final List<Product> favorites;

  final void Function(Product product) onAddtoShopCartPressed;

  final void Function(Product product) onRemovetoShopCartPressed;

  final void Function(Product) onFavoriatePressed;

  const ProductCard({
    super.key,
    required this.product,
    required this.favorites,
    required this.shopCart,
    required this.onFavoriatePressed,
    required this.onAddtoShopCartPressed,
    required this.onRemovetoShopCartPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ProductBottomSheet.show(
        context,
        product: product,
        favorites: favorites,
        shopCart: shopCart,
        onFavoriatePressed: onFavoriatePressed,
        onAddtoShopCartPressed: onAddtoShopCartPressed,
        onRemovetoShopCartPressed: onRemovetoShopCartPressed,
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
        child: SizedBox(
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
                    // FloatingActionButton(
                    //   onPressed: () {
                    //     onAddtoShopCartPressed(product);
                    //   },
                    //   elevation: 2,
                    //   mini: true,
                    //   child: Container(
                    //     width: 45.67,
                    //     height: 45.67,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(15),
                    //       color: Color(0xFFF34E4E),
                    //     ),
                    //     child: Center(
                    //       child: Icon(
                    //         Icons.add,
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    U.IconButton(
                      toolTip: 'اضافه کردن به سبد خرید',
                      iconName: U.Images.addIcon,
                      onPressed: () => onAddtoShopCartPressed(product),
                      color: U.IconButtonColor.primary,
                      size: U.IconButtonSize.sm,
                    ),
                    U.Text(
                      '${product.price} T',
                      color: U.Theme.onBackground,
                      size: U.TextSize.md,
                      weight: U.TextWeight.bold,
                      font: U.TextFont.iranSans,
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