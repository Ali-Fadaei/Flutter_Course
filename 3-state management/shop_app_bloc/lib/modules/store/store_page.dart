import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_bloc/modules/app/cubit/app_cubit.dart';
import 'package:shop_app_bloc/modules/shop_cart/cubit/shop_cart_cubit.dart';
import 'package:shop_app_bloc/modules/store/cubit/store_cubit.dart';
import 'package:shop_app_bloc/modules/store/product_card.dart';
import 'package:shop_app_bloc/ui_kit/ui_kit.dart' as U;

class StorePage extends StatelessWidget {
//

  const StorePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppCubit, AppState>(
      listener: (context, state) {
        if (state.selectedDes == 2) {
          BlocProvider.of<StoreCubit>(context).init(loading: false);
          BlocProvider.of<ShopCartCubit>(context).init();
        }
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            //witeSpace
            const SizedBox(height: 15),
            // search bar
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: U.SearchInput(
                  controller: TextEditingController(),
                  hintText: 'جستجوی محصول',
                  onSearch: () {},
                ),
              ),
            ),
            //witeSpace
            const SizedBox(height: 30),
            // Exclusive Offers
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  U.Text(
                    'پیشنهادهای ویژه',
                    color: U.Theme.secondary,
                    font: U.TextFont.bYekan,
                    size: U.TextSize.xxl,
                    weight: U.TextWeight.bold,
                  ),
                  Spacer(),
                ],
              ),
            ),
            //witeSpace
            const SizedBox(height: 20),
            //products listview
            SizedBox(
              height: 320,
              child: BlocBuilder<StoreCubit, StoreState>(
                builder: (context, state) {
                  return state.loading
                      ? const U.Loading()
                      : ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: state.products
                              .expand(
                                (element) => [
                                  const SizedBox(width: 8),
                                  ProductCard(product: element),
                                  if (element == state.products.last)
                                    const SizedBox(width: 8),
                                ],
                              )
                              .toList(),
                        );
                },
              ),
            ),
            //witeSpace
            const SizedBox(height: 30),
            //Best Sellers
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  U.Text(
                    'پرفروش‌ها',
                    color: U.Theme.secondary,
                    font: U.TextFont.bYekan,
                    size: U.TextSize.xxl,
                    weight: U.TextWeight.bold,
                  ),
                  Spacer(),
                ],
              ),
            ),
            //witeSpace
            const SizedBox(height: 20),
            //Best Sellers listview
            SizedBox(
              height: 320,
              child: BlocBuilder<StoreCubit, StoreState>(
                builder: (context, state) {
                  return state.loading
                      ? const U.Loading()
                      : ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: state.products.reversed
                              .expand(
                                (element) => [
                                  const SizedBox(width: 8),
                                  ProductCard(product: element),
                                  if (element == state.products.reversed.last)
                                    const SizedBox(width: 8),
                                ],
                              )
                              .toList(),
                        );
                },
              ),
            ),
            //witeSpace
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
