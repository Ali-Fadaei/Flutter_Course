import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_navigator/domains/store_repository/store_repository.dart';
import 'package:shop_app_navigator/modules/categories/categories_card.dart';
import 'package:shop_app_navigator/modules/categories/cubit/categories_cubit.dart';
import 'package:shop_app_navigator/ui_kit/ui_kit.dart' as U;

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
          return SizedBox.expand(
            child: Column(
              children: [
                U.AppBar.primary(
                  onMenuPressed: () {},
                  onNotifPressed: () {},
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
