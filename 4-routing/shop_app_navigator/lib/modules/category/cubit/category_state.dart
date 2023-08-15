part of 'category_cubit.dart';

class CategoryState extends Equatable {
//
  final bool loading;

  final Category? category;

  final List<Product> products;

  final double maxRating;

  final double minRating;

  final int maxPrice;

  final int minPrice;

  final int sortId;

  final int orderId;

  const CategoryState({
    this.category,
    this.loading = false,
    this.products = const [],
    this.maxRating = 5,
    this.minRating = 0,
    this.maxPrice = 500000000,
    this.minPrice = 0,
    this.sortId = 1,
    this.orderId = 1,
  });

  CategoryState copyWith({
    bool? loading,
    Category? category,
    List<Product>? products,
    double? maxRating,
    double? minRating,
    int? maxPrice,
    int? minPrice,
    int? sortId,
    int? orderId,
  }) {
    return CategoryState(
      loading: loading ?? this.loading,
      category: category ?? this.category,
      products: products ?? this.products,
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
        category,
        products,
        maxRating,
        minRating,
        maxPrice,
        minPrice,
        sortId,
        orderId,
      ];
}
