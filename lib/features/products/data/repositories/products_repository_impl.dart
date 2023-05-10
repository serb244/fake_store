import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:fake_store/core/consts/constants.dart';
import 'package:fake_store/features/products/data/remote/models/products_model.dart';
import '../../domain/repositories/products_repository.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final Dio dio;

  ProductsRepositoryImpl({
    required this.dio,
  });
  @override
  Future<List<ProductModel>> getAllProducts() async {
    final response = await dio.get(Constants.shopAPIUrl);
    final data = response.data;
    List<ProductModel> productsList = [];
    for (Map<String, dynamic> element in data) {
      productsList.add(ProductModel.fromJson(element));
    }
    log(productsList.length.toString());
    return productsList;
  }
}
