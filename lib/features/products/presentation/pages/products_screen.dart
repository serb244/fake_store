import 'package:dio/dio.dart';
import 'package:fake_store/features/products/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../data/remote/models/products_model.dart';
import '../../domain/repositories/products_repository.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<ProductModel> productsList = [];

  @override
  void initState() {
    getInitialList();
    super.initState();
  }

  Future<void> getInitialList() async {
    final list = await GetIt.I<ProductsRepository>().getAllProducts();
    productsList = list;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: productsList.isNotEmpty
          ? ListView.builder(
              // itemExtent: 150,
              itemBuilder: (context, index) =>
                  ProductItem(product: productsList[index]),
              itemCount: productsList.length,
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
