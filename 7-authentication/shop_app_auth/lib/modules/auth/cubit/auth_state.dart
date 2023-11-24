part of 'auth_cubit.dart';

class AuthState extends Equatable {
  //
  final bool otpGenerateLoading;

  final bool otpConfirmLoading;

  final bool registerLoading;

  final int timer;

  final String? hashId;

  final UniqueKey? goConfirmPage;

  final UniqueKey? goRegisterPage;

  final UserRegisterValidation? userRegisterValidation;

  const AuthState({
    this.otpGenerateLoading = false,
    this.otpConfirmLoading = false,
    this.registerLoading = false,
    this.timer = 0,
    this.hashId,
    this.goConfirmPage,
    this.goRegisterPage,
    this.userRegisterValidation,
  });

  AuthState copyWith({
    bool? otpGenerateLoading,
    bool? otpConfirmLoading,
    bool? registerLoading,
    int? timer,
    String? hashId,
    UniqueKey? goConfirmPage,
    UniqueKey? goRegisterPage,
    UserRegisterValidation? userRegisterValidation,
  }) {
    return AuthState(
      otpGenerateLoading: otpGenerateLoading ?? this.otpGenerateLoading,
      otpConfirmLoading: otpConfirmLoading ?? this.otpConfirmLoading,
      registerLoading: registerLoading ?? this.registerLoading,
      timer: timer ?? this.timer,
      hashId: hashId ?? this.hashId,
      goConfirmPage: goConfirmPage ?? this.goConfirmPage,
      goRegisterPage: goRegisterPage ?? this.goRegisterPage,
      userRegisterValidation:
          userRegisterValidation ?? this.userRegisterValidation,
    );
  }

  @override
  List<dynamic> get props => [
        otpGenerateLoading,
        otpConfirmLoading,
        registerLoading,
        timer,
        hashId,
        goConfirmPage,
        goRegisterPage,
        userRegisterValidation,
      ];
}
