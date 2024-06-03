import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/data/models/product_model.dart';
import '../../../../../core/domain/repository/products_repository.dart';


part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductEvent, ProductState> {
  final ProductsRepository productsRepository;
  final String? categoryName;
  ProductsBloc(
    this.productsRepository,
    this.categoryName,
  ) : super(ProductLoadingState()) {
    on<GetAllProducts>(_getAllProducts);
  }
  _getAllProducts(GetAllProducts event, emit) async {
    List<ProductModel> productsList = [];
    if (state is! ProductLoadedState) {
      emit(ProductLoadingState());
    }
    print('categoryName= $categoryName');
    try {
      categoryName == null
          ? productsList = await productsRepository.getAllProducts()
          : productsList =
              await productsRepository.getProductsByCategory(categoryName!);
      // await Future.delayed(const Duration(seconds: 3));
      emit(ProductLoadedState(productsList: productsList));
    } catch (e) {
      print('ProductLoadingState() ERROR $e');
      if (e is DioException) {}
      log(e.toString());
      emit(ProductErrorState(error: e.toString()));
    } finally {
      event.completer?.complete();
    }
  }
}
