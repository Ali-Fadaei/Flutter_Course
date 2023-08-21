import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_gorouter/domains/store_repository/store_repository.dart';
import 'package:shop_app_gorouter/modules/categories/categories_card.dart';
import 'package:shop_app_gorouter/modules/categories/cubit/categories_cubit.dart';
import 'package:shop_app_gorouter/modules/shop_cart/cubit/shop_cart_cubit.dart';
import 'package:shop_app_gorouter/modules/store/cubit/store_cubit.dart';
import 'package:shop_app_gorouter/modules/store/product_card.dart';
import 'package:shop_app_gorouter/ui_kit/ui_kit.dart' as U;

class StorePage extends StatelessWidget {
//
  static const route = '/store';

  const StorePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var storeRepository = RepositoryProvider.of<StoreRepository>(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoriesCubit(storeRepo: storeRepository),
        ),
        BlocProvider(
          create: (context) => StoreCubit(storeRepo: storeRepository),
        ),
        BlocProvider(
          create: (context) => ShopCartCubit(
            storeRepo: storeRepository,
          ),
        ),
      ],
      child: Container(
        color: U.Theme.background,
        child: Column(
          children: [
            U.AppBar.primary(
              onMenuPressed: () => Scaffold.of(context).openDrawer(),
              onNotifPressed: () {},
            ),
            Expanded(
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
                            size: U.TextSize.xxxl,
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
                      height: 350,
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
                    //Best categories
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          U.Text(
                            'دسته‌بندی‌های پرطرفدار',
                            color: U.Theme.secondary,
                            font: U.TextFont.bYekan,
                            size: U.TextSize.xxxl,
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
                      height: 200,
                      child: BlocBuilder<CategoriesCubit, CategoriesState>(
                        builder: (context, state) {
                          return state.loading
                              ? const U.Loading()
                              : ListView(
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  children: state.categories
                                      .expand(
                                        (element) => [
                                          const SizedBox(width: 8),
                                          CategoryCard(
                                            push: true,
                                            // fromStore: true,
                                            category: element,
                                          ),
                                          if (element == state.categories.last)
                                            const SizedBox(width: 8),
                                        ],
                                      )
                                      .toList(),
                                );
                        },
                      ),
                    ),
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
                            size: U.TextSize.xxxl,
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
                      height: 350,
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
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
