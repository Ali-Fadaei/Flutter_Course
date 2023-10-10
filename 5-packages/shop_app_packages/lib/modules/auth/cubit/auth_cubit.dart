import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
//
  final phoneCtrl = TextEditingController();
  final otpCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final lNameCtrl = TextEditingController();
  final adressCtrl = TextEditingController();

  Timer? otpTimer;

  AuthCubit() : super(const AuthState());

  Future<bool> onOtpCompleted() async {
    emit(state.copyWith(loading: true));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(
      timer: 5,
      hashId: DateTime.now().toString(),
      goConfirmPage: UniqueKey(),
    ));
    otpCtrl.clear();
    otpTimer?.cancel();
    otpTimer = Timer.periodic(
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
    if (otpCtrl.text == '2415') {
      emit(state.copyWith(
        goRegisterPage: UniqueKey(),
      ));
    }
    return false;
  }

  @override
  Future<void> close() {
    otpTimer?.cancel();
    return super.close();
  }
}
