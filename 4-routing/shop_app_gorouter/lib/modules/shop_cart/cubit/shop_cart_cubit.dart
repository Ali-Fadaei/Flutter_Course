import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_gorouter/domains/store_repository/models/product.dart';
import 'package:shop_app_gorouter/domains/store_repository/models/shop_item.dart';
import 'package:shop_app_gorouter/domains/store_repository/store_repository.dart';

part 'shop_cart_state.dart';

class ShopCartCubit extends Cubit<ShopCartState> {
//
  final StoreRepository storeRepo;

  ShopCartCubit({
    required this.storeRepo,
  }) : super(const ShopCartState()) {
    init();
  }

  Future<void> init() async {
    emit(state.copywith(loading: true));
    var res = await storeRepo.readShopItems();
    emit(state.copywith(
      loading: false,
      shopItems: res,
    ));
  }

  Future<void> onAddtoShopCartPressed(Product product) async {
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
    emit(state.copywith(shopItems: shopItems));
    await storeRepo.updateShopItems(shopItems);
  }

  Future<void> onRemovefromShopCartPressed(Product product) async {
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
    emit(state.copywith(shopItems: shopItems));
    await storeRepo.updateShopItems(shopItems);
  }
}
