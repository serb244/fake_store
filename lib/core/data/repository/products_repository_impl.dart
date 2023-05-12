import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:fake_store/core/consts/api_constants.dart';
import 'package:fake_store/core/data/models/product_model.dart';
import '../../domain/repository/products_repository.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final Dio dio;

  ProductsRepositoryImpl({
    required this.dio,
  });
  @override
  Future<List<ProductModel>> getAllProducts() async {
    String path = ApiConstants.shopAPIUrlGetAllProducts;
    final response = await dio.get(path);
    final data = response.data;
    List<ProductModel> productsList = [];
    for (Map<String, dynamic> element in data) {
      productsList.add(ProductModel.fromJson(element));
    }
    log(productsList.length.toString());
    return productsList;
  }

  @override
  Future<List<ProductModel>> getProductsByCategory(String categoryName) async {
    String path =
        '${ApiConstants.shopAPIUrlGetProductsByCategory}/$categoryName';
    log(path);
    final response = await dio.get(path);
    final data = response.data;
    // log(data);
    List<ProductModel> productsList = [];
    for (Map<String, dynamic> element in data) {
      productsList.add(ProductModel.fromJson(element));
    }
    log(productsList.length.toString());
    return productsList;
  }

  @override
  Future<ProductModel> getProductByID(int id) async {
    String path = '${ApiConstants.shopAPIUrlGetAllProducts}/$id';

    final response = await dio.get(path);
    final data = response.data;
    final ProductModel product = ProductModel.fromJson(data);
    log('ProductModel product = $product');
    return product;
  }
}
