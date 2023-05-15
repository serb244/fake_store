import 'dart:async';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/domain/repository/products_repository.dart';
import '../manager/products_bloc.dart';
import '../widgets/product_item.dart';

@RoutePage()
class ProductsListScreen extends StatelessWidget {
  final String? categoryName;

  const ProductsListScreen(
      {@PathParam('categoryName') this.categoryName, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('context.router.currentUrl = ${context.router.currentUrl}');
    String? categoryNameNew = Uri.base.queryParameters['categoryNameNew'];
    log('categoryNameNew.toString() = ${categoryNameNew.toString()}');
    log('Uri.base = ${Uri.base}');
    return BlocProvider(
      create: (context) => ProductsBloc(
        GetIt.I<ProductsRepository>(),
        categoryName,
      )..add(GetAllProducts()),
      child: Scaffold(
        appBar: AppBar(
            title: Text(categoryName?.toUpperCase() ?? 'ProductsListScreen')),
        body: BlocBuilder<ProductsBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoadedState) {
              return RefreshIndicator(
                color: Colors.yellow,
                backgroundColor: Colors.red,
                displacement: 15,
                edgeOffset: 20,
                onRefresh: () async {
                  final Completer completer = Completer();
                  context.read<ProductsBloc>().add(GetAllProducts(completer));
                  return completer.future;
                },
                child: ListView.builder(
                  itemExtent: 150,
                  itemBuilder: (context, index) =>
                      ProductItem(product: state.productsList[index]),
                  itemCount: state.productsList.length,
                ),
              );
            } else if (state is ProductErrorState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.error),
                  TextButton(
                    onPressed: () =>
                        context.read<ProductsBloc>().add(GetAllProducts()),
                    child: const Text('RELOAD'),
                  )
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
