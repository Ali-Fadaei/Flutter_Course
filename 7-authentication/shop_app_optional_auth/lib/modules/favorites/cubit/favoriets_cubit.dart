import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shop_app_optional_auth/domains/store_repository/models/product.dart';
import 'package:shop_app_optional_auth/domains/store_repository/store_repository.dart';
import 'package:shop_app_optional_auth/domains/user_repository/user_repository.dart';

part 'favoriets_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  //
  final UserRepository _userRepo;

  final StoreRepository _storeRepo;

  FavoritesCubit({
    required UserRepository userRepo,
    required StoreRepository storeRepo,
  })  : _userRepo = userRepo,
        _storeRepo = storeRepo,
        super(
          const FavoritesState(),
        ) {
    init();
  }

  Future<void> init() async {
    emit(state.copyWith(loading: true));
    await _getFavorites();
    emit(state.copyWith(loading: false));
  }

  // Methods
  Future<void> _getFavorites() async {
    if (_userRepo.checkJwtAuth()) {
      final token = await _userRepo.getAccessToken();
      var res = await _storeRepo.readFavorites(token);
      emit(state.copyWith(favorites: res));
    } else {
      emit(state.copyWith(favorites: []));
    }
  }

  // Events
  void onFavoriatePressed(Product product) async {
    if (_userRepo.checkJwtAuth()) {
      final token = await _userRepo.getAccessToken();
      var temp = [...state.favorites];
      bool shouldRemove = temp.contains(product);
      if (shouldRemove) {
        await _storeRepo.removeFavorite(token, product);
        toast('!حذف شد');
      } else {
        await _storeRepo.addFavorite(token, product);
        toast('!اضافه شد');
      }
      await _getFavorites();
    }
  }
}
