import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/domains/store_repository/store_repository.dart';
import 'package:shop_app/modules/shop_cart/cubit/shop_cart_cubit.dart';
import 'package:shop_app/modules/store/cubit/store_cubit.dart';
import 'package:shop_app/modules/store/product_card.dart';
import 'package:shop_app/ui_kit/ui_kit.dart' as U;

class StorePage extends StatelessWidget {
//

  const StorePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var storeRepository = RepositoryProvider.of<StoreRepository>(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => StoreCubit(storeRepo: storeRepository),
        ),
        BlocProvider(
          create: (context) => ShopCartCubit(
            storeRepository: storeRepository,
          ),
        ),
      ],
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 25),

            /// search bar
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 1000),
              child: U.TextInput(
                title: 'آدرس',
                hintText: 'ولیعصر...........',
                controller: TextEditingController(),
              ),
              // child: U.SearchInput(
              //   controller: TextEditingController(),
              //   onSearch: (text) {},
              // ),
            ),
            // U.OutlinedButton(
            //   onPressed: () {},
            //   color: U.OutlinedButtonColor.secondary,
            //   title: 'dsadasd',
            // ),
            // U.IconButton(
            //   icon: Icons.ac_unit,
            //   onPressed: () {},
            //   title: 'dsad',
            // ),
            // Container(
            //   color: Colors.white,
            //   child: TextField(
            //     enabled: false,
            //     decoration: InputDecoration(
            //       focusColor: Colors.red,
            //       hoverColor: Colors.red,
            //       filled: false,
            //       hintText: 'Search Here',
            //       prefixIcon: Padding(
            //         padding: const EdgeInsetsDirectional.only(start: 12),
            //         child: Icon(Icons.search, color: Colors.black),
            //       ),
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(15),
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(height: 50),

            /// Exclusive Offers
            Row(
              children: [
                Text(
                  'Exclusive Offers',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFF100D39),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                //todo: make styles
                Text(
                  'all',
                  style: TextStyle(
                    color: Color(0xFFF34E4E),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 350,
              child: BlocBuilder<StoreCubit, StoreState>(
                builder: (context, state) {
                  return state.loading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          children: state.products
                              .expand(
                                (element) => [
                                  ProductCard(product: element),
                                  SizedBox(width: 8),
                                ],
                              )
                              .toList(),
                        );
                },
              ),
            ),
            SizedBox(height: 20),

            /// Popular Options
            Row(
              children: [
                Text(
                  'BestPrice',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFF100D39),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  'all',
                  style: TextStyle(
                    color: Color(0xFFF34E4E),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 350,
              child: BlocBuilder<StoreCubit, StoreState>(
                builder: (context, state) {
                  return state.loading
                      ? Center(child: CircularProgressIndicator())
                      : ListView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          children: state.products
                              .expand(
                                (element) => [
                                  ProductCard(product: element),
                                  SizedBox(width: 8),
                                ],
                              )
                              .toList(),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
