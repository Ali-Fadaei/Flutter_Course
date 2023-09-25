part of 'search_cubit.dart';

class SearchState extends Equatable {
//
  final bool loading;

  final List<Category> categories;

  final List<Product> products;

  final List<Category> selectedCategories;

  final double minRating;

  final double maxRating;

  final int minPrice;

  final int maxPrice;

  final int sort;

  final int order;

  const SearchState({
    this.loading = false,
    this.categories = const [],
    this.products = const [],
    this.selectedCategories = const [],
    this.minRating = 0,
    this.maxRating = 5,
    this.minPrice = 0,
    this.maxPrice = 500000000,
    this.sort = 1,
    this.order = 1,
  });

  SearchState copyWith({
    bool? loading,
    List<Category>? categories,
    List<Product>? products,
    List<Category>? selectedCategories,
    double? minRating,
    double? maxRating,
    int? minPrice,
    int? maxPrice,
    int? sort,
    int? order,
  }) {
    return SearchState(
      loading: loading ?? this.loading,
      categories: categories ?? this.categories,
      products: products ?? this.products,
      selectedCategories: selectedCategories ?? this.selectedCategories,
      minRating: minRating ?? this.minRating,
      maxRating: maxRating ?? this.maxRating,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      sort: sort ?? this.sort,
      order: order ?? this.order,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        categories,
        products,
        selectedCategories,
        minPrice,
        maxPrice,
        minRating,
        maxRating,
        sort,
        order,
      ];
}
