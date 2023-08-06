import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/domains/store_repository/store_repository.dart';
import 'package:shop_app/modules/app/cubit/app_cubit.dart';
import 'package:shop_app/modules/favorites/cubit/favoriets_cubit.dart';
import 'favorites_card.dart';

import 'package:shop_app/ui_kit/ui_kit.dart' as U;

class FavoritesPage extends StatelessWidget {
//
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritesCubit(
        storeRepo: RepositoryProvider.of<StoreRepository>(context),
      ),
      child: BlocListener<AppCubit, AppState>(
        listener: (context, state) {
          if (state.selectedDes == 1) {
            var favCubit = BlocProvider.of<FavoritesCubit>(context);
            favCubit.init();
          }
        },
        child: BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, state) {
            return state.loading
                ? U.Loading()
                : state.favorites.isEmpty
                    ? Center(
                        child: SizedBox(
                          width: 400,
                          child: U.Image(
                            path: 'assets/imgs/vectors/empty_fav.png',
                          ),
                        ),
                      )
                    : SingleChildScrollView(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: state.favorites
                              .expand(
                                (element) => [
                                  FavoritesCard(product: element),
                                  SizedBox(height: 15)
                                ],
                              )
                              .toList(),
                        ),
                      );
          },
        ),
      ),
    );
  }
}
