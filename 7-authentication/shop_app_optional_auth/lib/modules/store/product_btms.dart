import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app_optional_auth/domains/store_repository/models/product.dart';
import 'package:shop_app_optional_auth/domains/store_repository/store_repository.dart';
import 'package:shop_app_optional_auth/domains/user_repository/user_repository.dart';
import 'package:shop_app_optional_auth/modules/app/cubit/app_cubit.dart';
import 'package:shop_app_optional_auth/modules/auth/auth_otp_page.dart';
import 'package:shop_app_optional_auth/modules/favorites/cubit/favoriets_cubit.dart';
import 'package:shop_app_optional_auth/modules/shop_cart/cubit/shop_cart_cubit.dart';
import 'package:shop_app_optional_auth/ui_kit/ui_kit.dart' as U;
import 'package:shop_app_optional_auth/tool_kit/tool_kit.dart' as T;

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
                      userRepo: RepositoryProvider.of<UserRepository>(context),
                      storeRepo:
                          RepositoryProvider.of<StoreRepository>(context),
                    ),
                  )
                : BlocProvider.value(value: shopCartCubit),
            favoritesCubit == null
                ? BlocProvider(
                    create: (_) => FavoritesCubit(
                      userRepo: RepositoryProvider.of<UserRepository>(context),
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
                  child: U.NetworkImage(url: product.image),
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
                          previous.loading != current.loading ||
                          previous.favorites != current.favorites,
                      builder: (context, state) {
                        var isFav = state.favorites
                            .any((element) => element.id == product.id);
                        return BlocBuilder<AppCubit, AppState>(
                          builder: (context, appState) {
                            return IconButton(
                              onPressed: () {
                                state.loading
                                    ? null
                                    : appState.jwtAuthCheck
                                        ? favoritesCubit
                                            .onFavoriatePressed(product)
                                        : GoRouter.of(context).goNamed(
                                            AuthOtpPage.route,
                                          );
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
                                T.Convertor.textToToman(
                                  count == 0
                                      ? product.price.toString()
                                      : (product.price * count).toString(),
                                ),
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
                      ? BlocBuilder<AppCubit, AppState>(
                          builder: (context, appState) {
                            return U.Button(
                              title: 'افزودن به سبدخرید',
                              loading: state.loading,
                              size: U.ButtonSize.lg,
                              onPressed: () {
                                appState.jwtAuthCheck
                                    ? shopCartCubit
                                        .onAddtoShopCartPressed(product)
                                    : GoRouter.of(context).goNamed(
                                        AuthOtpPage.route,
                                      );
                              },
                            );
                          },
                        )
                      : U.Counter(
                          count: count,
                          loading: state.loading,
                          size: U.CounterSize.lg,
                          onAddPressed: () =>
                              shopCartCubit.onAddtoShopCartPressed(product),
                          onRemovePressed: () => shopCartCubit
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
