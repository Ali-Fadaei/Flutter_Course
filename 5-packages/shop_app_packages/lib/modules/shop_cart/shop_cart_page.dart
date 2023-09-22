import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app_packages/domains/store_repository/store_repository.dart';
import 'package:shop_app_packages/modules/checkout/checkout_page.dart';
import 'package:shop_app_packages/modules/home/cubit/home_cubit.dart';
import 'package:shop_app_packages/modules/shop_cart/cubit/shop_cart_cubit.dart';
import 'package:shop_app_packages/modules/shop_cart/shop_item_card.dart';
import 'package:shop_app_packages/ui_kit/ui_kit.dart' as U;

class CartPage extends StatelessWidget {
//
  static const route = '/shopCart';

  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCartCubit(
        storeRepo: RepositoryProvider.of<StoreRepository>(context),
      ),
      child: BlocListener<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state.selectedDes == 3) {
            var shopCartCubit = BlocProvider.of<ShopCartCubit>(context);
            shopCartCubit.init();
          }
        },
        child: BlocBuilder<ShopCartCubit, ShopCartState>(
          builder: (context, state) {
            return Container(
              color: U.Theme.background,
              child: Column(
                children: [
                  U.AppBar.primary(
                    onMenuPressed: () => Scaffold.of(context).openDrawer(),
                    onNotifPressed: () {},
                  ),
                  Expanded(
                    child: state.loading && state.shopItems.isEmpty
                        ? const U.Loading()
                        : state.shopItems.isEmpty
                            ? const Center(
                                child: SizedBox(
                                  width: 400,
                                  child: U.Image(path: U.Images.cartEmpty),
                                ),
                              )
                            : Stack(
                                children: [
                                  SingleChildScrollView(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    physics: const BouncingScrollPhysics(),
                                    child: Column(
                                      children: [
                                        ...state.shopItems
                                            .expand(
                                              (element) => [
                                                ShopCardItem(shopItem: element),
                                                const SizedBox(height: 15)
                                              ],
                                            )
                                            .toList(),
                                        if (state.loading) ...[
                                          const SizedBox(height: 15),
                                          const U.Loading()
                                        ],
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: const Alignment(0, 0.95),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0),
                                      child: SizedBox(
                                        width: 500,
                                        child: U.Button(
                                          title: "تکمیل خرید",
                                          color: U.ButtonColor.primary,
                                          trailing: U.Text(
                                            "${state.totalAmount.toString()} تومان",
                                            color: U.Theme.onPrimary,
                                            size: U.TextSize.lg,
                                            weight: U.TextWeight.medium,
                                          ),
                                          onPressed: () {
                                            GoRouter.of(context).goNamed(
                                              CheckoutPage.route,
                                              extra: state.shopItems,
                                            );
                                          },
                                          size: U.ButtonSize.lg,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
