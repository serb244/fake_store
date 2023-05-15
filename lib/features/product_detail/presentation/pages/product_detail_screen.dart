import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/domain/repository/products_repository.dart';
import '../manager/product_bloc.dart';

@RoutePage()
class ProductDetailScreen extends StatelessWidget {
  final int productID;
  // final String url;

  // final ProductModel productModel;

  const ProductDetailScreen(
      {@PathParam('url') required this.productID,
      // required this.productID,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('context.router.current.path = ${context.router.current.path}');
    return BlocProvider(
      create: (context) => ProductBloc(GetIt.I<ProductsRepository>())
        ..add(ProductGetDataEvent(productID: productID)),
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: state is ProductStartState
                  ? Text(state.productModel.title)
                  : const Text(''),
              leading: IconButton(
                icon: const Icon(Icons.chevron_left),
                //TODO dont work after refresh
                onPressed: () => context.router.pop(10),
              ),
            ),
            body: state is ProductStartState
                ? Text(state.productModel.description.toString())
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          );
        },
      ),
    );
  }
}
