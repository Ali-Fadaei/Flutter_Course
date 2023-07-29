import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/domains/store_repository/models/shop_cart.dart';
import 'package:shop_app/modules/app/cubit/app_cubit.dart';

import '../store/product_btms.dart';

class ShopCardItem extends StatelessWidget {
//
  final ShopItem shopItem;

  const ShopCardItem({
    super.key,
    required this.shopItem,
  });

  @override
  Widget build(BuildContext context) {
    var appCubit = BlocProvider.of<AppCubit>(context);
    return GestureDetector(
      onTap: () => ProductBottomSheet.show(
        context,
        product: shopItem.product,
        appCubit: appCubit,
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              width: 120,
              child: Image.asset(
                shopItem.product.image,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shopItem.product.title,
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () => appCubit
                          .onRemovefromShopCartPressed(shopItem.product),
                      icon: Icon(
                        Icons.remove,
                        size: 24,
                        color: Colors.grey,
                      ),
                    ),

                    SizedBox(width: 10),
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 222, 222, 222),
                            width: 2,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text(
                          shopItem.count.toString(),
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    IconButton(
                      onPressed: () =>
                          appCubit.onAddtoShopCartPressed(shopItem.product),
                      icon: Icon(
                        Icons.add,
                        size: 24,
                        color: Color(0xFFF34E4E),
                      ),
                    ),
                    // Text(
                    // " + ",
                    // style: TextStyle(
                    // fontSize: 20,
                    // ),
                    // )
                  ],
                ),
              ],
            ),
            Spacer(),
            Text(
              '${shopItem.product.price * shopItem.count} T',
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ]),
        ),
      ),
    );
  }
}
