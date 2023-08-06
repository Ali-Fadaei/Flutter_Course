import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/domains/store_repository/store_repository.dart';
import 'package:shop_app/modules/shop_cart/cubit/shop_cart_cubit.dart';
import 'package:shop_app/modules/store/cubit/store_cubit.dart';
import 'package:shop_app/modules/store/product_card.dart';
import 'package:shop_app/ui_kit/ui_kit.dart' as U;

class StorePage extends StatelessWidget {
//

  const StorePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var storeRepository = RepositoryProvider.of<StoreRepository>(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => StoreCubit(storeRepo: storeRepository),
        ),
        BlocProvider(
          create: (context) => ShopCartCubit(
            storeRepository: storeRepository,
          ),
        ),
      ],
      child: SingleChildScrollView(
        child: Column(
          children: [
            //witeSpace
            SizedBox(height: 15),
            // search bar
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 1000),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: U.SearchInput(
                  controller: TextEditingController(),
                  hintText: 'جستجوی کنید',
                  onSearch: (text) => {},
                ),
              ),
            ),
            //witeSpace
            SizedBox(height: 30),
            // Exclusive Offers
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  U.Text(
                    'پیشنهادهای ویژه',
                    color: U.Theme.secondary,
                    font: U.TextFont.bYekan,
                    size: U.TextSize.xxxl,
                    weight: U.TextWeight.bold,
                  ),
                  Spacer(),
                  //todo: make styles
                  U.Text(
                    "همه",
                    color: U.Theme.primary,
                    font: U.TextFont.iranSans,
                    size: U.TextSize.lg,
                    weight: U.TextWeight.medium,
                  ),
                ],
              ),
            ),
            //witeSpace
            SizedBox(height: 20),
            //products listview
            SizedBox(
              height: 350,
              child: BlocBuilder<StoreCubit, StoreState>(
                builder: (context, state) {
                  return state.loading
                      ? U.Loading()
                      : ListView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          children: state.products
                              .expand(
                                (element) => [
                                  SizedBox(width: 8),
                                  ProductCard(product: element),
                                  if (element == state.products.last)
                                    SizedBox(width: 8),
                                ],
                              )
                              .toList(),
                        );
                },
              ),
            ),
            //witeSpace
            SizedBox(height: 30),
            //Best Sellers
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  U.Text(
                    'پرفروش‌ها',
                    color: U.Theme.secondary,
                    font: U.TextFont.bYekan,
                    size: U.TextSize.xxxl,
                    weight: U.TextWeight.bold,
                  ),
                  Spacer(),
                  U.Text(
                    "همه",
                    color: U.Theme.primary,
                    font: U.TextFont.iranSans,
                    size: U.TextSize.lg,
                    weight: U.TextWeight.medium,
                  ),
                ],
              ),
            ),
            //witeSpace
            SizedBox(height: 20),
            //Best Sellers listview
            SizedBox(
              height: 350,
              child: BlocBuilder<StoreCubit, StoreState>(
                builder: (context, state) {
                  return state.loading
                      ? U.Loading()
                      : ListView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          children: state.products.reversed
                              .expand(
                                (element) => [
                                  SizedBox(width: 8),
                                  ProductCard(product: element),
                                  if (element == state.products.last)
                                    SizedBox(width: 8),
                                ],
                              )
                              .toList(),
                        );
                },
              ),
            ),
            //witeSpace
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
