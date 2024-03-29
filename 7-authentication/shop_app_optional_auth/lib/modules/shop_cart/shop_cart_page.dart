import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app_optional_auth/modules/app/cubit/app_cubit.dart';
import 'package:shop_app_optional_auth/modules/auth/auth_otp_page.dart';
import 'package:shop_app_optional_auth/modules/checkout/checkout_page.dart';
import 'package:shop_app_optional_auth/modules/home/cubit/home_cubit.dart';
import 'package:shop_app_optional_auth/modules/shop_cart/cubit/shop_cart_cubit.dart';
import 'package:shop_app_optional_auth/modules/shop_cart/shop_item_card.dart';
import 'package:shop_app_optional_auth/ui_kit/ui_kit.dart' as U;
import 'package:shop_app_optional_auth/tool_kit/tool_kit.dart' as T;

class CartPage extends StatelessWidget {
//
  static const route = '/shopcart';

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
          var shopCartCubit = BlocProvider.of<ShopCartCubit>(context);
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
                        ? Column(
                            children: [
                              const Center(
                                child: SizedBox(
                                  width: 400,
                                  child: U.Image(path: U.Images.cartEmpty),
                                ),
                              ),
                              BlocBuilder<AppCubit, AppState>(
                                buildWhen: (previous, current) =>
                                    previous.jwtAuthCheck !=
                                    current.jwtAuthCheck,
                                builder: (context, state) {
                                  return !state.jwtAuthCheck
                                      ? Container(
                                          width: 500,
                                          padding: const EdgeInsets.all(8.0),
                                          child: U.OutlinedButton(
                                            title: 'ورود به حساب کاربری',
                                            onPressed: () =>
                                                GoRouter.of(context).goNamed(
                                              AuthOtpPage.route,
                                            ),
                                          ),
                                        )
                                      : const SizedBox();
                                },
                              )
                            ],
                          )
                        : Stack(
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: SingleChildScrollView(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
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
                              Align(
                                alignment: const Alignment(0, 0.95),
                                child: Container(
                                  width: 500,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  child: Hero(
                                    tag: 'btn1',
                                    child: U.Button(
                                      title: 'تکمیل خرید',
                                      trailing: U.Text(
                                        T.Convertor.textToToman(
                                          state.totalAmount.toString(),
                                        ),
                                        color: U.Theme.onPrimary,
                                        size: U.TextSize.lg,
                                        weight: U.TextWeight.medium,
                                      ),
                                      size: U.ButtonSize.lg,
                                      onPressed: () {
                                        GoRouter.of(context).goNamed(
                                          CheckoutPage.route,
                                          extra: shopCartCubit.state.shopItems,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
              ),
            ],
          );
        },
      ),
    );
  }
}
