import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_gorouter/domains/store_repository/models/category.dart';
import 'package:shop_app_gorouter/domains/store_repository/models/product.dart';
import 'package:shop_app_gorouter/domains/store_repository/store_repository.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
//
  final StoreRepository storeRepo;

  final searchCtrl = TextEditingController();

  final int categoryId;

  CategoryCubit({
    required this.storeRepo,
    required this.categoryId,
  }) : super(const CategoryState()) {
    init();
  }

  Future<void> init() async {
    emit(state.copyWith(loading: true));
    Category? category;
    List<Product> products = [];
    var categoriesFuture = storeRepo.readCategories(id: categoryId).then(
          (value) => category = value.first,
        );
    var productsFuture = storeRepo.readProducts(categoryId: categoryId).then(
          (value) => products = value,
        );
    await Future.wait([categoriesFuture, productsFuture]);
    emit(state.copyWith(
      loading: false,
      category: category,
      products: products,
    ));
  }

  void onPriceRangeChanged(double min, double max) {
    emit(state.copyWith(minPrice: min, maxPrice: max));
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
    var res = await storeRepo.readProducts(
      title: searchCtrl.text.isEmpty ? null : searchCtrl.text,
      categoryId: categoryId,
      maxPrice: state.maxPrice.round(),
      minPrice: state.minPrice.round(),
      maxRate: state.maxRating,
      minRate: state.minRating,
      sort: state.sort,
      order: state.order,
    );
    emit(state.copyWith(loading: false, products: res));
  }
}
