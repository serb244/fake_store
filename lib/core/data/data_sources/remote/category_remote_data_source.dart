import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../../consts/api_constants.dart';
import '../../../error/error.dart';
import '../../../utils/logging/my_logger.dart';
import '../../../utils/request/request.dart';
import '../../models/category_model.dart';

abstract class CategoryRemoteDataSource {
  // TaskEither<BaseException, CategoryModel> getCategory({int? categoryId});
  Future<CategoryModel> getCategory({int categoryId});
}

class CategoryModel {
  final String name;

  CategoryModel({required this.name});
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final ApiClient _request;

  CategoryRemoteDataSourceImpl({required request}) : _request = request;

  @override
  Future<CategoryModel> getCategory({int categoryId = 0}) async {
    try {
      final response = await _request.get(ApiConstants.shopAPIUrlGetAllCategories);
      try {
        CategoryModel value = CategoryModel(name: response.data[categoryId]);
        return value;
      } catch (e) {
        throw LocalDataException();
      }
    } on BaseException {

      rethrow;
    } catch (e) {
      throw UnexpectedException();
    }
  }
}
