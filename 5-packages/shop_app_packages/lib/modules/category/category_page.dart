import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_packages/domains/store_repository/store_repository.dart';
import 'package:shop_app_packages/modules/category/category_filter_btms.dart';
import 'package:shop_app_packages/modules/category/cubit/category_cubit.dart';
import 'package:shop_app_packages/modules/shop_cart/cubit/shop_cart_cubit.dart';
import 'package:shop_app_packages/modules/store/product_card.dart';
import 'package:shop_app_packages/ui_kit/ui_kit.dart' as U;

class CategoryPage extends StatelessWidget {
//
  static const route = 'category/:id';

  final int id;

  const CategoryPage({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ShopCartCubit(
            storeRepo: RepositoryProvider.of<StoreRepository>(context),
          ),
        ),
        BlocProvider(
          create: (context) => CategoryCubit(
            categoryId: id,
            storeRepo: RepositoryProvider.of<StoreRepository>(context),
          ),
        ),
      ],
      child: BlocBuilder<CategoryCubit, CategoryState>(
        buildWhen: (previous, current) =>
            previous.category != current.category ||
            previous.loading != current.loading,
        builder: (context, state) {
          var categoryCubit = BlocProvider.of<CategoryCubit>(context);
          return Scaffold(
            backgroundColor: U.Theme.background,
            appBar: U.AppBar.secondary(
              title: (state.category?.title) ?? 'دسته‌بندی',
              onBackPressed: () => Navigator.of(context).pop(),
              action: U.IconButton(
                icon: U.Images.filterIcon,
                onPressed: () => CategoryFilterBtms.show(
                  context,
                  categoryCubit: categoryCubit,
                ),
              ),
            ),
            body: SizedBox.expand(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: U.SearchInput(
                      controller: categoryCubit.searchCtrl,
                      onSearch: categoryCubit.onFilterApplyPressed,
                    ),
                  ),
                  Expanded(
                    child: state.loading
                        ? const U.Loading()
                        : BlocBuilder<CategoryCubit, CategoryState>(
                            buildWhen: (previous, current) =>
                                previous.products != current.products,
                            builder: (context, state) {
                              return GridView.builder(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      (MediaQuery.of(context).size.width / 190)
                                          .floor(),
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 20,
                                  childAspectRatio: 2 / 3.5,
                                ),
                                itemCount: state.products.length,
                                itemBuilder: (context, index) {
                                  return ProductCard(
                                    product: state.products[index],
                                  );
                                },
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
