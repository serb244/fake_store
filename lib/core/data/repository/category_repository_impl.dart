import 'package:fpdart/fpdart.dart';

import '../../domain/repository/category_repository.dart';
import '../../error/exceptions.dart';
import '../data_sources/remote/category_remote_data_source.dart';
import '../models/category_model.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final CategoryRemoteDataSource categoryRemoteDataSource;

  CategoryRepositoryImpl({required this.categoryRemoteDataSource});

  @override
  Future<Either<BaseException, CategoryModel>> getCategoryByID({int categoryId = 0}) async {
    try {
      final response = await categoryRemoteDataSource.getCategoryById(categoryId: categoryId);
      return Right(response);
    } on BaseException catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<BaseException,List<CategoryModel>>> getChildCategoryListByMainCategoryId({int? categoryId}) async {
    try {
      final List<CategoryModel> response = await categoryRemoteDataSource.getChildCategoryListByMainCategoryId(categoryId: categoryId);
      return Right(response);
    } on BaseException catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<BaseException, bool>> deleteCategory({required int categoryId}) async {
    try {
      final bool response = await categoryRemoteDataSource.deleteCategory(categoryId: categoryId);
      return Right(response);
    } on BaseException catch (e) {
      return left(e);
    }
  }
  @override
  Future<Either<BaseException, bool>> addCategory({required CategoryModel categoryModel}) async {
    try {
      final bool response = await categoryRemoteDataSource.addCategory(categoryModel: categoryModel);
      return Right(response);
    } on BaseException catch (e) {
      return left(e);
    }
  }
}
