part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();
}

class ProductInitialState extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductStartState extends ProductState {
  final ProductModel productModel;

  @override
  List<Object> get props => [productModel];

  const ProductStartState({
    required this.productModel,
  });
}
