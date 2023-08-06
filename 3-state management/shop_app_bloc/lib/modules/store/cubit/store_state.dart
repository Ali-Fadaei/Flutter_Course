part of 'store_cubit.dart';

class StoreState extends Equatable {
  //
  final bool loading;

  final List<Product> products;

  const StoreState({this.products = const [], this.loading = false});

  StoreState copyWith({List<Product>? products, bool? loading}) {
    return StoreState(
      products: products ?? this.products,
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object?> get props => [loading, products];
}
