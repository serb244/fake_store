
import '../../../../generated/l10n.dart';
import '../../../error/error.dart';
import '../../../utils/logging/my_logger.dart';
import '../../../utils/request/consts.dart';
import '../../../utils/request/request.dart';
import '../../models/category_model.dart';

abstract class CategoryRemoteDataSource {
  // TaskEither<BaseException, CategoryModel> getCategory({int? categoryId});
  Future<CategoryModel> getCategoryById({int categoryId});
  Future<List<CategoryModel>> getChildCategoryListByMainCategoryId({int? categoryId});
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final ApiClient _request;

  CategoryRemoteDataSourceImpl({required request}) : _request = request;

  @override
  Future<CategoryModel> getCategoryById({int categoryId = 0}) async {
    final path =  categoryByIdUrl + categoryId.toString();
    try {
      final response = await _request.get(path);
      try {
        print("response.data ${response.data}");
        print("response.data ${response.data.runtimeType}");
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
    print("categoryId $categoryId");
final path =  categoryId == null ? allCategoriesUrl : allCategoriesUrl + categoryId.toString();
print("path $path");
    try {
      final response = await _request.get(path);
      try {
        List<CategoryModel> categoryModelList = [];
        for (Map<String, dynamic> value in response.data){
          print("descriptions ${value}");
          print("descriptions ${value["description"][0].runtimeType}");
        final  categoryModel = CategoryModel.fromJson(value);
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
