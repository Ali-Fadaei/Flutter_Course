import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
//
  AppCubit() : super(AppState());

  //Events
  void onDestnationChange(int index) {
    emit(state.copywith(selectedDes: index));
  }
}
