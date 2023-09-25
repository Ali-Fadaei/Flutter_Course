part of 'store_cubit.dart';

class StoreState extends Equatable {
  //
  final bool loading;

  final List<Product> products;

  final Product? initialProduct;

  const StoreState({
    this.loading = false,
    this.products = const [],
    this.initialProduct,
  });

  StoreState copyWith({
    bool? loading,
    List<Product>? products,
    Product? initialProduct,
  }) {
    return StoreState(
      loading: loading ?? this.loading,
      products: products ?? this.products,
      initialProduct: initialProduct ?? this.initialProduct,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        products,
        initialProduct,
      ];
}
