import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_gorouter/domains/store_repository/models/shop_item.dart';
import 'package:shop_app_gorouter/domains/store_repository/store_repository.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
//
  final StoreRepository _storeRepo;

  final List<ShopItem>? initialShopItems;

  TextEditingController addressCtrl = TextEditingController();
  TextEditingController discountCtrl = TextEditingController();

  CheckoutCubit({
    required StoreRepository storeRepo,
    this.initialShopItems,
  })  : _storeRepo = storeRepo,
        super(const CheckoutState()) {
    init();
  }

//==============================Functions=======================================

  Future<void> init() async {
    if (initialShopItems != null) {
      emit(state.copyWith(shopItems: initialShopItems));
    } else {
      emit(state.copyWith(loading: true));
      await getShopItems();
      emit(state.copyWith(loading: false));
    }
  }

  Future<void> getShopItems() async {
    var shopItems = await _storeRepo.readShopItems();
    emit(state.copyWith(shopItems: shopItems));
  }

  Future<void> getDiscount() async {
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(discountPercent: 15));
  }

  Future<void> checkout() async {
    await Future.delayed(const Duration(seconds: 1));
  }

//=================================Event========================================

  void onDiscountPressed() async {
    emit(state.copyWith(discountLoading: true));
    await getDiscount();
    emit(state.copyWith(discountLoading: false));
  }

  void onCheckoutPressed() async {
    emit(state.copyWith(checkoutLoading: true));
    await checkout();
    emit(state.copyWith(checkoutLoading: false));
  }
}
