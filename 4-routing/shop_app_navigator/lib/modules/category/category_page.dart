import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_navigator/domains/store_repository/store_repository.dart';
import 'package:shop_app_navigator/modules/category/category_filter_btms.dart';
import 'package:shop_app_navigator/modules/category/cubit/category_cubit.dart';
import 'package:shop_app_navigator/modules/shop_cart/cubit/shop_cart_cubit.dart';
import 'package:shop_app_navigator/modules/store/product_card.dart';
import 'package:shop_app_navigator/ui_kit/ui_kit.dart' as U;

class CategoryPage extends StatelessWidget {
  ///
  static const route = '/category';

  final int categoryId;

  final String categoryTitle;

  const CategoryPage({
    super.key,
    required this.categoryId,
    this.categoryTitle = 'دسته‌بندی',
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryCubit(
            categoryId: categoryId,
            storeRepo: RepositoryProvider.of<StoreRepository>(context),
          ),
        ),
        BlocProvider(
          create: (context) => ShopCartCubit(
            storeRepo: RepositoryProvider.of<StoreRepository>(context),
          ),
        ),
      ],
      child: BlocBuilder<CategoryCubit, CategoryState>(
        buildWhen: (previous, current) => previous.category != current.category,
        builder: (context, state) {
          var categoryCubit = BlocProvider.of<CategoryCubit>(context);
          return Container(
            color: U.Theme.background,
            child: Column(
              children: [
                U.AppBar.secondary(
                  title: state.category?.title ?? categoryTitle,
                  onBackPressed: () => Navigator.of(context).pop(),
                  action: IconButton(
                    onPressed: () => CategoryFilterBtms.show(
                      context,
                      categoryCubit: categoryCubit,
                    ),
                    icon: const U.Image(path: U.Images.filterIcon),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: U.SearchInput(
                    controller: categoryCubit.searchCtrl,
                    onSearch: categoryCubit.onFilterApplyPressed,
                  ),
                ),
                Expanded(
                  child: BlocBuilder<CategoryCubit, CategoryState>(
                    builder: (context, state) {
                      return state.loading
                          ? const U.Loading()
                          : GridView.builder(
                              itemCount: state.products.length,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    (MediaQuery.of(context).size.width / 220)
                                        .floor(),
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 20,
                                childAspectRatio: 2 / 3.2,
                              ),
                              itemBuilder: (context, index) {
                                return ProductCard(
                                    product: state.products[index]);
                              },
                            );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
