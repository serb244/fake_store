import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/domain/repository/products_repository.dart';
import '../manager/product_bloc.dart';


class ProductDetailScreen extends StatelessWidget {

 const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductDetailScreen'),
      )
    ,body: Container(

    )
    );
  }
}
