part of 'auth_cubit.dart';

class AuthState extends Equatable {
  //
  final bool loading;

  final String? hashId;

  final int timer;

  const AuthState({
    this.loading = false,
    this.timer = 0,
    this.hashId,
  });

  AuthState copyWith({
    bool? loading,
    int? timer,
    String? hashId,
  }) {
    return AuthState(
      loading: loading ?? this.loading,
      hashId: hashId ?? this.hashId,
      timer: timer ?? this.timer,
    );
  }

  @override
  List<dynamic> get props => [
        loading,
        hashId,
        timer,
      ];
}
