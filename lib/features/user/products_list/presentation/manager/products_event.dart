part of 'products_bloc.dart';

@immutable
abstract class ProductEvent extends Equatable {}

class GetAllProducts extends ProductEvent {
  final Completer? completer;

  GetAllProducts([this.completer]);

  @override
  List<Object?> get props => [completer];
}
