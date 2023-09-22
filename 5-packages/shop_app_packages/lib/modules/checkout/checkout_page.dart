// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app_packages/domains/store_repository/models/shop_item.dart';
import 'package:shop_app_packages/domains/store_repository/store_repository.dart';
import 'package:shop_app_packages/modules/checkout/cubit/checkout_cubit.dart';
import 'package:shop_app_packages/ui_kit/ui_kit.dart' as U;

class CheckoutPage extends StatelessWidget {
//
  static const route = 'checkout';

  final List<ShopItem>? initialShopItems;

  const CheckoutPage({
    super.key,
    this.initialShopItems,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutCubit(
        storeRepo: RepositoryProvider.of<StoreRepository>(context),
        initialShopItems: initialShopItems,
      ),
      child: Scaffold(
        appBar: U.AppBar.secondary(
          title: "تکمیل خرید ",
          onBackPressed: () => GoRouter.of(context).pop(),
        ),
        body: BlocBuilder<CheckoutCubit, CheckoutState>(
            builder: (context, state) {
          var checkoutCubit = BlocProvider.of<CheckoutCubit>(context);
          return Container(
            color: U.Theme.background,
            child: state.loading
                ? U.Loading()
                : ListView(
                    padding: const EdgeInsets.all(12.0),
                    children: [
                      U.Card(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                U.Image(
                                  path: U.Images.orderIcon,
                                  size: 24,
                                  color: U.Theme.primary,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                U.Text(
                                  "سبد خرید",
                                  size: U.TextSize.xl,
                                  weight: U.TextWeight.medium,
                                )
                              ],
                            ),
                            U.Divider.horizontal(
                              space: 12,
                              color: U.Theme.secondary,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.0),
                              // Cart
                              child: BlocBuilder<CheckoutCubit, CheckoutState>(
                                builder: (context, state) => Column(
                                  children: state.shopItems
                                      .expand(
                                        (element) => [
                                          _CheckOutItem(shopItem: element),
                                          if (state.shopItems.last != element)
                                            U.Divider.horizontal(
                                              color: U.Theme.secondary,
                                              space: 5,
                                            ),
                                        ],
                                      )
                                      .toList(),
                                ),
                              ),
                            ),
                            U.Divider.horizontal(
                              space: 12,
                              color: U.Theme.secondary,
                            ),
                            // Payment Cart
                            Row(
                              children: [
                                Spacer(),
                                Row(
                                  children: [
                                    U.Text(
                                      "جمع سبد خرید :",
                                      color: U.Theme.primary,
                                    ),
                                    U.Text(state.totalAmount.toString()),
                                  ],
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    U.Text(
                                      "جمع تخفیفات: ",
                                      color: U.Theme.primary,
                                    ),
                                    U.Text(state.discountAmount.toString()),
                                  ],
                                ),
                                Spacer(),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Spacer(),
                                U.Text(
                                  "قابل پرداخت : ",
                                  color: U.Theme.primary,
                                ),
                                U.Text(state.payableAmount.toString()),
                                Spacer(),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      U.Card(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                U.Image(
                                  path: U.Images.paymentIcon,
                                  size: 24,
                                  color: U.Theme.primary,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                U.Text(
                                  "اطلاعات ارسال و پرداخت ",
                                  size: U.TextSize.xl,
                                  weight: U.TextWeight.medium,
                                )
                              ],
                            ),
                            U.Divider.horizontal(
                              space: 14,
                              color: U.Theme.secondary,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  U.TextInput(
                                    controller: checkoutCubit.addressCtrl,
                                    hintText: "آدرس تحویل ",
                                    isRequired: true,
                                    onEditingCompleted: null,
                                    title: "آدرس تحویل",
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: U.TextInput(
                                          controller:
                                              checkoutCubit.discountCtrl,
                                          title: "کدتخفیف",
                                          hintText: "کد تخفیف ",
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      U.IconButton(
                                        icon: U.Images.discountIcon,
                                        color: U.IconButtonColor.secondary,
                                        iconColor: U.Theme.onSecondary,
                                        loading: state.discountLoading,
                                        disabled: state.checkoutLoading,
                                        onPressed:
                                            checkoutCubit.onDiscountPressed,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  U.Button(
                                    title: "پرداخت",
                                    color: U.ButtonColor.primary,
                                    size: U.ButtonSize.lg,
                                    loading: state.checkoutLoading,
                                    disabled: state.discountLoading,
                                    onPressed: checkoutCubit.onCheckoutPressed,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
          );
        }),
      ),
    );
  }
}

class _CheckOutItem extends StatelessWidget {
  //
  final ShopItem shopItem;

  const _CheckOutItem({super.key, required this.shopItem});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        children: [
          U.Image(
            path: shopItem.product.image,
            size: 60,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                U.Text(
                  shopItem.product.title,
                ),
                Row(
                  children: [
                    U.Text(shopItem.product.price.toString()),
                    SizedBox(
                      width: 10,
                    ),
                    U.Text(
                      "*",
                      color: U.Theme.primary,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    U.Text(
                      shopItem.count.toString(),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
          U.Text((shopItem.product.price * shopItem.count).toString()),
        ],
      ),
    );
  }
}
