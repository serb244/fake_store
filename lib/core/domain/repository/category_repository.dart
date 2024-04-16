
import 'package:fpdart/fpdart.dart';

// import '../../data/models/category_model.dart';
import '../../data/data_sources/remote/category_remote_data_source.dart';
import '../../data/models/category_model.dart';
import '../../error/error.dart';


abstract class CategoryRepository {
  Future<Either<BaseException, CategoryModel>> getCategoryByID({int categoryId = 0});
  Future<Either<BaseException,List<CategoryModel>>> getChildCategoryListByMainCategoryId({int? categoryId});
}
