import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_gorouter/domains/store_repository/models/product.dart';
import 'package:shop_app_gorouter/domains/store_repository/store_repository.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  final StoreRepository storeRepo;

//
  StoreCubit({required this.storeRepo}) : super(const StoreState()) {
    init();
  }

  Future<void> init() async {
    emit(state.copyWith(loading: true));
    var res = await storeRepo.readProducts();
    emit(state.copyWith(loading: false, products: res));
  }
}
