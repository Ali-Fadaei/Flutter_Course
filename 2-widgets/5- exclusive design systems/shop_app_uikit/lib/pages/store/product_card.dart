import 'package:flutter/material.dart';
import 'package:shop_app_uikit/models/product.dart';
import 'package:shop_app_uikit/models/shop_cart.dart';
import 'package:shop_app_uikit/pages/store/product_btms.dart';
import 'package:shop_app_uikit/ui_kit/ui_kit.dart' as U;

class ProductCard extends StatelessWidget {
//
  final Product product;

  final ShopCart shopCart;

  final List<Product> favorites;

  final void Function(Product) onFavoritePressed;

  final void Function(Product product) onAddtoShopCartPressed;

  final void Function(Product product) onRemovefromShopCartPressed;

  const ProductCard({
    super.key,
    required this.product,
    required this.favorites,
    required this.shopCart,
    required this.onFavoritePressed,
    required this.onAddtoShopCartPressed,
    required this.onRemovefromShopCartPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ProductBottomSheet.show(
        context,
        product: product,
        favorites: favorites,
        shopCart: shopCart,
        onFavoritePressed: onFavoritePressed,
        onAddtoShopCartPressed: onAddtoShopCartPressed,
        onRemovetoShopCartPressed: onRemovefromShopCartPressed,
      ),
      child: U.Card(
        width: 185,
        height: 350,
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product.image),
            SizedBox(height: 15),
            U.Text(
              product.title,
              size: U.TextSize.md,
              weight: U.TextWeight.bold,
            ),
            SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                U.Text(
                  'امتیاز: ${product.rating}',
                  size: U.TextSize.sm,
                  color: U.Theme.outline2,
                  weight: U.TextWeight.bold,
                ),
                Icon(
                  Icons.star,
                  size: 14,
                  color: Colors.amber.shade700,
                ),
              ],
            ),
            Spacer(),
            Row(
              children: [
                U.IconButton(
                  toolTip: 'اضافه کردن به سبد خرید',
                  icon: U.Images.addIcon,
                  size: U.IconButtonSize.sm,
                  color: U.IconButtonColor.primary,
                  onPressed: () => onAddtoShopCartPressed(product),
                ),
                Spacer(),
                U.Text(
                  '${product.price} تومان',
                  font: U.TextFont.iranSans,
                  size: U.TextSize.md,
                  weight: U.TextWeight.bold,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
