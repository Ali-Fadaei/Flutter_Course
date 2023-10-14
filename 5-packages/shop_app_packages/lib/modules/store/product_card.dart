import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_packages/domains/store_repository/models/product.dart';
import 'package:shop_app_packages/modules/favorites/cubit/favoriets_cubit.dart';
import 'package:shop_app_packages/modules/shop_cart/cubit/shop_cart_cubit.dart';
import 'package:shop_app_packages/modules/store/product_btms.dart';
import 'package:shop_app_packages/ui_kit/ui_kit.dart' as U;
import 'package:shop_app_packages/tool_kit/tool_kit.dart' as T;

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
            BlocBuilder<ShopCartCubit, ShopCartState>(
              builder: (context, state) {
                var count = state.shopItems
                    .where((element) => element.product == product)
                    .firstOrNull
                    ?.count;
                return Row(
                  children: [
                    U.Badge(
                      count: count,
                      color: U.BadgeColor.secondary,
                      child: U.IconButton(
                        toolTip: 'اضافه کردن به سبد خرید',
                        icon: U.Images.addIcon,
                        size: U.IconButtonSize.sm,
                        color: U.IconButtonColor.primary,
                        disabled: state.loading,
                        onPressed: () =>
                            shopCartCubit.onAddtoShopCartPressed(product),
                      ),
                    ),
                    const Spacer(),
                    U.Text(
                      T.Convertor.textToToman(
                        product.price.toString(),
                      ),
                      font: U.TextFont.iranSans,
                      size: U.TextSize.sm,
                      weight: U.TextWeight.medium,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
