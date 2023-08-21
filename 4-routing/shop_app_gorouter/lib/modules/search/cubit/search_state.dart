part of 'search_cubit.dart';

class SearchState extends Equatable {
//
  final bool loading;

  final List<Category> categories;

  final List<Product> products;

  final List<Category> selectedCategories;

  final double maxRating;

  final double minRating;

  final int maxPrice;

  final int minPrice;

  final int sortId;

  final int orderId;

  const SearchState({
    this.loading = false,
    this.categories = const [],
    this.products = const [],
    this.selectedCategories = const [],
    this.maxRating = 5,
    this.minRating = 0,
    this.maxPrice = 500000000,
    this.minPrice = 0,
    this.sortId = 1,
    this.orderId = 1,
  });

  SearchState copyWith({
    bool? loading,
    List<Category>? categories,
    List<Product>? products,
    List<Category>? selectedCategories,
    double? maxRating,
    double? minRating,
    int? maxPrice,
    int? minPrice,
    int? sortId,
    int? orderId,
  }) {
    return SearchState(
      loading: loading ?? this.loading,
      categories: categories ?? this.categories,
      products: products ?? this.products,
      selectedCategories: selectedCategories ?? this.selectedCategories,
      maxRating: maxRating ?? this.maxRating,
      minRating: minRating ?? this.minRating,
      maxPrice: maxPrice ?? this.maxPrice,
      minPrice: minPrice ?? this.minPrice,
      sortId: sortId ?? this.sortId,
      orderId: orderId ?? this.orderId,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        categories,
        products,
        selectedCategories,
        maxRating,
        minRating,
        maxPrice,
        minPrice,
        sortId,
        orderId,
      ];
}
