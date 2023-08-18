import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app_gorouter/domains/store_repository/store_repository.dart';
import 'package:shop_app_gorouter/modules/search/cubit/search_cubit.dart';
import 'package:shop_app_gorouter/modules/search/search_filter_btms.dart';
import 'package:shop_app_gorouter/modules/shop_cart/cubit/shop_cart_cubit.dart';
import 'package:shop_app_gorouter/modules/store/product_card.dart';

import 'package:shop_app_gorouter/ui_kit/ui_kit.dart' as U;

class SearchPage extends StatelessWidget {
//
  static const route = 'search';

  final String? initialSearchTitle;

  const SearchPage({
    super.key,
    this.initialSearchTitle = '',
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchCubit(
            initialSearchTitle: initialSearchTitle,
            storeRepo: RepositoryProvider.of<StoreRepository>(context),
          ),
        ),
        BlocProvider(
          create: (context) => ShopCartCubit(
            storeRepo: RepositoryProvider.of<StoreRepository>(context),
          ),
        ),
      ],
      child: Builder(builder: (context) {
        var searchCubit = BlocProvider.of<SearchCubit>(context);
        return Scaffold(
          body: Container(
            color: U.Theme.background,
            child: Column(
              children: [
                U.AppBar.secondary(
                  title: 'جستجوی محصولات',
                  onBackPressed: () => GoRouter.of(context).pop(),
                  action: IconButton(
                    onPressed: () => SearchFilterBtms.show(
                      context,
                      searchCubit: searchCubit,
                    ),
                    icon: const U.Image(path: U.Images.filterIcon),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: U.SearchInput(
                    controller: searchCubit.searchCtrl,
                    onSearch: searchCubit.onFilterApplyPressed,
                  ),
                ),
                Expanded(
                  child: BlocBuilder<SearchCubit, SearchState>(
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
          ),
        );
      }),
    );
  }
}
