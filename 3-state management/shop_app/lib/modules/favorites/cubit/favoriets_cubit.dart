import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/domains/store_repository/models/product.dart';

part 'favoriets_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
//

  FavoritesCubit() : super(FavoritesState());

  void onFavoriatePressed(Product product) {
    var temp = [...state.favorites];
    if (temp.contains(product)) {
      temp.remove(product);
    } else {
      temp.add(product);
    }
    emit(state.copyWith(favorites: temp));
  }
}
