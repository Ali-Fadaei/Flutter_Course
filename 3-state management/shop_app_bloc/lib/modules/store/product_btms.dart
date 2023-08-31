import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_bloc/domains/store_repository/models/product.dart';
import 'package:shop_app_bloc/domains/store_repository/store_repository.dart';
import 'package:shop_app_bloc/modules/favorites/cubit/favoriets_cubit.dart';
import 'package:shop_app_bloc/modules/shop_cart/cubit/shop_cart_cubit.dart';
import 'package:shop_app_bloc/ui_kit/ui_kit.dart' as U;

class ProductBottomSheet extends StatelessWidget {
//
  static Future show(
    BuildContext context, {
    required Product product,
    FavoritesCubit? favoritesCubit,
    ShopCartCubit? shopCartCubit,
  }) {
    return U.BottomSheet.show(
      context,
      builder: (context) {
        return MultiBlocProvider(
          providers: [
            shopCartCubit == null
                ? BlocProvider(
                    create: (_) => ShopCartCubit(
                      storeRepo:
                          RepositoryProvider.of<StoreRepository>(context),
                    ),
                  )
                : BlocProvider.value(value: shopCartCubit),
            favoritesCubit == null
                ? BlocProvider(
                    create: (_) => FavoritesCubit(
                      storeRepo:
                          RepositoryProvider.of<StoreRepository>(context),
                    ),
                  )
                : BlocProvider.value(value: favoritesCubit),
          ],
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
    var shopCartCubit = BlocProvider.of<ShopCartCubit>(context);
    var favoritesCubit = BlocProvider.of<FavoritesCubit>(context);
    return U.BottomSheet(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 300,
                  child: U.Image(path: product.image),
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        U.Text(
                          product.title,
                          size: U.TextSize.lg,
                          weight: U.TextWeight.bold,
                        ),
                        U.Text(
                          product.category.title,
                          size: U.TextSize.sm,
                          color: U.Theme.outline2,
                        )
                      ],
                    ),
                    const Spacer(),
                    BlocBuilder<FavoritesCubit, FavoritesState>(
                      buildWhen: (previous, current) =>
                          previous.favorites != current.favorites,
                      builder: (context, state) {
                        var isFav = state.favorites
                            .any((element) => element.id == product.id);
                        return IconButton(
                          onPressed: () {
                            state.loading
                                ? null
                                : favoritesCubit.onFavoriatePressed(product);
                          },
                          icon: state.loading
                              ? const U.Loading(isSmall: true)
                              : Icon(
                                  isFav
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  color: isFav
                                      ? U.Theme.primary
                                      : U.Theme.onBackground,
                                ),
                        );
                      },
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                  child: U.Divider.horizontal(),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          const U.Text(
                            "امتیاز: ",
                            size: U.TextSize.md,
                            weight: U.TextWeight.medium,
                          ),
                          const Spacer(),
                          U.Text(
                            "${product.rating}",
                            size: U.TextSize.md,
                            weight: U.TextWeight.medium,
                          ),
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                      child: U.Divider.vertical(),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          const U.Text(
                            "قیمت: ",
                            size: U.TextSize.md,
                            weight: U.TextWeight.medium,
                          ),
                          const Spacer(),
                          BlocBuilder<ShopCartCubit, ShopCartState>(
                            builder: (context, state) {
                              var count = 0;
                              try {
                                count = state.shopItems
                                    .firstWhere((element) =>
                                        element.product.id == product.id)
                                    .count;
                              } catch (_) {}
                              return U.Text(
                                count == 0
                                    ? '${product.price} تومان'
                                    : '${product.price * count} تومان',
                                size: U.TextSize.md,
                                weight: U.TextWeight.medium,
                              );
                            },
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                  child: U.Divider.horizontal(),
                ),
                // Product Details
                Row(
                  children: [
                    const U.Text(
                      'توضیحات محصول',
                      size: U.TextSize.md,
                      weight: U.TextWeight.bold,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: U.Theme.onBackground,
                      ),
                    )
                  ],
                ),
                U.Text(
                  product.description,
                  size: U.TextSize.sm,
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.95),
            child: SizedBox(
              width: 500,
              child: BlocBuilder<ShopCartCubit, ShopCartState>(
                builder: (context, state) {
                  var count = 0;
                  try {
                    count = state.shopItems
                        .firstWhere(
                            (element) => element.product.id == product.id)
                        .count;
                  } catch (_) {}
                  return count == 0
                      ? U.Button(
                          title: 'افزودن به سبدخرید',
                          loading: state.loading,
                          size: U.ButtonSize.lg,
                          onPressed: () =>
                              shopCartCubit.onAddtoShopCartPressed(product),
                        )
                      : U.Counter(
                          count: count,
                          size: U.CounterSize.lg,
                          onIncrementer: () =>
                              shopCartCubit.onAddtoShopCartPressed(product),
                          onDecrementer: () => shopCartCubit
                              .onRemovefromShopCartPressed(product),
                        );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
