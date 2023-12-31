import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_navigator/domains/store_repository/models/product.dart';
import 'package:shop_app_navigator/modules/favorites/cubit/favoriets_cubit.dart';
import 'package:shop_app_navigator/modules/shop_cart/cubit/shop_cart_cubit.dart';
import 'package:shop_app_navigator/modules/store/product_btms.dart';
import 'package:shop_app_navigator/ui_kit/ui_kit.dart' as U;

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
      child: U.Card(
        width: 200,
        height: 320,
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product.image),
            const SizedBox(height: 15),
            U.Text(
              product.title,
              size: U.TextSize.md,
              weight: U.TextWeight.medium,
            ),
            const SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                U.Text(
                  'امتیاز: ${product.rating}',
                  size: U.TextSize.sm,
                  color: U.Theme.outline2,
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
                BlocBuilder<ShopCartCubit, ShopCartState>(
                  builder: (context, state) {
                    return U.IconButton(
                      toolTip: 'اضافه کردن به سبد خرید',
                      icon: U.Images.addIcon,
                      size: U.IconButtonSize.sm,
                      color: U.IconButtonColor.primary,
                      disabled: state.loading,
                      onPressed: () =>
                          shopCartCubit.onAddtoShopCartPressed(product),
                    );
                  },
                ),
                const Spacer(),
                U.Text(
                  '${product.price} تومان',
                  font: U.TextFont.iranSans,
                  size: U.TextSize.sm,
                  weight: U.TextWeight.medium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
