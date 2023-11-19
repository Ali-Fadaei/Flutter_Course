part of 'app_cubit.dart';

class AppState extends Equatable {
//

  final bool jwtAuthCheck;

  const AppState({
    required this.jwtAuthCheck,
  });

  AppState copywith({
    bool? jwtAuthCheck,
  }) {
    return AppState(
      jwtAuthCheck: jwtAuthCheck ?? this.jwtAuthCheck,
    );
  }

  @override
  List<Object?> get props => [
        jwtAuthCheck,
      ];
}
