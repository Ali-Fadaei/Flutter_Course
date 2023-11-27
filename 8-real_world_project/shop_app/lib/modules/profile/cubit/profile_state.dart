part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  //

  // user
  final User? user;

  // history's
  final int doneOrders;
  final int processingOrders;

  final bool logOutLoading;

  const ProfileState({
    this.user,
    this.doneOrders = 0,
    this.processingOrders = 0,
    this.logOutLoading = false,
  });

  ProfileState copyWith({
    User? user,
    int? doneOrders,
    int? processingOrders,
    bool? logOutLoading,
  }) {
    return ProfileState(
      user: user ?? this.user,
      doneOrders: doneOrders ?? this.doneOrders,
      processingOrders: processingOrders ?? this.processingOrders,
      logOutLoading: logOutLoading ?? this.logOutLoading,
    );
  }

  @override
  List<Object?> get props => [
        user,
        doneOrders,
        processingOrders,
        logOutLoading,
      ];
}
