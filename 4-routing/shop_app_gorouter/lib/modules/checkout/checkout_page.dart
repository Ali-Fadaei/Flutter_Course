import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app_gorouter/domains/store_repository/store_repository.dart';
import 'package:shop_app_gorouter/modules/checkout/cubit/checkout_cubit.dart';
import 'package:shop_app_gorouter/modules/shop_cart/cubit/shop_cart_cubit.dart';

import 'package:shop_app_gorouter/ui_kit/ui_kit.dart' as U;

class CheckoutPage extends StatelessWidget {
//
  static const route = 'checkout';

  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CheckoutCubit(
            storeRepo: RepositoryProvider.of<StoreRepository>(context),
          ),
        ),
        BlocProvider(
          create: (context) => ShopCartCubit(
            storeRepo: RepositoryProvider.of<StoreRepository>(context),
          ),
        ),
      ],
      child: Scaffold(
        appBar: U.AppBar.secondary(
          title: 'تکمیل خرید',
          onBackPressed: () => GoRouter.of(context).pop(),
        ),
        body: const Column(
          children: [],
        ),
      ),
    );
  }
}
