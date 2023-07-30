import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/domains/store_repository/models/product.dart';
import 'package:shop_app/domains/store_repository/models/shop_cart.dart';
import 'package:shop_app/domains/store_repository/store_repository.dart';

part 'shop_cart_state.dart';

class ShopCartCubit extends Cubit<ShopCartState> {
//
  final StoreRepository storeRepository;

  late final StreamSubscription shopItemsListener;

  ShopCartCubit({
    required this.storeRepository,
  }) : super(ShopCartState()) {
    init();
  }

  void init() {
    emit(state.copywith(
      shopItems: storeRepository.shopItems,
      deliveryAddress: storeRepository.deliveryAddress,
      deliveryTime: storeRepository.deliveryTime,
    ));
    shopItemsListener = storeRepository.shopItemsStream.listen((event) {
      emit(state.copywith(shopItems: event));
    });
  }

  void onAddtoShopCartPressed(Product product) {
    var shopItems = [...state.shopItems];
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
    storeRepository.updateShopItems(shopItems);
    emit(state.copywith(shopItems: shopItems));
  }

  void onRemovefromShopCartPressed(Product product) {
    var shopItems = [...state.shopItems];
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
    storeRepository.updateShopItems(shopItems);
    emit(state.copywith(shopItems: shopItems));
  }

  @override
  Future<void> close() {
    shopItemsListener.cancel();
    return super.close();
  }
}
