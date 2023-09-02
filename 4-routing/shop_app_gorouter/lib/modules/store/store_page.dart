import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app_gorouter/domains/store_repository/store_repository.dart';
import 'package:shop_app_gorouter/modules/categories/categories_card.dart';
import 'package:shop_app_gorouter/modules/categories/cubit/categories_cubit.dart';
import 'package:shop_app_gorouter/modules/home/cubit/home_cubit.dart';
import 'package:shop_app_gorouter/modules/search/search_page.dart';
import 'package:shop_app_gorouter/modules/shop_cart/cubit/shop_cart_cubit.dart';
import 'package:shop_app_gorouter/modules/store/cubit/store_cubit.dart';
import 'package:shop_app_gorouter/modules/store/product_btms.dart';
import 'package:shop_app_gorouter/modules/store/product_card.dart';
import 'package:shop_app_gorouter/ui_kit/ui_kit.dart' as U;

class StorePage extends StatelessWidget {
//
  static const route = '/store';

  final int? initialProductId;

  const StorePage({
    super.key,
    this.initialProductId,
  });

  @override
  Widget build(BuildContext context) {
    var storeRepository = RepositoryProvider.of<StoreRepository>(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => StoreCubit(
            storeRepo: storeRepository,
            initialProductId: initialProductId,
          ),
        ),
        BlocProvider(
          create: (context) => CategoriesCubit(storeRepo: storeRepository),
        ),
        BlocProvider(
          create: (context) => ShopCartCubit(
            storeRepo: storeRepository,
          ),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<StoreCubit, StoreState>(
            listenWhen: (previous, current) =>
                previous.initialProduct != current.initialProduct,
            listener: (context, state) {
              if (state.initialProduct != null) {
                ProductBottomSheet.show(context,
                    product: state.initialProduct!);
              }
            },
          ),
          BlocListener<HomeCubit, HomeState>(
            listenWhen: (previous, current) =>
                previous.selectedDes != current.selectedDes,
            listener: (context, state) {
              if (state.selectedDes == 2) {
                var shopCartCubit = BlocProvider.of<ShopCartCubit>(context);
                shopCartCubit.init();
              }
            },
          ),
        ],
        child: Builder(builder: (context) {
          var storeCubit = BlocProvider.of<StoreCubit>(context);
          return Column(
            children: [
              U.AppBar.primary(
                onMenuPressed: () {
                  Scaffold.of(context).openDrawer();
                },
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
                            hintText: 'جستجوی محصول',
                            controller: storeCubit.searchCtrl,
                            onSearch: () async {
                              var temp = storeCubit.searchCtrl.text;
                              if (temp.isNotEmpty) {
                                storeCubit.searchCtrl.clear();
                                GoRouter.of(context).goNamed(
                                  SearchPage.route,
                                  queryParameters: {
                                    'title': temp,
                                  },
                                );
                              }
                            },
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
                              'دسته‌بندی‌های پر طرفدار',
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
                      //Hot Categories listview
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
                                              pushRoute: true,
                                              category: element,
                                            ),
                                            if (element ==
                                                state.categories.last)
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
                                            if (element ==
                                                state.products.reversed.last)
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
          );
        }),
      ),
    );
  }
}
