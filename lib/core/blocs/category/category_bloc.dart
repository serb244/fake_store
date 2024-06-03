import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../core/data/models/category/category_model.dart';
import '../../../../../core/domain/repository/category_repository.dart';
import '../../../../../core/error/exceptions.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryBloc({required this.categoryRepository}) : super(const CategoryLoadingState()) {
    on<CategorySaveEvent>(_saveCategory);
    on<CategorySuccessEvent>(_categorySuccess);
    on<CategoryInitEvent>(_init);
    on<CategoryErrorEvent>(_error);
    on<CategoryDeleteEvent>(_deleteCategory);
    categoryRepository.allCategoriesStream.listen((
      Either<BaseException, List<CategoryModel>> eitherCategoriesOrException,
    ) {
      eitherCategoriesOrException.fold(
        (exception) {
          add(CategoryErrorEvent(exception: exception));
        },
        (categories) {
          add(CategorySuccessEvent(categories: [...categories]));
        },
      );
    });
  }

  _categorySuccess(CategorySuccessEvent event, Emitter<CategoryState> emit) async {
    emit(const CategoryLoadingState());
    emit(CategorySuccessState(allCategories: event.categories));
  }

  _error(CategoryErrorEvent event, Emitter<CategoryState> emit) async {
    emit(const CategoryLoadingState());
    String error = event.exception.userMessage.toString();
    // if (event.exception is ApiException) {
    //   error = (event.exception as ApiException).response?.data['error'].toString() ?? error;
    // }
    emit(CategoryErrorState(error: error));
  }

  _deleteCategory(CategoryDeleteEvent event, Emitter<CategoryState> emit) async {
    emit(const CategoryLoadingState());
    await categoryRepository.deleteCategory(categoryId: event.categoryId);
  }

  // получемние всех категорий из апи force: true в  categoryRepository.allCategoriesStream
  _init(CategoryInitEvent event, Emitter<CategoryState> emit) async {
    emit(const CategoryLoadingState());

    await categoryRepository.getAllCategories(force: event.force);
  }

  _saveCategory(CategorySaveEvent event, Emitter<CategoryState> emit) async {
    emit(const CategoryLoadingState());
    await categoryRepository.addCategory(categoryModel: event.category);
  }
}
