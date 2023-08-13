import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_routing/domains/store_repository/models/category.dart';
import 'package:shop_app_routing/domains/store_repository/models/product.dart';
import 'package:shop_app_routing/domains/store_repository/store_repository.dart';
import 'package:shop_app_routing/modules/category/category_filter_btms.dart';
import 'package:shop_app_routing/modules/shop_cart/cubit/shop_cart_cubit.dart';
import 'package:shop_app_routing/modules/store/product_card.dart';
import 'package:shop_app_routing/ui_kit/ui_kit.dart' as U;

class CategoryPage extends StatelessWidget {
//
  static const route = '/category';

  final int id;

  const CategoryPage({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCartCubit(
        storeRepo: RepositoryProvider.of<StoreRepository>(context),
      ),
      child: Scaffold(
        appBar: U.AppBar.secondary(
          title: ' دسته‌بندی $id',
          onBackPressed: () => Navigator.of(context).pop(),
          action: IconButton(
            onPressed: () {
              CategoryFilterBtms.show(context);
            },
            icon: const U.Image(
              path: U.Images.filterIcon,
            ),
          ),
        ),
        body: SizedBox.expand(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: U.SearchInput(
                  controller: TextEditingController(),
                  onSearch: () {},
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        (MediaQuery.of(context).size.width / 230).floor(),
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 2 / 3.2,
                  ),
                  itemCount: 40,
                  itemBuilder: (context, index) {
                    return const ProductCard(
                      product: Product(
                        id: 0,
                        title: 'tes',
                        rating: 5,
                        price: 5656465456,
                        image: 'assets/imgs/products/Z_Fold_4.png',
                        description: '',
                        category: Category(
                          id: 0,
                          title: 'dsad',
                          image: '',
                          color: Colors.cyan,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
