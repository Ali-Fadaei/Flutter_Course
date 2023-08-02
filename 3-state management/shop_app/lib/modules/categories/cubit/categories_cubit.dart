import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/domains/store_repository/models/category.dart';
import 'package:shop_app/domains/store_repository/store_repository.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
//
  final StoreRepository storeRepo;

  CategoriesCubit({required this.storeRepo}) : super(CategoriesState()) {
    init();
  }

  Future<void> init() async {
    emit(state.copyWith(loading: true));
    var res = await storeRepo.readCategories();
    emit(state.copyWith(loading: false, categories: res));
  }
}
