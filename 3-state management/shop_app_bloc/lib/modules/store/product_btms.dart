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
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxWidth: 1024,
        maxHeight: MediaQuery.of(context).size.height * 0.90,
      ),
      builder: (context) {
        return MultiBlocProvider(
          providers: [
            shopCartCubit == null
                ? BlocProvider(
                    create: (_) => ShopCartCubit(
                      storeRepository:
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
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: U.Theme.background,
        borderRadius: BorderRadius.circular(U.Theme.radius),
      ),
      child: Column(
        children: [
          Container(
            height: 5,
            width: 70,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: U.Theme.outline2,
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 400,
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
                                size: U.TextSize.xxl,
                                weight: U.TextWeight.bold,
                              ),
                              U.Text(product.category.title)
                            ],
                          ),
                          const Spacer(),
                          BlocBuilder<FavoritesCubit, FavoritesState>(
                            buildWhen: (previous, current) =>
                                previous.favorites != current.favorites,
                            builder: (context, state) {
                              var isFav = state.favorites.contains(product);
                              return IconButton(
                                onPressed: () {
                                  state.loading
                                      ? null
                                      : favoritesCubit
                                          .onFavoriatePressed(product);
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
                                  size: U.TextSize.xl,
                                  weight: U.TextWeight.bold,
                                ),
                                const Spacer(),
                                U.Text(
                                  "${product.rating}",
                                  size: U.TextSize.xl,
                                  weight: U.TextWeight.bold,
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
                                  size: U.TextSize.xl,
                                  weight: U.TextWeight.bold,
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
                                      size: U.TextSize.xl,
                                      weight: U.TextWeight.bold,
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
                            size: U.TextSize.xl,
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
                      U.Text(product.description),

                      const SizedBox(height: 80),
                    ],
                  ),
                ),
                Align(
                  alignment: const Alignment(0, 0.95),
                  child: SizedBox(
                    width: 400,
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
                                onPressed: () => shopCartCubit
                                    .onAddtoShopCartPressed(product),
                              )
                            : U.Counter(
                                count: count,
                                size: U.CounterSize.lg,
                                onIncrementer: () => shopCartCubit
                                    .onAddtoShopCartPressed(product),
                                onDecrementer: () => shopCartCubit
                                    .onRemovefromShopCartPressed(product),
                              );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
