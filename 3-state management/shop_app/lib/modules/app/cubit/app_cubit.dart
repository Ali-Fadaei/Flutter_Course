import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/domains/store_repository/models/product.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
//
  AppCubit() : super(AppState());

  //Events
  void onDestnationChange(int index) {
    emit(state.copywith(selectedDes: index));
  }
}
