import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app_gorouter/domains/store_repository/models/shop_item.dart';
import 'package:shop_app_gorouter/domains/store_repository/store_repository.dart';
import 'package:shop_app_gorouter/modules/checkout/cubit/checkout_cubit.dart';

import 'package:shop_app_gorouter/ui_kit/ui_kit.dart' as U;

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
      child: Scaffold(
        backgroundColor: U.Theme.background,
        appBar: U.AppBar.secondary(
          title: 'تکمیل خرید',
          onBackPressed: () => GoRouter.of(context).pop(),
        ),
        body: BlocBuilder<CheckoutCubit, CheckoutState>(
          builder: (context, state) {
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
                                        size: 30,
                                        path: U.Images.orderIcon,
                                        color: U.Theme.primary,
                                      ),
                                      SizedBox(width: 5),
                                      U.Text(
                                        'سبدخرید',
                                        size: U.TextSize.xl,
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
                                                  const U.Divider.horizontal(),
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
                                              size: U.TextSize.lg,
                                              // weight: U.TextWeight.medium,
                                              color: U.Theme.primary,

                                              // color: U.Theme.outline2,
                                            ),
                                            U.Text(
                                              '${state.totalAmount}',
                                              size: U.TextSize.lg,
                                              weight: U.TextWeight.medium,
                                            ),
                                          ],
                                        ),
                                        const Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            U.Text(
                                              'جمع تخفیفات: ',
                                              size: U.TextSize.lg,
                                              color: U.Theme.primary,
                                            ),
                                            U.Text(
                                              '0',
                                              size: U.TextSize.lg,
                                              weight: U.TextWeight.medium,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const U.Text(
                                              'قابل پرداخت: ',
                                              size: U.TextSize.lg,
                                              color: U.Theme.primary,
                                            ),
                                            U.Text(
                                              '${state.totalAmount}',
                                              size: U.TextSize.lg,
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
                          const SizedBox.square(dimension: 12),
                          Expanded(
                            flex: 40,
                            child: U.Card(
                              padding: const EdgeInsets.all(18),
                              child: Column(
                                children: [
                                  const Row(
                                    children: [
                                      U.Image(
                                        size: 30,
                                        path: U.Images.paymentIcon,
                                        color: U.Theme.primary,
                                      ),
                                      SizedBox(width: 5),
                                      U.Text(
                                        'اطلاعات ارسال و پرداخت',
                                        size: U.TextSize.xl,
                                        weight: U.TextWeight.medium,
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                  const U.Divider.horizontal(
                                    color: U.Theme.secondary,
                                  ),
                                  const SizedBox(height: 10),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: Column(
                                        children: [
                                          const Spacer(),
                                          U.TextInput(
                                            title: 'آدرس تحویل',
                                            hintText: 'استان، شهر، منطقه...',
                                            controller: TextEditingController(),
                                          ),
                                          const Spacer(),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: U.TextInput(
                                                  title: 'کد تخفیف',
                                                  hintText: 'ABCXyz10%',
                                                  controller:
                                                      TextEditingController(),
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              U.IconButton(
                                                icon: U.Images.discountIcon,
                                                toolTip: 'اعمال کد تخفیف',
                                                onPressed: () {},
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          U.Button(
                                            title: 'پرداخت',
                                            size: U.ButtonSize.lg,
                                            onPressed: () {},
                                          ),
                                          // const Spacer(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
          },
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
    return Container(
      height: 60,
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          U.Image(
            path: shopItem.product.image,
          ),
          const SizedBox(width: 8),
          U.Text(
            shopItem.product.title,
            size: U.TextSize.lg,
          ),
          const SizedBox(width: 8),
          const U.Text(
            '*',
            size: U.TextSize.xl,
            weight: U.TextWeight.bold,
            color: U.Theme.primary,
          ),
          const SizedBox(width: 8),
          U.Text(
            shopItem.count.toString(),
            size: U.TextSize.lg,
          ),
          const Spacer(),
          U.Text(
            (shopItem.product.price * shopItem.count).toString(),
            size: U.TextSize.lg,
          ),
        ],
      ),
    );
  }
}
