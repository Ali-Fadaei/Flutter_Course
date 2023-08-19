import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app_gorouter/domains/store_repository/store_repository.dart';
import 'package:shop_app_gorouter/modules/categories/categories_card.dart';
import 'package:shop_app_gorouter/modules/categories/cubit/categories_cubit.dart';
import 'package:shop_app_gorouter/modules/search/search_page.dart';
import 'package:shop_app_gorouter/ui_kit/ui_kit.dart' as U;

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
          var categoriesCubit = BlocProvider.of<CategoriesCubit>(context);
          return SizedBox.expand(
            child: Column(
              children: [
                U.AppBar.primary(
                  onMenuPressed: () {},
                  onNotifPressed: () {},
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: U.SearchInput(
                    hintText: 'جستجوی محصول',
                    controller: categoriesCubit.searchCtrl,
                    onSearch: () {
                      var temp = categoriesCubit.searchCtrl.text;
                      if (temp.isNotEmpty) {
                        categoriesCubit.searchCtrl.clear();
                        GoRouter.of(context).pushNamed(
                          SearchPage.route,
                          queryParameters: {'title': temp},
                        );
                      }
                    },
                  ),
                ),
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
          );
        },
      ),
    );
  }
}
