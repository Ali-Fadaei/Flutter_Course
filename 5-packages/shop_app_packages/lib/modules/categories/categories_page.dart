import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app_packages/modules/categories/categories_card.dart';
import 'package:shop_app_packages/modules/categories/cubit/categories_cubit.dart';
import 'package:shop_app_packages/modules/home/cubit/home_cubit.dart';
import 'package:shop_app_packages/modules/search/search_page.dart';
import 'package:shop_app_packages/ui_kit/ui_kit.dart' as U;

class CategoriesPage extends StatelessWidget {
//
  static const route = '/categories';

  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state.selectedDes == 4) {
          BlocProvider.of<CategoriesCubit>(context).init(loading: false);
        }
      },
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          var categoriesCubit = BlocProvider.of<CategoriesCubit>(context);
          return SizedBox.expand(
            child: Container(
              color: U.Theme.background,
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
                            pathParameters: {'title': temp},
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
            ),
          );
        },
      ),
    );
  }
}
