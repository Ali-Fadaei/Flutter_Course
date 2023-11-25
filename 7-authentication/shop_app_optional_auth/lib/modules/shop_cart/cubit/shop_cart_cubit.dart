import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_optional_auth/domains/store_repository/models/product.dart';
import 'package:shop_app_optional_auth/domains/store_repository/models/shop_item.dart';
import 'package:shop_app_optional_auth/domains/store_repository/store_repository.dart';
import 'package:shop_app_optional_auth/domains/user_repository/user_repository.dart';

part 'shop_cart_state.dart';

class ShopCartCubit extends Cubit<ShopCartState> {
//
  final UserRepository _userRepo;

  final StoreRepository _storeRepo;

  ShopCartCubit({
    required UserRepository userRepo,
    required StoreRepository storeRepo,
  })  : _userRepo = userRepo,
        _storeRepo = storeRepo,
        super(const ShopCartState()) {
    init();
  }

  Future<void> init() async {
    emit(state.copywith(loading: true));
    await _getShopItems();
    emit(state.copywith(loading: false));
  }

  // Methods

  Future<void> _getShopItems() async {
    var token = await _userRepo.getAccessToken();
    final res = await _storeRepo.readShopItems(token);
    emit(state.copywith(shopItems: res));
  }

  Future<void> onAddtoShopCartPressed(Product product) async {
    var token = await _userRepo.getAccessToken();
    await _storeRepo.shopItemIncrement(token, product);
    await _getShopItems();
  }

  Future<void> onRemovefromShopCartPressed(Product product) async {
    var token = await _userRepo.getAccessToken();
    await _storeRepo.shopItemDecrement(token, product);
    await _getShopItems();
  }
}
