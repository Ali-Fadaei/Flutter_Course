part of 'checkout_cubit.dart';

class CheckoutState extends Equatable {
//
  final bool loading;

  const CheckoutState({
    this.loading = false,
  });

  CheckoutState copyWith({
    bool? loading,
  }) {
    return CheckoutState(
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object?> get props => [
        loading,
      ];
}
