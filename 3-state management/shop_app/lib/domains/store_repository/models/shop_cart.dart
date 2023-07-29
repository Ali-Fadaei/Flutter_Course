import 'package:equatable/equatable.dart';
import 'package:shop_app/domains/store_repository/models/product.dart';

class ShopCart extends Equatable {
//
  final List<ShopItem> shopItems;

  final String deliveryAddress;

  final String deliveryTime;

  const ShopCart({
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

  ShopCart copywith({
    List<ShopItem>? shopItems,
    String? deliveryAddress,
    String? deliveryTime,
  }) {
    return ShopCart(
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
