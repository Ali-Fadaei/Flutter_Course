import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
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
    try {
      var existingShopItem = state.shopCart.shopItems.firstWhere((element) {
        return element.product == product;
      });
      if (existingShopItem.count <= 10) {
        existingShopItem.count++;
        emit(state);
      }
    } catch (_) {
      state.shopCart.shopItems.add(ShopItem(product: product));
      emit(state);
    }
  }

  void onRemovefromShopCartPressed(Product product) {
    try {
      var existingShopItem = state.shopCart.shopItems.firstWhere((element) {
        return element.product == product;
      });
      if (existingShopItem.count <= 1) {
        state.shopCart.shopItems.remove(existingShopItem);
        emit(state);
      } else {
        existingShopItem.count--;
        emit(state);
      }
    } catch (_) {}
  }
}
