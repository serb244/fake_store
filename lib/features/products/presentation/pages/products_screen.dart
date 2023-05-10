import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:fake_store/features/products/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../domain/repositories/products_repository.dart';
import '../manager/product_bloc.dart';

@RoutePage()
class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) =>
            ProductBloc(GetIt.I<ProductsRepository>())..add(GetAllProducts()),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoadedState) {
              return RefreshIndicator(
                color: Colors.yellow,
                backgroundColor: Colors.red,
                displacement: 15,
                edgeOffset: 20,
                onRefresh: () async {
                  final Completer completer = Completer();
                  context.read<ProductBloc>().add(GetAllProducts(completer));
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
                        context.read<ProductBloc>().add(GetAllProducts()),
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
