part of 'categories_cubit.dart';

class CategoriesState extends Equatable {
//
  final bool loading;

  final List<Category> categories;

  const CategoriesState({
    this.loading = false,
    this.categories = const [],
  });

  CategoriesState copyWith({
    bool? loading,
    List<Category>? categories,
  }) {
    return CategoriesState(
      loading: loading ?? this.loading,
      categories: categories ?? this.categories,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        categories,
      ];
}
