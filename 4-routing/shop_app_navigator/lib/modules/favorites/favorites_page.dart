import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_navigator/modules/favorites/cubit/favoriets_cubit.dart';
import 'package:shop_app_navigator/modules/home/cubit/home_cubit.dart';
import 'favorites_card.dart';

import 'package:shop_app_navigator/ui_kit/ui_kit.dart' as U;

class FavoritesPage extends StatelessWidget {
//
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state.selectedDes == 1) {
          var favCubit = BlocProvider.of<FavoritesCubit>(context);
          favCubit.init();
        }
      },
      child: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          return Column(
            children: [
              U.AppBar.primary(
                onMenuPressed: () {},
                onNotifPressed: () {},
              ),
              Expanded(
                child: state.loading && state.favorites.isEmpty
                    ? const U.Loading()
                    : state.favorites.isEmpty
                        ? const Center(
                            child: SizedBox(
                              width: 400,
                              child: U.Image(
                                path: 'assets/imgs/vectors/empty_fav.png',
                              ),
                            ),
                          )
                        : SingleChildScrollView(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            physics: const BouncingScrollPhysics(),
                            child: Column(children: [
                              ...state.favorites
                                  .expand(
                                    (element) => [
                                      FavoritesCard(product: element),
                                      const SizedBox(height: 15)
                                    ],
                                  )
                                  .toList(),
                              if (state.loading) ...[
                                const SizedBox(height: 15),
                                const U.Loading()
                              ],
                            ]),
                          ),
              ),
            ],
          );
        },
      ),
    );
  }
}
