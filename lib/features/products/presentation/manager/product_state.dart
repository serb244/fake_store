part of 'product_bloc.dart';

@immutable
abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  final List<ProductModel> productsList;

  const ProductLoadedState({
    required this.productsList,
  });

  @override
  List<Object?> get props => [productsList];
}

class ProductErrorState extends ProductState {
  final String error;

  const ProductErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}
