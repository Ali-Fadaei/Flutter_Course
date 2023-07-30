import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/domains/store_repository/models/product.dart';
import 'package:shop_app/domains/store_repository/store_repository.dart';

part 'favoriets_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
//
  final StoreRepository storeRepository;

  late StreamSubscription<List<Product>> favStreamListener;

  FavoritesCubit({
    required this.storeRepository,
  }) : super(FavoritesState(favorites: storeRepository.favorites)) {
    init();
  }

  void init() {
    favStreamListener = storeRepository.favStream.listen((event) {
      emit(state.copyWith(favorites: event));
    });
  }

  void onFavoriatePressed(Product product) {
    var temp = [...state.favorites];
    if (temp.contains(product)) {
      temp.remove(product);
    } else {
      temp.add(product);
    }
    storeRepository.updateFavs(temp);
    emit(state.copyWith(favorites: temp));
  }

  @override
  Future<void> close() {
    favStreamListener.cancel();
    return super.close();
  }
}
