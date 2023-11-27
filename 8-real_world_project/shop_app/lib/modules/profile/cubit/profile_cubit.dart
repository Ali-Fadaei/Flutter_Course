import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/domains/user_repository/models/user.dart';
import 'package:shop_app/domains/user_repository/user_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  //

  final UserRepository _userRepo;

  ProfileCubit({required UserRepository userRepo})
      : _userRepo = userRepo,
        super(
          ProfileState(
            user: userRepo.readProfileSync(),
            processingOrders: 2,
            doneOrders: 10,
          ),
        );

  void onLogOutPressed() async {
    emit(state.copyWith(logOutLoading: true));
    try {
      await _userRepo.logOut();
      emit(state.copyWith(
        user: _userRepo.readProfileSync(),
      ));
    } finally {
      emit(state.copyWith(logOutLoading: false));
    }
  }
}
