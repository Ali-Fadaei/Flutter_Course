import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app_data_providers/domains/store_repository/store_repository.dart';
import 'package:shop_app_data_providers/modules/search/cubit/search_cubit.dart';
import 'package:shop_app_data_providers/modules/search/search_filter_btms.dart';
import 'package:shop_app_data_providers/modules/store/product_card.dart';

import 'package:shop_app_data_providers/ui_kit/ui_kit.dart' as U;

class SearchPage extends StatelessWidget {
//
  static const route = 'search/:title';

  final String searchTitle;

  const SearchPage({
    super.key,
    required this.searchTitle,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchCubit(
            initialSearchTitle: searchTitle,
            storeRepo: RepositoryProvider.of<StoreRepository>(context),
          ),
        ),
      ],
      child: Builder(builder: (context) {
        var searchCubit = BlocProvider.of<SearchCubit>(context);
        return Scaffold(
          backgroundColor: U.Theme.background,
          appBar: U.AppBar.secondary(
            title: 'جستجوی محصولات',
            onBackPressed: () => GoRouter.of(context).pop(),
            action: U.IconButton(
              onPressed: () => SearchFilterBtms.show(
                context,
                searchCubit: searchCubit,
              ),
              icon: U.Images.filterIcon,
            ),
          ),
          body: SizedBox.expand(
            child: Column(
              children: [
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
                                    (MediaQuery.of(context).size.width / 190)
                                        .floor(),
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 20,
                                childAspectRatio: 2 / 3.5,
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
