import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app/domains/store_repository/store_repository.dart';
import 'package:shop_app/modules/category/category_filter_btms.dart';
import 'package:shop_app/modules/category/cubit/category_cubit.dart';
import 'package:shop_app/modules/store/product_card.dart';
import 'package:shop_app/ui_kit/ui_kit.dart' as U;

class CategoryPage extends StatelessWidget {
  ///
  static const route = 'category/:id';

  final int categoryId;

  final String categoryTitle;

  const CategoryPage({
    super.key,
    required this.categoryId,
    this.categoryTitle = 'دسته‌بندی',
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(
        categoryId: categoryId,
        storeRepo: RepositoryProvider.of<StoreRepository>(context),
      ),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        buildWhen: (previous, current) => previous.category != current.category,
        builder: (context, state) {
          var categoryCubit = BlocProvider.of<CategoryCubit>(context);
          return Scaffold(
            backgroundColor: U.Theme.background,
            appBar: U.AppBar.secondary(
              title: state.category?.title ?? categoryTitle,
              onBackPressed: () => GoRouter.of(context).pop(),
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
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
                                      (MediaQuery.of(context).size.width / 190)
                                          .floor(),
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 20,
                                  childAspectRatio: 2 / 3.5,
                                ),
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
