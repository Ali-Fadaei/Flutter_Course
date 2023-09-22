part of 'checkout_cubit.dart';

class CheckoutState extends Equatable {
  final bool loading;
  final bool discountLoading;
  final bool checkoutLoading;
  final List<ShopItem> shopItems;
  final int totalAmount;
  final int discountPercent;
  final int discountAmount;
  final int payableAmount;

  const CheckoutState({
    this.loading = false,
    this.discountLoading = false,
    this.checkoutLoading = false,
    this.shopItems = const [],
    this.totalAmount = 0,
    this.discountAmount = 0,
    this.discountPercent = 0,
    this.payableAmount = 0,
  });

  CheckoutState copyWith({
    bool? loading,
    List<ShopItem>? shopItems,
    int? discountPercent,
    bool? discountLoading,
    bool? checkoutLoading,
  }) {
    int totalAmount = shopItems?.fold<int>(
            0,
            (previousValue, element) =>
                previousValue + (element.product.price * element.count)) ??
        this.totalAmount;
    int discountAmount = discountPercent != null
        ? (totalAmount * discountPercent) ~/ 100
        : this.discountAmount;
    int payableAmount = totalAmount - discountAmount;
    return CheckoutState(
      loading: loading ?? this.loading,
      discountLoading: discountLoading ?? this.discountLoading,
      checkoutLoading: checkoutLoading ?? this.checkoutLoading,
      shopItems: shopItems ?? this.shopItems,
      discountPercent: discountPercent ?? this.discountPercent,
      totalAmount: totalAmount,
      discountAmount: discountAmount,
      payableAmount: payableAmount,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        shopItems,
        totalAmount,
        discountPercent,
        discountAmount,
        discountLoading,
        checkoutLoading
      ];
}
