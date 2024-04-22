import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/data/models/product_model.dart';
import '../../../../../core/domain/repository/products_repository.dart';


part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductsRepository productsRepository;
  ProductBloc(this.productsRepository) : super(ProductInitialState()) {
    on<ProductGetDataEvent>(_getData);
  }
  void _getData(ProductGetDataEvent event, emit) async {
    final ProductModel productModel =
        await productsRepository.getProductByID(event.productID);
    emit(ProductStartState(productModel: productModel));
  }
}
