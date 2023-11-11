import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_auth/domains/user_repository/user_repository.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
//
  final UserRepository _userRepo;

  AppCubit({
    required UserRepository userRepo,
  })  : _userRepo = userRepo,
        super(
          AppState(jwtAuthCheck: userRepo.checkJwtAuth()),
        ) {
    init();
  }

  void init() {
    _userRepo.jwtAuthStream.listen((event) {
      emit(state.copywith(jwtAuthCheck: event));
    });
  }
}
