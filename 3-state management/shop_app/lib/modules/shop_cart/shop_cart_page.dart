import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/app/cubit/app_cubit.dart';
import 'package:shop_app/modules/shop_cart/shop_item_card.dart';

class CartPage extends StatefulWidget {
//
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      buildWhen: (previous, current) => previous.shopCart != current.shopCart,
      builder: (context, state) {
        return state.shopCart.shopItems.isEmpty
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
                  children: state.shopCart.shopItems
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
