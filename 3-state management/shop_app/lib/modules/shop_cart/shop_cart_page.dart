import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/domains/store_repository/store_repository.dart';
import 'package:shop_app/modules/app/cubit/app_cubit.dart';
import 'package:shop_app/modules/shop_cart/shop_item_card.dart';

import 'cubit/shop_cart_cubit.dart';

class CartPage extends StatelessWidget {
//
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCartCubit(
        storeRepository: RepositoryProvider.of<StoreRepository>(context),
      ),
      child: BlocListener<AppCubit, AppState>(
        listener: (context, state) {
          if (state.selectedDes == 3) {
            var shopCartCubit = BlocProvider.of<ShopCartCubit>(context);
            shopCartCubit.init();
          }
        },
        child: BlocBuilder<ShopCartCubit, ShopCartState>(
          buildWhen: (previous, current) =>
              previous.shopItems != current.shopItems,
          builder: (context, state) {
            return state.shopItems.isEmpty
                ? Center(
                    child: Container(
                      width: 400,
                      child: Image.asset(
                        'assets/imgs/vectors/empty_cart.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  )
                : SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: state.shopItems
                          .expand(
                            (element) => [
                              ShopCardItem(shopItem: element),
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
