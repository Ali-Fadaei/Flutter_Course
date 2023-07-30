import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/domains/store_repository/models/product.dart';
import 'package:shop_app/domains/store_repository/models/shop_cart.dart';

part 'shop_cart_state.dart';

class ShopCartCubit extends Cubit<ShopCartState> {
//
  ShopCartCubit() : super(ShopCartState());

  void onAddtoShopCartPressed(Product product) {
    var shopItems = [...state.shopItems];
    try {
      var existingShopItem = shopItems.firstWhere((element) {
        return element.product == product;
      });
      var existingShopItemIndex = shopItems.indexWhere((element) {
        return element.product == product;
      });
      if (existingShopItem.count < 10) {
        shopItems[existingShopItemIndex] = existingShopItem.inc();
      }
    } catch (_) {
      shopItems.add(ShopItem(product: product));
    }
    emit(state.copywith(shopItems: shopItems));
  }

  void onRemovefromShopCartPressed(Product product) {
    var shopItems = [...state.shopItems];
    try {
      var existingShopItem = shopItems.firstWhere((element) {
        return element.product == product;
      });
      var existingShopItemIndex = shopItems.indexWhere((element) {
        return element.product == product;
      });
      if (existingShopItem.count <= 1) {
        shopItems.remove(existingShopItem);
      } else {
        shopItems[existingShopItemIndex] = existingShopItem.dec();
      }
    } catch (_) {}
    emit(state.copywith(shopItems: shopItems));
  }
}
