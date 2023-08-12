import 'package:equatable/equatable.dart';
import 'package:shop_app_navigator/domains/store_repository/models/product.dart';

class ShopItem extends Equatable {
//
  final Product product;

  final int count;

  const ShopItem({
    required this.product,
    this.count = 1,
  });

  ShopItem copyWith({
    Product? product,
    int? count,
  }) {
    return ShopItem(
      product: product ?? this.product,
      count: count ?? this.count,
    );
  }

  ShopItem inc() {
    return copyWith(count: count + 1);
  }

  ShopItem dec() {
    return copyWith(count: count - 1);
  }

  @override
  List<Object?> get props => [
        product,
        count,
      ];
}
