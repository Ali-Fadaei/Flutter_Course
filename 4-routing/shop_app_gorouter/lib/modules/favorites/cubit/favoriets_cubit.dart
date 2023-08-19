import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_gorouter/domains/store_repository/models/product.dart';
import 'package:shop_app_gorouter/domains/store_repository/store_repository.dart';

part 'favoriets_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
//
  final StoreRepository storeRepo;

  FavoritesCubit({
    required this.storeRepo,
  }) : super(const FavoritesState()) {
    init();
  }

  Future<void> init() async {
    emit(state.copyWith(loading: true));
    var res = await storeRepo.readFavorites();
    emit(state.copyWith(loading: false, favorites: res));
  }

  void onFavoriatePressed(Product product) async {
    var temp = [...state.favorites];
    if (temp.contains(product)) {
      temp.remove(product);
    } else {
      temp.add(product);
    }
    emit(state.copyWith(favorites: temp));
    await storeRepo.updateFavorites(temp);
  }
}
