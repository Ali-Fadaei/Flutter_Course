import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
//
  final phoneCtrl = TextEditingController();
  final otpCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final lNameCtrl = TextEditingController();
  final adressCtrl = TextEditingController();

  Timer? timer;

  String? hashId;

  AuthCubit() : super(const AuthState());

  Future<bool> onOtpCompleted() async {
    emit(state.copyWith(loading: true));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(
      timer: 5,
      hashId: DateTime.now().toString(),
    ));
    timer?.cancel();
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (state.timer > 0) {
          emit(state.copyWith(timer: state.timer - 1));
        } else {
          timer.cancel();
        }
      },
    );
    emit(state.copyWith(loading: false));
    return true;
  }

  bool onConfirmPressed() {
    if (otpCtrl.text == '2415') {}
    return true;
  }

  @override
  Future<void> close() {
    timer?.cancel();
    return super.close();
  }
}
