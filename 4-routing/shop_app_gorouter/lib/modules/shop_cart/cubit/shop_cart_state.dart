part of 'shop_cart_cubit.dart';

class ShopCartState extends Equatable {
//
  final bool loading;

  final List<ShopItem> shopItems;

  final String deliveryAddress;

  final String deliveryTime;

  const ShopCartState({
    this.loading = false,
    this.shopItems = const [],
    this.deliveryAddress = '',
    this.deliveryTime = '',
  });

  int get totalAmount {
    var temp = 0;
    for (var element in shopItems) {
      temp += element.product.price * element.count;
    }
    return temp;
  }

  ShopCartState copywith({
    bool? loading,
    List<ShopItem>? shopItems,
    String? deliveryAddress,
    String? deliveryTime,
  }) {
    return ShopCartState(
      loading: loading ?? this.loading,
      shopItems: shopItems ?? this.shopItems,
      deliveryAddress: deliveryAddress ?? this.deliveryAddress,
      deliveryTime: deliveryTime ?? this.deliveryTime,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        shopItems,
        deliveryAddress,
        deliveryTime,
      ];
}
