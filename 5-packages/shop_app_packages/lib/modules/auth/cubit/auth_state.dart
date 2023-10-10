part of 'auth_cubit.dart';

class AuthState extends Equatable {
  //
  final bool loading;

  final int timer;

  final String? hashId;

  final UniqueKey? goConfirmPage;

  final UniqueKey? goRegisterPage;

  const AuthState({
    this.loading = false,
    this.timer = 0,
    this.hashId,
    this.goConfirmPage,
    this.goRegisterPage,
  });

  AuthState copyWith({
    bool? loading,
    int? timer,
    String? hashId,
    UniqueKey? goConfirmPage,
    UniqueKey? goRegisterPage,
  }) {
    return AuthState(
      loading: loading ?? this.loading,
      timer: timer ?? this.timer,
      hashId: hashId ?? this.hashId,
      goConfirmPage: goConfirmPage ?? this.goConfirmPage,
      goRegisterPage: goRegisterPage ?? this.goRegisterPage,
    );
  }

  @override
  List<dynamic> get props => [
        loading,
        timer,
        hashId,
        goConfirmPage,
        goRegisterPage,
      ];
}
