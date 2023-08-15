import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_routing/domains/store_repository/models/category.dart';
import 'package:shop_app_routing/domains/store_repository/models/product.dart';
import 'package:shop_app_routing/domains/store_repository/store_repository.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
//
  final StoreRepository _storeRepo;

  final int categoryId;

  final searchCtrl = TextEditingController();

  CategoryCubit({
    required StoreRepository storeRepo,
    required this.categoryId,
  })  : _storeRepo = storeRepo,
        super(const CategoryState()) {
    init();
  }

  void init() async {
    emit(state.copyWith(loading: true));
    //Approach 1
    // var categories = await _storeRepo.readCategories(id: categoryId);
    // var products = await _storeRepo.readProducts(
    //   categoryId: categoryId,
    //   sortId: state.sortId,
    //   orderId: state.sortId,
    // );

    late List<Category> categories;
    late List<Product> products;

    var categoriesFuture = _storeRepo
        .readCategories(id: categoryId)
        .then((value) => categories = value);

    var productsFuture = _storeRepo
        .readProducts(
          categoryId: categoryId,
          sortId: state.sortId,
          orderId: state.sortId,
        )
        .then((value) => products = value);

    await Future.wait([
      categoriesFuture,
      productsFuture,
    ]);

    emit(state.copyWith(
      loading: false,
      category: categories.first,
      products: products,
    ));
  }

  //events
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

  Future<void> onFilterApplyPressed() async {
    emit(state.copyWith(loading: true));
    var res = await _storeRepo.readProducts(
      categoryId: categoryId,
      title: searchCtrl.text,
      minRating: state.minRating,
      maxRating: state.maxRating,
      minPrice: state.minPrice,
      maxPrice: state.maxPrice,
      sortId: state.sortId,
      orderId: state.orderId,
    );
    emit(state.copyWith(loading: false, products: res));
  }
}
