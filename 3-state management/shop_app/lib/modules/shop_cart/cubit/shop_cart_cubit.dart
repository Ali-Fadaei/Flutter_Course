import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/domains/store_repository/models/product.dart';
import 'package:shop_app/domains/store_repository/models/shop_cart.dart';
import 'package:shop_app/domains/store_repository/store_repository.dart';

part 'shop_cart_state.dart';

class ShopCartCubit extends Cubit<ShopCartState> {
//
  final StoreRepository storeRepository;

  ShopCartCubit({
    required this.storeRepository,
  }) : super(ShopCartState()) {
    init();
  }

  Future<void> init() async {
    emit(state.copywith(loading: true));
    var shopItemsRes = await storeRepository.readShopItems();
    var deliveryAddressRes = await storeRepository.readDeliveryAddress();
    var deliveryTimeRes = await storeRepository.readDeliveryTime();
    emit(state.copywith(
      loading: false,
      shopItems: shopItemsRes,
      deliveryAddress: deliveryAddressRes,
      deliveryTime: deliveryTimeRes,
    ));
  }

  void onAddtoShopCartPressed(Product product) {
    var shopItems = [...state.shopItems];
    try {
      var existingShopItem = shopItems.firstWhere((element) {
        return element.product.id == product.id;
      });
      var existingShopItemIndex = shopItems.indexWhere((element) {
        return element.product.id == product.id;
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
        return element.product.id == product.id;
      });
      var existingShopItemIndex = shopItems.indexWhere((element) {
        return element.product.id == product.id;
      });
      if (existingShopItem.count <= 1) {
        shopItems.removeAt(existingShopItemIndex);
      } else {
        shopItems[existingShopItemIndex] = existingShopItem.dec();
      }
    } catch (_) {}
    storeRepository.updateShopItems(shopItems);
    emit(state.copywith(shopItems: shopItems));
  }
}
