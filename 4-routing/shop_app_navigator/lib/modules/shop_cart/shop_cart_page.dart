import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_navigator/modules/home/cubit/home_cubit.dart';
import 'package:shop_app_navigator/modules/shop_cart/cubit/shop_cart_cubit.dart';
import 'package:shop_app_navigator/modules/shop_cart/shop_item_card.dart';
import 'package:shop_app_navigator/ui_kit/ui_kit.dart' as U;

class CartPage extends StatelessWidget {
//
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state.selectedDes == 3) {
          var shopCartCubit = BlocProvider.of<ShopCartCubit>(context);
          shopCartCubit.init();
        }
      },
      child: BlocBuilder<ShopCartCubit, ShopCartState>(
        builder: (context, state) {
          return Column(
            children: [
              U.AppBar.primary(
                onMenuPressed: () {},
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
                        : SingleChildScrollView(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
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
              ),
            ],
          );
        },
      ),
    );
  }
}
