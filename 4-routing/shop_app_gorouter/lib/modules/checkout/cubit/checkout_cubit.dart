import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_gorouter/domains/store_repository/models/shop_item.dart';
import 'package:shop_app_gorouter/domains/store_repository/store_repository.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
//
  final StoreRepository _storeRepo;

  final List<ShopItem>? shopItems;

  final addressCtrl = TextEditingController();

  final discountCtrl = TextEditingController();

  CheckoutCubit({
    required StoreRepository storeRepo,
    this.shopItems,
  })  : _storeRepo = storeRepo,
        super(const CheckoutState()) {
    init();
  }

  //===============================Functions====================================
  void init() async {
    if (shopItems == null) {
      emit(state.copyWith(loading: true));
      var res = await _storeRepo.readShopItems();
      emit(state.copyWith(loading: false, shopItems: res));
    } else {
      emit(state.copyWith(shopItems: shopItems));
    }
  }

  //================================Events======================================
}
