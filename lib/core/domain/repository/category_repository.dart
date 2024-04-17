
import 'package:fpdart/fpdart.dart';

// import '../../data/models/category_model.dart';
import '../../data/models/category_model.dart';
import '../../error/error.dart';


abstract class CategoryRepository {
  Future<Either<BaseException, bool>> addCategory({required CategoryModel categoryModel});
  Future<Either<BaseException, CategoryModel>> getCategoryByID({int categoryId = 0});
  Future<Either<BaseException, bool>> deleteCategory({required int categoryId});
  Future<Either<BaseException,List<CategoryModel>>> getChildCategoryListByMainCategoryId({int? categoryId});
}
