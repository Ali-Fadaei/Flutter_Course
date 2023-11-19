import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_auth/domains/store_repository/models/category.dart';
import 'package:shop_app_auth/domains/store_repository/store_repository.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
//
  final StoreRepository storeRepo;

  final searchCtrl = TextEditingController();

  CategoriesCubit({required this.storeRepo}) : super(const CategoriesState()) {
    init();
  }

  Future<void> init({bool loading = true}) async {
    if (loading) emit(state.copyWith(loading: true));
    await getCategories();
    if (loading) emit(state.copyWith(loading: false));
  }

  Future<void> getCategories() async {
    var res = await storeRepo.readCategories();
    emit(state.copyWith(categories: res));
  }
}
