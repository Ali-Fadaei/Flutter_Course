part of 'home_cubit.dart';

class HomeState extends Equatable {
//
  final int selectedDes;

  const HomeState({
    this.selectedDes = 2,
  });

  HomeState copywith({
    int? selectedDes,
  }) {
    return HomeState(
      selectedDes: selectedDes ?? this.selectedDes,
    );
  }

  @override
  List<Object?> get props => [
        selectedDes,
      ];
}
