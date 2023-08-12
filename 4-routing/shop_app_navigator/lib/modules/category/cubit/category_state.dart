part of 'category_cubit.dart';

class CategoryState extends Equatable {
//
  final bool loading;

  final Category? category;

  final List<Product> products;

  final double minPrice;

  final double maxPrice;

  final double minRating;

  final double maxRating;

  final int sort;

  final int order;

  const CategoryState({
    this.loading = false,
    this.category,
    this.products = const [],
    this.minPrice = 0,
    this.maxPrice = 500000000,
    this.minRating = 0,
    this.maxRating = 5,
    this.sort = 1,
    this.order = 1,
  });

  CategoryState copyWith(
      {bool? loading,
      Category? category,
      List<Product>? products,
      double? minPrice,
      double? maxPrice,
      double? minRating,
      double? maxRating,
      int? sort,
      int? order}) {
    return CategoryState(
      loading: loading ?? this.loading,
      category: category ?? this.category,
      products: products ?? this.products,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      minRating: minRating ?? this.minRating,
      maxRating: maxRating ?? this.maxRating,
      sort: sort ?? this.sort,
      order: order ?? this.order,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        category,
        products,
        minPrice,
        maxPrice,
        minRating,
        maxRating,
        sort,
        order,
      ];
}
