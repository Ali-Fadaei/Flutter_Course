import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/favorites/cubit/favoriets_cubit.dart';
import 'favorites_card.dart';

class FavoritesPage extends StatelessWidget {
//
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      buildWhen: (previous, current) => previous.favorites != current.favorites,
      builder: (context, state) {
        return state.favorites.isEmpty
            ? Center(
                child: SizedBox(
                  width: 400,
                  child: Image.asset(
                    'assets/imgs/vectors/empty_fav.png',
                    fit: BoxFit.fill,
                  ),
                ),
              )
            : SingleChildScrollView(
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
    );
  }
}
