import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_gorouter/domains/store_repository/store_repository.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
//
  final StoreRepository _storeRepo;

  CheckoutCubit({
    required StoreRepository storeRepo,
  })  : _storeRepo = storeRepo,
        super(const CheckoutState());

  //===============================Functions====================================
  void init() async {}

  //================================Events======================================
}
