part of 'product_bloc.dart';

@immutable
abstract class ProductEvent extends Equatable {}

class GetAllProducts extends ProductEvent {
  final Completer? completer;

  GetAllProducts([this.completer]);

  @override
  // TODO: implement props
  List<Object?> get props => [completer];
}
