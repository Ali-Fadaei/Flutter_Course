part of 'app_cubit.dart';

class AppState extends Equatable {
//
  final int selectedDes;

  const AppState({
    this.selectedDes = 2,
  });

  AppState copywith({
    int? selectedDes,
  }) {
    return AppState(
      selectedDes: selectedDes ?? this.selectedDes,
    );
  }

  @override
  List<Object?> get props => [
        selectedDes,
      ];
}
