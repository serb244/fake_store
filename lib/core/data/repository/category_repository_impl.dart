import 'dart:async';

import 'package:fpdart/fpdart.dart';

import '../../domain/repository/category_repository.dart';
import '../../error/exceptions.dart';
import '../data_sources/remote/category_remote_data_source.dart';
import '../models/category/category_model.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final CategoryRemoteDataSource categoryRemoteDataSource;

  CategoryRepositoryImpl({required this.categoryRemoteDataSource});

  List<CategoryModel> _categories = [];

  final StreamController<Either<BaseException, List<CategoryModel>>>_controller = StreamController<Either<BaseException, List<CategoryModel>>>.broadcast();

  @override
  Stream<Either<BaseException, List<CategoryModel>>> get allCategoriesStream => _controller.stream.asBroadcastStream();

  void addToStream(Either<BaseException, List<CategoryModel>> items) => _controller.sink.add(items);

  @override
  Future<Either<BaseException, CategoryModel>> getCategoryByID({int categoryId = 0, bool force = false}) async {
    try {
      CategoryModel category = CategoryModel.init();
      if(categoryId != 0){
        category = await categoryRemoteDataSource.getCategoryById(categoryId: categoryId);
      }
      return Right(category);
    } on BaseException catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<BaseException, List<CategoryModel>>> getChildCategoryListByMainCategoryId({int? categoryId, bool force = false}) async {
    if (force) {
      try {
        final List<CategoryModel> response = await categoryRemoteDataSource.getChildCategoryListByMainCategoryId(categoryId: categoryId);
        return Right(response);
      } on BaseException catch (e) {
        return left(e);
      }
    }else{
      return Right(_categories);
    }
  }

  @override
  Future<Either<BaseException, bool>> deleteCategory({required int categoryId, bool force = true}) async {
    try {
      final bool response = await categoryRemoteDataSource.deleteCategory(categoryId: categoryId);
      if(response){
        _categories.removeWhere((element) => element.id == categoryId);
        addToStream(Right([..._categories]));
      }
      return Right(response);
    } on BaseException catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<BaseException, CategoryModel>> addCategory({required CategoryModel categoryModel, bool force = false}) async {
    try {
      final CategoryModel response = await categoryRemoteDataSource.addCategory(categoryModel: categoryModel);
        _categories.add(response);
        addToStream(Right([..._categories]));
      return Right(response);
    } on BaseException catch (e) {
      return left(e);
    }
  }
  Future<Either<BaseException, List<CategoryModel>>> getAllCategoriesForce() async {
    try {
      final List<CategoryModel> response = await categoryRemoteDataSource.getChildCategoryListByMainCategoryId();
      _categories = [...response];
      addToStream(Right(_categories));
      return   Right(_categories);
    } on BaseException catch (e) {
      addToStream(Left(e));
      return Left(e);
    }
  }

  @override
  Future<Either<BaseException, List<CategoryModel>>> getAllCategories({bool force = false}) async {
    if (force) {
      return  await getAllCategoriesForce();
    } else {
      try {
        return  Right(_categories);
      } on BaseException catch (e) {
        addToStream(left(e));
        return Left(e);
      }
    }
  }

  @override
  Future<Either<BaseException, ItemAndList>> getCategoryAndListByID({int categoryId = 0, bool force = false})  async {
    try {
       CategoryModel category = CategoryModel.init();
      if(categoryId != 0){
        category = await categoryRemoteDataSource.getCategoryById(categoryId: categoryId);
      }
      List<CategoryModel> list = _categories;
      if ( force) {
       list = await categoryRemoteDataSource.getChildCategoryListByMainCategoryId();
      }
      return Right(ItemAndList(item: category, list: list));
    } on BaseException catch (e) {
      return left(e);
    }
  }
}
