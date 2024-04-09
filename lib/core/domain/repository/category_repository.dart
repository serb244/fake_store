
import 'package:fpdart/fpdart.dart';

// import '../../data/models/category_model.dart';
import '../../data/data_sources/remote/category_remote_data_source.dart';
import '../../error/error.dart';


abstract class CategoryRepository {
  Future<Either<BaseException, CategoryModel>> getCategory({int categoryId = 0});
}
