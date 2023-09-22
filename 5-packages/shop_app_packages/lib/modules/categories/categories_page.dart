import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app_packages/domains/store_repository/store_repository.dart';
import 'package:shop_app_packages/modules/categories/categories_card.dart';
import 'package:shop_app_packages/modules/categories/cubit/categories_cubit.dart';
import 'package:shop_app_packages/modules/search/search_page.dart';
import 'package:shop_app_packages/ui_kit/ui_kit.dart' as U;

class CategoriesPage extends StatelessWidget {
//
  static const route = '/categories';

  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => CategoriesCubit(
        storeRepo: RepositoryProvider.of<StoreRepository>(context),
      ),
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          var categoryCubit = BlocProvider.of<CategoriesCubit>(context);
          return SizedBox.expand(
            child: Container(
              color: U.Theme.background,
              child: Column(
                children: [
                  U.AppBar.primary(
                    onMenuPressed: () => Scaffold.of(context).openDrawer(),
                    onNotifPressed: () {},
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1000),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: U.SearchInput(
                        controller: categoryCubit.searchCtrl,
                        hintText: 'جستجوی محصول',
                        onSearch: () {
                          var temp = categoryCubit.searchCtrl.text;
                          if (temp.isNotEmpty) {
                            categoryCubit.searchCtrl.clear();
                            GoRouter.of(context)
                                .pushNamed(SearchPage.route, pathParameters: {
                              'searchTitle': temp,
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Expanded(
                    child: state.loading
                        ? const U.Loading()
                        : GridView.count(
                            crossAxisCount: (screenWidth / 180).floor(),
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            childAspectRatio: 2 / 3,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            children: state.categories.map((e) {
                              return CategoryCard(category: e);
                            }).toList(),
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
