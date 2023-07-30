part of 'shop_cart_cubit.dart';

class ShopCartState extends Equatable {
//
  final List<ShopItem> shopItems;

  final String deliveryAddress;

  final String deliveryTime;

  const ShopCartState({
    this.shopItems = const [],
    this.deliveryAddress = '',
    this.deliveryTime = '',
  });

  int get totalAmount {
    var temp = 0;
    for (var element in shopItems) {
      temp += element.product.price;
    }
    return temp;
  }

  ShopCartState copywith({
    List<ShopItem>? shopItems,
    String? deliveryAddress,
    String? deliveryTime,
  }) {
    return ShopCartState(
      shopItems: shopItems ?? this.shopItems,
      deliveryAddress: deliveryAddress ?? this.deliveryAddress,
      deliveryTime: deliveryTime ?? this.deliveryTime,
    );
  }

  @override
  List<Object?> get props => [
        shopItems,
        deliveryAddress,
        deliveryTime,
      ];
}
