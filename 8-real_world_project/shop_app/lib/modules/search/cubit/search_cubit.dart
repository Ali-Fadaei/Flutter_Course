import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/domains/store_repository/models/category.dart';
import 'package:shop_app/domains/store_repository/models/product.dart';
import 'package:shop_app/domains/store_repository/store_repository.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final StoreRepository _storeRepo;

  final searchCtrl = TextEditingController();

  final String? initialSearchTitle;

  SearchCubit({
    required this.initialSearchTitle,
    required StoreRepository storeRepo,
  })  : _storeRepo = storeRepo,
        super(const SearchState()) {
    _init();
  }

  //============================***Functions***=================================

  Future<void> _init() async {
    emit(state.copyWith(loading: true));
    searchCtrl.text = initialSearchTitle ?? '';
    await Future.wait([
      _getCategories(),
      _getProducts(),
    ]);
    emit(state.copyWith(loading: false));
  }

  Future<void> _getCategories() async {
    var res = await _storeRepo.readCategories();
    emit(
      state.copyWith(
        categories: res,
        selectedCategories: res,
      ),
    );
  }

  Future<void> _getProducts() async {
    var res = await _storeRepo.readProducts(
      title: searchCtrl.text.isEmpty ? null : searchCtrl.text,
      categoriesIds: state.selectedCategories.map((e) => e.id).toList(),
      minRating: state.minRating,
      maxRating: state.maxRating,
      minPrice: state.minPrice,
      maxPrice: state.maxPrice,
      sort: state.sort,
      order: state.order,
    );
    emit(state.copyWith(products: res));
  }

  //=============================***Events***===================================

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

  void onSelectedCategoryChanged(bool check, Category category) {
    var temp = [...state.selectedCategories];
    if (check) {
      temp.add(category);
    } else {
      temp.remove(category);
    }
    if (temp.isEmpty) {
      temp = [...state.categories];
    }
    emit(state.copyWith(selectedCategories: temp));
  }

  Future<void> onFilterApplyPressed() async {
    emit(state.copyWith(loading: true));
    await _getProducts();
    emit(state.copyWith(loading: false));
  }
}
