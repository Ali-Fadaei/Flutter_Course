part of 'favoriets_cubit.dart';

class FavoritesState extends Equatable {
//
  final bool loading;

  final List<Product> favorites;

  const FavoritesState({
    this.loading = false,
    this.favorites = const [],
  });

  FavoritesState copyWith({
    bool? loading,
    List<Product>? favorites,
  }) {
    return FavoritesState(
      loading: loading ?? this.loading,
      favorites: favorites ?? this.favorites,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        favorites,
      ];
}
