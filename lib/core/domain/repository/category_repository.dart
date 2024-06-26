
import 'package:fpdart/fpdart.dart';

// import '../../data/models/category_model.dart';
import '../../data/models/category/category_model.dart';
import '../../error/error.dart';


abstract class CategoryRepository {
  Stream<Either<BaseException,List<CategoryModel>>> get allCategoriesStream ;
  Future<Either<BaseException, CategoryModel>> addCategory({required CategoryModel categoryModel});
  Future<Either<BaseException, CategoryModel>> getCategoryByID({int categoryId = 0, bool force = false});
  Future<Either<BaseException, ItemAndList>> getCategoryAndListByID({int categoryId = 0, bool force = false});
  Future<Either<BaseException, bool>> deleteCategory({required int categoryId});
  Future<Either<BaseException,List<CategoryModel>>> getChildCategoryListByMainCategoryId({int? categoryId});
  Future<Either<BaseException,List<CategoryModel>>> getAllCategories({bool force = false});
}