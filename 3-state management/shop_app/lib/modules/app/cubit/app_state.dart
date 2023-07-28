part of 'app_cubit.dart';

class AppState {
//
  final int selectedDes;

  final List<Product> favorites;

  final ShopCart shopCart;

  AppState({
    this.selectedDes = 2,
    this.favorites = const [],
    this.shopCart = const ShopCart(),
  });

  AppState copywith({
    int? selectedDes,
    List<Product>? favorites,
    ShopCart? shopCart,
  }) {
    return AppState(
      selectedDes: selectedDes ?? this.selectedDes,
      favorites: favorites ?? this.favorites,
      shopCart: shopCart ?? this.shopCart,
    );
  }
}
