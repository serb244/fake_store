import 'package:dio/dio.dart';

import '../../../../generated/l10n.dart';
import '../../../error/error.dart';
import '../../../utils/logging/my_logger.dart';
import '../../../utils/request/consts.dart';
import '../../../utils/request/request.dart';
import '../../models/category/category_model.dart';

abstract class CategoryRemoteDataSource {
  Future<CategoryModel> addCategory({required CategoryModel categoryModel});

  Future<bool> deleteCategory({required int categoryId});

  Future<CategoryModel> getCategoryById({int categoryId});

  Future<List<CategoryModel>> getChildCategoryListByMainCategoryId({int? categoryId});
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final ApiClient _apiClient;

  CategoryRemoteDataSourceImpl({required apiClient}) : _apiClient = apiClient;

  @override
  Future<CategoryModel> addCategory({required CategoryModel categoryModel}) async {
    final path = "${categoryByIdUrl}2/";
    try {
      final jsonData = categoryModel.toJson();
      final response = await _apiClient.request(
        path,
        requestType: RequestType.post,
        data: jsonData,
        options: Options(
          contentType: Headers.jsonContentType,
        ),
      );
      // TODO check response statusCode is 201
      // return response.statusCode == 201 ?  true :  false;
      if (response.statusCode == 201) {
        try {
          CategoryModel value = CategoryModel.fromJson(response.data);
          return value;
        } catch (e) {
          final userMessage = "${S.current.error_data_loading_failed} ${S.current.error_try_again}";
          MyLogger().log(message: e.toString(), error: e.toString(), stackTrace: StackTrace.current, logLevel: LogLevel.error);
          throw LocalDataException(userMessage: userMessage, stackTrace: StackTrace.current);
        }
      } else {
        throw ApiException(
            userMessage: S.current.error_unknown,
            stackTrace: StackTrace.current,
            type: DioExceptionType.badResponse,
            message: "addCategory response.statusCode != 201",
            requestOptions: response.requestOptions,
            response: response);
      }
    } on BaseException {
      rethrow;
    } catch (e) {
      MyLogger().log(message: e.toString(), error: e.toString(), stackTrace: StackTrace.current, logLevel: LogLevel.error);
      throw UnexpectedException(stackTrace: StackTrace.current, userMessage: S.current.error_unknown);
    }
  }

  @override
  Future<bool> deleteCategory({required int categoryId}) async {
    final path = "$categoryByIdUrl$categoryId/";
    try {
      final response = await _apiClient.request(path, requestType: RequestType.delete);
      try {
        //  TODO check response statusCode is 204

        return true;
      } catch (e) {
        final userMessage = "${S.current.error_data_loading_failed} ${S.current.error_try_again}";
        MyLogger().log(message: e.toString(), error: e.toString(), stackTrace: StackTrace.current, logLevel: LogLevel.error);
        throw LocalDataException(userMessage: userMessage, stackTrace: StackTrace.current);
      }
    } on BaseException {
      rethrow;
    } catch (e) {
      MyLogger().log(message: e.toString(), error: e.toString(), stackTrace: StackTrace.current, logLevel: LogLevel.error);
      throw UnexpectedException(stackTrace: StackTrace.current, userMessage: S.current.error_unknown);
    }
  }

  @override
  Future<CategoryModel> getCategoryById({int categoryId = 0}) async {
    final path = categoryByIdUrl + categoryId.toString();
    try {
      final response = await _apiClient.request(path);
      try {
        CategoryModel value = CategoryModel.fromJson(response.data);
        return value;
      } catch (e) {
        final userMessage = "${S.current.error_data_loading_failed} ${S.current.error_try_again}";
        MyLogger().log(message: e.toString(), error: e.toString(), stackTrace: StackTrace.current, logLevel: LogLevel.error);
        throw LocalDataException(userMessage: userMessage, stackTrace: StackTrace.current);
      }
    } on BaseException {
      rethrow;
    } catch (e) {
      MyLogger().log(message: e.toString(), error: e.toString(), stackTrace: StackTrace.current, logLevel: LogLevel.error);
      throw UnexpectedException(stackTrace: StackTrace.current, userMessage: S.current.error_unknown);
    }
  }

  @override
  Future<List<CategoryModel>> getChildCategoryListByMainCategoryId({int? categoryId}) async {
    final path = categoryId == null ? allCategoriesUrl : allCategoriesUrl + categoryId.toString();
    try {
      final response = await _apiClient.request(path);
      try {
        List<CategoryModel> categoryModelList = [];
        // print("response.data : ${response.data}");
        for (Map<String, dynamic> value in response.data) {
          final categoryModel = CategoryModel.fromJson(value);
          categoryModelList.add(categoryModel);
        }
        // List<CategoryModel> value = response.data.map((e) => CategoryModel.fromJson(response.data )).toList();
        return categoryModelList;
      } catch (e) {
        final userMessage = "${S.current.error_data_parsing_failed} ${S.current.error_try_again}";
        MyLogger().log(message: e.toString(), error: e.toString(), stackTrace: StackTrace.current, logLevel: LogLevel.error);
        throw LocalDataException(userMessage: userMessage, stackTrace: StackTrace.current);
      }
    } on BaseException {
      rethrow;
    } catch (e) {
      MyLogger().log(message: e.toString(), error: e.toString(), stackTrace: StackTrace.current, logLevel: LogLevel.error);
      throw UnexpectedException(stackTrace: StackTrace.current, userMessage: S.current.error_unknown);
    }
  }
}
