import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shop_app_data_providers/domains/user_repository/user_repository.dart';
import 'package:shop_app_data_providers/tool_kit.dart/tool_kit.dart' as T;

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
//
  final UserRepository _userRepo;

  final phoneCtrl = TextEditingController();
  final otpCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final emailCtrl = TextEditingController();

  Timer? otpTimer;

  AuthCubit({
    required UserRepository userRepo,
  })  : _userRepo = userRepo,
        super(const AuthState());

  bool validateRegisterForm() {
    bool isValid = true;
    isValid = isValid && nameCtrl.text.isNotEmpty;
    isValid = isValid && lastNameCtrl.text.isNotEmpty;
    isValid = isValid && addressCtrl.text.isNotEmpty;
    isValid = isValid && emailCtrl.text.isNotEmpty;
    return isValid;
  }

  Future<bool> onOtpRequested() async {
    final phoneNumber = phoneCtrl.text.replaceAll('-', '');
    if (T.Validator.mobileNumber(phoneNumber)) {
      emit(state.copyWith(otpRequestLoading: true));
      await _userRepo.requestOtp(mobileNumber: phoneNumber);
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
      emit(state.copyWith(otpRequestLoading: false));
      return true;
    } else {
      toast('شماره موبایل صحیح نمیباشد');
      return false;
    }
  }

  Future<bool> onOtpConfirmed() async {
    if (otpCtrl.text.length == 4) {
      emit(state.copyWith(otpConfirmLoading: true));
      await Future.delayed(const Duration(seconds: 1));
      if (phoneCtrl.text.contains('415')) {
        emit(state.copyWith(
          goRegisterPage: UniqueKey(),
        ));
      } else {
        //todo
      }
      emit(state.copyWith(otpConfirmLoading: false));
      return false;
    } else {
      toast('کد را کامل کنید!');
      return false;
    }
  }

  Future<bool> onRegisterRequested() async {
    if (validateRegisterForm()) {
      emit(state.copyWith(registerLoading: true));
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(registerLoading: false));
      return true;
    } else {
      toast('فرم ثبت‌نام ناقص میباشد.');
      return false;
    }
  }

  @override
  Future<void> close() {
    otpTimer?.cancel();
    return super.close();
  }
}
