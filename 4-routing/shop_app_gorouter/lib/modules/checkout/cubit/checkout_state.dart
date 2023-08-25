part of 'checkout_cubit.dart';

class CheckoutState extends Equatable {
//
  final bool loading;

  final bool discountLoading;

  final bool paymentLoading;

  final List<ShopItem> shopItems;

  final int totalAmount;

  final int discountPercent;

  final int discountAmount;

  final int payableAmount;

  const CheckoutState({
    this.loading = false,
    this.discountLoading = false,
    this.paymentLoading = false,
    this.shopItems = const [],
    this.totalAmount = 0,
    this.discountPercent = 0,
    this.discountAmount = 0,
    this.payableAmount = 0,
  });

  CheckoutState copyWith({
    bool? loading,
    bool? discountLoading,
    bool? paymentLoading,
    List<ShopItem>? shopItems,
    int? discountPercent,
  }) {
    var totalAmount = shopItems?.fold(
          0,
          (previousValue, element) =>
              previousValue + element.product.price * element.count,
        ) ??
        this.totalAmount;
    var discountAmount =
        totalAmount * (discountPercent ?? this.discountPercent) ~/ 100;
    return CheckoutState(
      loading: loading ?? this.loading,
      discountLoading: discountLoading ?? this.discountLoading,
      paymentLoading: paymentLoading ?? this.paymentLoading,
      shopItems: shopItems ?? this.shopItems,
      discountPercent: discountPercent ?? this.discountPercent,
      totalAmount: totalAmount,
      discountAmount: discountAmount,
      payableAmount: totalAmount - discountAmount,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        discountLoading,
        paymentLoading,
        shopItems,
        totalAmount,
        discountPercent,
        discountAmount,
        payableAmount,
      ];
}
