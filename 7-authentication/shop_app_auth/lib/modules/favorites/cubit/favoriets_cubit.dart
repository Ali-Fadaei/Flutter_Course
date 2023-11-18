import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shop_app_auth/domains/store_repository/models/product.dart';
import 'package:shop_app_auth/domains/store_repository/store_repository.dart';
import 'package:shop_app_auth/domains/user_repository/user_repository.dart';

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
        );

  Future<void> init() async {
    emit(state.copyWith(loading: true));
    await _getFavorites();
    emit(state.copyWith(loading: false));
  }

  // Methods
  Future<void> _getFavorites() async {
    final token = _userRepo.accessToken;
    var res = await _storeRepo.readFavorites(token);
    emit(state.copyWith(favorites: res));
  }

  // Events
  void onFavoriatePressed(Product product) async {
    final token = _userRepo.accessToken;
    print(token);
    var temp = [...state.favorites];
    bool shouldRemove = temp.contains(product);
    if (shouldRemove) {
      await _storeRepo.removeFavorite(product, token);
      toast('!حذف شد');
    } else {
      await _storeRepo.addFavorite(product, token);
      toast('!اضافه شد');
    }
    await _getFavorites();
  }
}
