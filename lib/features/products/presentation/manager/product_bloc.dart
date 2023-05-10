import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/remote/models/products_model.dart';
import '../../domain/repositories/products_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductsRepository productsRepository;
  ProductBloc(this.productsRepository) : super(ProductLoadingState()) {
    on<GetAllProducts>(_getAllProducts);
  }
  _getAllProducts(GetAllProducts event, emit) async {
    if (state is! ProductLoadedState) {
      emit(ProductLoadingState());
    }
    try {
      final List<ProductModel> productsList =
          await productsRepository.getAllProducts();
      // await Future.delayed(const Duration(seconds: 3));
      emit(ProductLoadedState(productsList: productsList));
    } catch (e) {
      if (e is DioError) {}
      log(e.toString());
      emit(ProductErrorState(error: e.toString()));
    } finally {
      event.completer?.complete();
    }
  }
}
