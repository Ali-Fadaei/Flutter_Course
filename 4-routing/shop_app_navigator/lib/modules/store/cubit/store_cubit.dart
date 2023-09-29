import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_navigator/domains/store_repository/models/product.dart';
import 'package:shop_app_navigator/domains/store_repository/store_repository.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  final StoreRepository storeRepo;

//
  StoreCubit({required this.storeRepo}) : super(const StoreState()) {
    init();
  }

  Future<void> init({bool loading = true}) async {
    if (loading) emit(state.copyWith(loading: true));
    await getProducts();
    if (loading) emit(state.copyWith(loading: false));
  }

  Future<void> getProducts() async {
    var res = await storeRepo.readProducts();
    emit(state.copyWith(products: res));
  }
}
