import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_routing/domains/store_repository/models/product.dart';
import 'package:shop_app_routing/modules/shop_cart/cubit/shop_cart_cubit.dart';
import 'package:shop_app_routing/modules/store/product_btms.dart';
import 'package:shop_app_routing/ui_kit/ui_kit.dart' as U;

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
    return GestureDetector(
      onTap: () => ProductBottomSheet.show(
        context,
        product: product,
      ),
      child: U.Card(
        width: 185,
        height: 350,
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product.image),
            const SizedBox(height: 15),
            U.Text(
              product.title,
              size: U.TextSize.md,
              weight: U.TextWeight.bold,
            ),
            const SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                U.Text(
                  'امتیاز: ${product.rating}',
                  size: U.TextSize.sm,
                  color: U.Theme.outline2,
                  weight: U.TextWeight.bold,
                ),
                Icon(
                  Icons.star,
                  size: 14,
                  color: Colors.amber.shade700,
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                U.IconButton(
                  toolTip: 'اضافه کردن به سبد خرید',
                  icon: U.Images.addIcon,
                  size: U.IconButtonSize.sm,
                  color: U.IconButtonColor.primary,
                  onPressed: () =>
                      shopCartCubit.onAddtoShopCartPressed(product),
                ),
                const Spacer(),
                U.Text(
                  '${product.price} تومان',
                  font: U.TextFont.iranSans,
                  size: U.TextSize.md,
                  weight: U.TextWeight.bold,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
