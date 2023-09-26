import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_packages/domains/store_repository/models/shop_item.dart';
import 'package:shop_app_packages/modules/favorites/cubit/favoriets_cubit.dart';
import 'package:shop_app_packages/modules/shop_cart/cubit/shop_cart_cubit.dart';
import 'package:shop_app_packages/modules/store/product_btms.dart';
import 'package:shop_app_packages/ui_kit/ui_kit.dart' as U;

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
    var favotiresCubit = BlocProvider.of<FavoritesCubit>(context);
    return GestureDetector(
      onTap: () => ProductBottomSheet.show(
        context,
        product: shopItem.product,
        shopCartCubit: shopCartCubit,
        favoritesCubit: favotiresCubit,
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
            const SizedBox(width: 5),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  U.Text(
                    shopItem.product.title,
                    size: U.TextSize.md,
                    weight: U.TextWeight.bold,
                  ),
                  U.Text(
                    shopItem.product.category.title,
                    size: U.TextSize.sm,
                    color: U.Theme.outline2,
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const SizedBox(width: 5),
            Column(
              children: [
                const Spacer(),
                U.Text(
                  '${shopItem.product.price * shopItem.count} تومان',
                  size: U.TextSize.md,
                  weight: U.TextWeight.medium,
                ),
                const SizedBox(height: 8),
                U.Counter(
                  count: shopItem.count,
                  size: U.CounterSize.md,
                  onAddPressed: () =>
                      shopCartCubit.onAddtoShopCartPressed(shopItem.product),
                  onRemovePressed: () => shopCartCubit
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
