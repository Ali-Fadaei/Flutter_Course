import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_packages/domains/store_repository/models/product.dart';
import 'package:shop_app_packages/domains/store_repository/store_repository.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
//

  final StoreRepository _storeRepo;

  final int? initialProductId;

  final searchCtrl = TextEditingController();

//
  StoreCubit({
    required StoreRepository storeRepo,
    this.initialProductId,
  })  : _storeRepo = storeRepo,
        super(const StoreState()) {
    init();
  }

  //Functions
  Future<void> init() async {
    emit(state.copyWith(loading: true));
    await Future.wait([
      getInitialProduct(),
      getProducts(),
    ]);
    emit(state.copyWith(loading: false));
  }

  Future<void> getProducts() async {
    var res = await _storeRepo.readProducts();
    emit(state.copyWith(products: res));
  }

  Future<void> getInitialProduct() async {
    if (initialProductId != null) {
      var res = await _storeRepo.readProducts(id: initialProductId);
      emit(state.copyWith(initialProduct: res.isEmpty ? null : res.first));
    }
  }
  //events
}
