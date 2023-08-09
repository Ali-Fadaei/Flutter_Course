import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_bloc/domains/store_repository/models/product.dart';
import 'package:shop_app_bloc/modules/favorites/cubit/favoriets_cubit.dart';
import 'package:shop_app_bloc/modules/store/product_btms.dart';
import 'package:shop_app_bloc/ui_kit/ui_kit.dart' as U;

class FavoritesCard extends StatelessWidget {
//
  final Product product;

  const FavoritesCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    var favoritesCubit = BlocProvider.of<FavoritesCubit>(context);
    return GestureDetector(
      onTap: () => ProductBottomSheet.show(
        context,
        product: product,
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
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                U.Text(
                  product.title,
                  size: U.TextSize.lg,
                  weight: U.TextWeight.bold,
                ),
                U.Text(
                  product.category.title,
                  size: U.TextSize.md,
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
            const Spacer(),
            IconButton(
              onPressed: () => favoritesCubit.onFavoriatePressed(product),
              icon: const Icon(
                Icons.favorite,
                color: U.Theme.primary,
              ),
            )
          ],
        ),
      ),
    );
  }
}