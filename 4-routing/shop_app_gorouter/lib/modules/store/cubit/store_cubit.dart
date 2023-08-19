import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_gorouter/domains/store_repository/models/product.dart';
import 'package:shop_app_gorouter/domains/store_repository/store_repository.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
//
  final StoreRepository storeRepo;

  final searchCtrl = TextEditingController();

  final int? initialProductId;

//
  StoreCubit({
    required this.storeRepo,
    this.initialProductId,
  }) : super(const StoreState()) {
    init();
  }

//==================================Functions===================================
  Future<void> init() async {
    emit(state.copyWith(loading: true));
    await Future.wait([
      getProducts(),
      getInitialProduct(),
    ]);
    emit(state.copyWith(loading: false));
  }

  Future<void> getProducts() async {
    var res = await storeRepo.readProducts();
    emit(state.copyWith(products: res));
  }

  Future<void> getInitialProduct() async {
    if (initialProductId != null) {
      var res = await storeRepo.readProducts(id: initialProductId);
      emit(state.copyWith(initialProduct: res.first));
    }
  }

  //==================================Events====================================
}
