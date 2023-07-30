import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/shop_cart/shop_item_card.dart';

import 'cubit/shop_cart_cubit.dart';

class CartPage extends StatelessWidget {
//
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCartCubit, ShopCartState>(
      buildWhen: (previous, current) => previous.shopItems != current.shopItems,
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
    );
  }
}
