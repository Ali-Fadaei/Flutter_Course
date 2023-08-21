part of 'checkout_cubit.dart';

class CheckoutState extends Equatable {
//
  final bool loading;

  final List<ShopItem> shopItems;

  const CheckoutState({
    this.loading = false,
    this.shopItems = const [],
  });

  CheckoutState copyWith({
    bool? loading,
    List<ShopItem>? shopItems,
  }) {
    return CheckoutState(
      loading: loading ?? this.loading,
      shopItems: shopItems ?? this.shopItems,
    );
  }

  int get totalAmount {
    return shopItems.fold<int>(
      0,
      (temp, element) => temp = element.product.price * element.count,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        shopItems,
        totalAmount,
      ];
}
