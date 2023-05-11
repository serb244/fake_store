part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class ProductGetDataEvent extends ProductEvent {
  final int productID;

  @override
  List<Object?> get props => [productID];

  const ProductGetDataEvent({
    required this.productID,
  });
}
