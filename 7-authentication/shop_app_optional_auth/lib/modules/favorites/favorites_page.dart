import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app_optional_auth/modules/app/cubit/app_cubit.dart';
import 'package:shop_app_optional_auth/modules/auth/auth_otp_page.dart';
import 'package:shop_app_optional_auth/modules/favorites/cubit/favoriets_cubit.dart';
import 'package:shop_app_optional_auth/modules/home/cubit/home_cubit.dart';
import 'favorites_card.dart';

import 'package:shop_app_optional_auth/ui_kit/ui_kit.dart' as U;

class FavoritesPage extends StatelessWidget {
//
  static const route = '/favorites';

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
                onMenuPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                onNotifPressed: () {},
              ),
              Expanded(
                child: state.loading && state.favorites.isEmpty
                    ? const U.Loading()
                    : state.favorites.isEmpty
                        ? Column(
                            children: [
                              const Center(
                                child: SizedBox(
                                  width: 400,
                                  child: U.Image(
                                    path: 'assets/imgs/vectors/empty_fav.png',
                                  ),
                                ),
                              ),
                              BlocBuilder<AppCubit, AppState>(
                                buildWhen: (previous, current) =>
                                    previous.jwtAuthCheck !=
                                    current.jwtAuthCheck,
                                builder: (context, state) {
                                  return !state.jwtAuthCheck
                                      ? Container(
                                          width: 500,
                                          padding: const EdgeInsets.all(8.0),
                                          child: U.OutlinedButton(
                                            title: 'ورود به حساب کاربری',
                                            onPressed: () =>
                                                GoRouter.of(context).goNamed(
                                              AuthOtpPage.route,
                                            ),
                                          ),
                                        )
                                      : const SizedBox();
                                },
                              )
                            ],
                          )
                        : SingleChildScrollView(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              children: [
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
                              ],
                            ),
                          ),
              ),
            ],
          );
        },
      ),
    );
  }
}
