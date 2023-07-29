import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/domains/store_repository/models/product.dart';
import 'package:shop_app/domains/store_repository/models/shop_cart.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
//
  AppCubit() : super(AppState());

  //Events
  void onDestnationChange(int index) {
    emit(state.copywith(selectedDes: index));
  }

  void onFavoriatePressed(Product product) {
    var temp = [...state.favorites];
    if (temp.contains(product)) {
      temp.remove(product);
    } else {
      temp.add(product);
    }
    emit(state.copywith(favorites: temp));
  }

  void onAddtoShopCartPressed(Product product) {
    var shopItems = [...state.shopCart.shopItems];
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
    emit(state.copywith(
      shopCart: state.shopCart.copywith(shopItems: shopItems),
    ));
  }

  void onRemovefromShopCartPressed(Product product) {
    var shopItems = [...state.shopCart.shopItems];
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
    emit(state.copywith(
      shopCart: state.shopCart.copywith(shopItems: shopItems),
    ));
  }
}
