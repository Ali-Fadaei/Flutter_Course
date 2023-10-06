import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_data_providers/domains/store_repository/models/product.dart';
import 'package:shop_app_data_providers/modules/favorites/cubit/favoriets_cubit.dart';
import 'package:shop_app_data_providers/modules/shop_cart/cubit/shop_cart_cubit.dart';
import 'package:shop_app_data_providers/modules/store/product_btms.dart';
import 'package:shop_app_data_providers/ui_kit/ui_kit.dart' as U;

class FavoritesCard extends StatelessWidget {
//
  final Product product;

  const FavoritesCard({
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
        height: 140,
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            SizedBox(
              width: 120,
              child: U.Image(path: product.image),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  U.Text(
                    product.title,
                    size: U.TextSize.md,
                    weight: U.TextWeight.bold,
                  ),
                  U.Text(
                    product.category.title,
                    size: U.TextSize.sm,
                    color: U.Theme.outline2,
                  ),
                  U.Text(
                    '${product.price} تومان',
                    size: U.TextSize.md,
                    color: U.Theme.outline2,
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const SizedBox(width: 5),
            BlocBuilder<FavoritesCubit, FavoritesState>(
              builder: (context, state) {
                return Opacity(
                  opacity: state.loading ? 0.5 : 1,
                  child: IconButton(
                    onPressed: () => state.loading
                        ? null
                        : favoritesCubit.onFavoriatePressed(product),
                    icon: const Icon(
                      Icons.favorite,
                      color: U.Theme.primary,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
