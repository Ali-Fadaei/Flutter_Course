import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_bloc/domains/store_repository/models/shop_cart.dart';
import 'package:shop_app_bloc/modules/shop_cart/cubit/shop_cart_cubit.dart';
import 'package:shop_app_bloc/modules/store/product_btms.dart';
import 'package:shop_app_bloc/ui_kit/ui_kit.dart' as U;

class ShopCardItem extends StatelessWidget {
//
  final ShopItem shopItem;

  const ShopCardItem({
    super.key,
    required this.shopItem,
  });

  @override
  Widget build(BuildContext context) {
    var shopCartCubit = BlocProvider.of<ShopCartCubit>(context);
    return GestureDetector(
      onTap: () => ProductBottomSheet.show(
        context,
        product: shopItem.product,
        shopCartCubit: shopCartCubit,
      ),
      child: U.Card(
        height: 140,
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            SizedBox(
              width: 120,
              child: U.Image(path: shopItem.product.image),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                U.Text(
                  shopItem.product.title,
                  size: U.TextSize.xl,
                  weight: U.TextWeight.bold,
                ),
                U.Text(
                  shopItem.product.category.title,
                  size: U.TextSize.md,
                  color: U.Theme.outline2,
                ),
                const Spacer(),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                const Spacer(),
                U.Text(
                  '${shopItem.product.price * shopItem.count} تومان',
                  size: U.TextSize.lg,
                  weight: U.TextWeight.bold,
                ),
                const SizedBox(height: 8),
                U.Counter(
                  count: shopItem.count,
                  size: U.CounterSize.md,
                  onIncrementer: () =>
                      shopCartCubit.onAddtoShopCartPressed(shopItem.product),
                  onDecrementer: () => shopCartCubit
                      .onRemovefromShopCartPressed(shopItem.product),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
