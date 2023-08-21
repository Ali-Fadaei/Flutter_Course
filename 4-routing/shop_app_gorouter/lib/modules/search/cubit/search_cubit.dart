import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_gorouter/domains/store_repository/models/category.dart';
import 'package:shop_app_gorouter/domains/store_repository/models/product.dart';
import 'package:shop_app_gorouter/domains/store_repository/store_repository.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
//
  final StoreRepository _storeRepo;

  final searchCtrl = TextEditingController();

  final String searchTitle;

  SearchCubit({
    this.searchTitle = "",
    required StoreRepository storeRepo,
  })  : _storeRepo = storeRepo,
        super(const SearchState()) {
    init();
  }

  //==================================Functions=================================
  void init() async {
    emit(state.copyWith(loading: true));
    searchCtrl.text = searchTitle;
    await Future.wait([
      getProducts(),
      getCategories(),
    ]);
    emit(state.copyWith(
      loading: false,
    ));
  }

  Future<void> getCategories() async {
    var result = await _storeRepo.readCategories();
    emit(state.copyWith(
      categories: result,
      selectedCategories: result,
    ));
  }

  Future<void> getProducts() async {
    var res = await _storeRepo.readProducts(
      title: searchCtrl.text.isEmpty ? null : searchCtrl.text,
      categoriesId: state.selectedCategories.map((e) => e.id).toList(),
      minRating: state.minRating,
      maxRating: state.maxRating,
      minPrice: state.minPrice,
      maxPrice: state.maxPrice,
      sortId: state.sortId,
      orderId: state.orderId,
    );
    emit(state.copyWith(products: res));
  }

  //==================================Event=====================================

  void onRatingSliderChanged(double min, double max) {
    emit(state.copyWith(minRating: min, maxRating: max));
  }

  void onPriceSliderChanged(double min, double max) {
    emit(state.copyWith(minPrice: min.toInt(), maxPrice: max.toInt()));
  }

  void onSortIdChanged(int id) {
    emit(state.copyWith(sortId: id));
  }

  void onOrderIdChanged(int id) {
    emit(state.copyWith(orderId: id));
  }

  void onCategoriesChecked(bool checked, Category category) {
    var temp = [...state.selectedCategories];
    if (checked) {
      temp.add(category);
    } else {
      temp.remove(category);
    }
    emit(state.copyWith(selectedCategories: temp));
  }

  Future<void> onFilterApplyPressed() async {
    emit(state.copyWith(loading: true));
    await getProducts();
    emit(state.copyWith(loading: false));
  }
}
