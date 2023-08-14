import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_navigator/domains/store_repository/models/category.dart';
import 'package:shop_app_navigator/domains/store_repository/models/product.dart';
import 'package:shop_app_navigator/domains/store_repository/store_repository.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
//
  final StoreRepository _storeRepo;

  final searchCtrl = TextEditingController();

  final int categoryId;

  CategoryCubit({
    required this.categoryId,
    required StoreRepository storeRepo,
  })  : _storeRepo = storeRepo,
        super(const CategoryState()) {
    _init();
  }

  //============================***Functions***=================================

  Future<void> _init() async {
    emit(state.copyWith(loading: true));
    await Future.wait([
      _getCategory(),
      _getProducts(),
    ]);
    emit(state.copyWith(loading: false));
  }

  Future<void> _getCategory() async {
    var res = await _storeRepo.readCategories(id: categoryId);
    emit(state.copyWith(category: res.first));
  }

  Future<void> _getProducts() async {
    var res = await _storeRepo.readProducts(
      title: searchCtrl.text.isEmpty ? null : searchCtrl.text,
      categoryId: categoryId,
      minRating: state.minRating,
      maxRating: state.maxRating,
      minPrice: state.minPrice,
      maxPrice: state.maxPrice,
      sort: state.sort,
      order: state.order,
    );
    emit(state.copyWith(products: res));
  }

  //==========================***Events***======================================

  void onPriceRangeChanged(double min, double max) {
    emit(state.copyWith(minPrice: min.toInt(), maxPrice: max.toInt()));
  }

  void onRatingRangeChanged(double min, double max) {
    emit(state.copyWith(minRating: min, maxRating: max));
  }

  void onSortChanged(int sort) {
    emit(state.copyWith(sort: sort));
  }

  void onOrderChanged(int order) {
    emit(state.copyWith(order: order));
  }

  Future<void> onFilterApplyPressed() async {
    emit(state.copyWith(loading: true));
    await _getProducts();
    emit(state.copyWith(loading: false));
  }
}
