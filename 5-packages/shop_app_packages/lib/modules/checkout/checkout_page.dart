import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app_packages/domains/store_repository/models/shop_item.dart';
import 'package:shop_app_packages/domains/store_repository/store_repository.dart';
import 'package:shop_app_packages/modules/checkout/cubit/checkout_cubit.dart';

import 'package:shop_app_packages/ui_kit/ui_kit.dart' as U;
import 'package:shop_app_packages/tool_kit.dart/tool_kit.dart' as T;

class CheckoutPage extends StatelessWidget {
//
  static const route = 'checkout';

  final List<ShopItem>? shopItems;

  const CheckoutPage({
    super.key,
    this.shopItems,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutCubit(
        shopItems: shopItems,
        storeRepo: RepositoryProvider.of<StoreRepository>(context),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: U.Theme.background,
          appBar: U.AppBar.secondary(
            title: 'تکمیل خرید',
            onBackPressed: () => GoRouter.of(context).pop(),
          ),
          body: BlocBuilder<CheckoutCubit, CheckoutState>(
            builder: (context, state) {
              var checkoutCubit = BlocProvider.of<CheckoutCubit>(context);
              return state.loading
                  ? const U.Loading()
                  : Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(12.0),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1000),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 60,
                              child: U.Card(
                                padding: const EdgeInsets.all(18),
                                child: Column(
                                  children: [
                                    const Row(
                                      children: [
                                        U.Image(
                                          size: 24,
                                          path: U.Images.orderIcon,
                                          color: U.Theme.primary,
                                        ),
                                        SizedBox(width: 5),
                                        U.Text(
                                          'سبدخرید',
                                          size: U.TextSize.lg,
                                          weight: U.TextWeight.medium,
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    const U.Divider.horizontal(
                                      space: 0,
                                      color: U.Theme.secondary,
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: ListView(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 15,
                                        ),
                                        children: [
                                          ...state.shopItems
                                              .expand(
                                                (element) => [
                                                  _CheckoutItem(
                                                    shopItem: element,
                                                  ),
                                                  if (state.shopItems.last !=
                                                      element)
                                                    const U
                                                        .Divider.horizontal(),
                                                ],
                                              )
                                              .toList(),
                                        ],
                                      ),
                                    ),
                                    const U.Divider.horizontal(
                                      space: 0,
                                      color: U.Theme.secondary,
                                    ),
                                    const SizedBox(height: 12),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                      ),
                                      child: Wrap(
                                        spacing: 20,
                                        runSpacing: 20,
                                        alignment: WrapAlignment.center,
                                        runAlignment: WrapAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const U.Text(
                                                'جمع سبد: ',
                                                size: U.TextSize.md,
                                                color: U.Theme.primary,
                                              ),
                                              U.Text(
                                                T.Convertor.textToToman(
                                                  state.totalAmount.toString(),
                                                ),
                                                size: U.TextSize.md,
                                                weight: U.TextWeight.medium,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const U.Text(
                                                'جمع تخفیفات: ',
                                                size: U.TextSize.md,
                                                color: U.Theme.primary,
                                              ),
                                              U.Text(
                                                T.Convertor.textToToman(
                                                  state.discountAmount
                                                      .toString(),
                                                ),
                                                size: U.TextSize.md,
                                                weight: U.TextWeight.medium,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const U.Text(
                                                'قابل پرداخت: ',
                                                size: U.TextSize.md,
                                                color: U.Theme.primary,
                                              ),
                                              U.Text(
                                                T.Convertor.textToToman(
                                                  state.payableAmount
                                                      .toString(),
                                                ),
                                                size: U.TextSize.md,
                                                weight: U.TextWeight.medium,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            U.Card(
                              padding: const EdgeInsets.all(18),
                              child: Column(
                                children: [
                                  const Row(
                                    children: [
                                      U.Image(
                                        size: 24,
                                        path: U.Images.paymentIcon,
                                        color: U.Theme.primary,
                                      ),
                                      SizedBox(width: 5),
                                      U.Text(
                                        'اطلاعات ارسال و پرداخت',
                                        size: U.TextSize.lg,
                                        weight: U.TextWeight.medium,
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                  const U.Divider.horizontal(
                                    color: U.Theme.secondary,
                                  ),
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Column(
                                      children: [
                                        U.TextInput(
                                          title: 'آدرس تحویل',
                                          hintText: 'استان، شهر، منطقه...',
                                          isRequired: true,
                                          controller: checkoutCubit.addressCtrl,
                                        ),
                                        const SizedBox(height: 20),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: U.TextInput(
                                                title: 'کد تخفیف',
                                                hintText: 'ABCXyz10%',
                                                controller:
                                                    checkoutCubit.discountCtrl,
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            U.IconButton(
                                              icon: U.Images.discountIcon,
                                              color:
                                                  U.IconButtonColor.secondary,
                                              size: U.IconButtonSize.lg,
                                              disabled: state.paymentLoading,
                                              loading: state.discountLoading,
                                              toolTip: 'اعمال کد تخفیف',
                                              onPressed: checkoutCubit
                                                  .onDiscountApplyPressed,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                        Hero(
                                          tag: 'Btn-1',
                                          child: U.Button(
                                            title: 'پرداخت',
                                            size: U.ButtonSize.lg,
                                            disabled: state.discountLoading,
                                            loading: state.paymentLoading,
                                            onPressed:
                                                checkoutCubit.onPaymentPressed,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }
}

class _CheckoutItem extends StatelessWidget {
//
  final ShopItem shopItem;

  const _CheckoutItem({
    // super.key,
    required this.shopItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          U.Image(
            size: 50,
            path: shopItem.product.image,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                U.Text(
                  shopItem.product.title,
                  size: U.TextSize.sm,
                  weight: U.TextWeight.medium,
                ),
                Row(
                  children: [
                    U.Text(
                      T.Convertor.textToToman(
                        shopItem.product.price.toString(),
                      ),
                      size: U.TextSize.sm,
                    ),
                    const SizedBox(width: 8),
                    const U.Text(
                      '*',
                      size: U.TextSize.sm,
                      weight: U.TextWeight.bold,
                      color: U.Theme.primary,
                    ),
                    const SizedBox(width: 8),
                    U.Text(
                      shopItem.count.toString(),
                      size: U.TextSize.sm,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          U.Text(
            T.Convertor.textToToman(
              (shopItem.product.price * shopItem.count).toString(),
            ),
            size: U.TextSize.sm,
          ),
        ],
      ),
    );
  }
}
