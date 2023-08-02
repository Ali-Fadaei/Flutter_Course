import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/domains/store_repository/models/product.dart';
import 'package:shop_app/modules/favorites/cubit/favoriets_cubit.dart';
import '../store/product_btms.dart';

class FavoritesCard extends StatelessWidget {
//
  final Product product;

  const FavoritesCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    var favoritesCubit = BlocProvider.of<FavoritesCubit>(context);
    return GestureDetector(
      onTap: () => ProductBottomSheet.show(
        context,
        product: product,
        favoritesCubit: favoritesCubit,
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 120,
                child: Image.asset(
                  product.image,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF181725),
                      fontSize: 16,
                      fontFamily: 'IRANSans',
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.10,
                    ),
                  ),
                  Text(
                    '${product.price}تومان',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF7C7C7C),
                      fontSize: 14,
                      fontFamily: 'IRANSans',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Spacer(),
              IconButton(
                onPressed: () => favoritesCubit.onFavoriatePressed(product),
                icon: Icon(Icons.favorite),
              )
            ],
          ),
        ),
      ),
    );
  }
}
