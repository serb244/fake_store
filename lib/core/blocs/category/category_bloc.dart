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
  // List<CategoryModel> allCategories = [];

  CategoryBloc({required this.categoryRepository}) : super(const CategoryLoadingState()) {
    on<CategorySaveEvent>(_saveCategory);
    on<CategoryListSuccessEvent>(_categoryListSuccess);
    on<CategoryItemSuccessEvent>(_categoryItemSuccess);
    on<CategorySuccessEvent>(_categorySuccess);
    on<CategoryInitEvent>(_init);
    on<CategoryErrorEvent>(_error);
    on<CategoryDeleteEvent>(_deleteCategory);
    on<CategoryGetByIdEvent>(_getById);
    categoryRepository.allCategoriesStream.listen((Either<BaseException, List<CategoryModel>> eitherCategoriesOrException) {
      eitherCategoriesOrException.fold(
        (exception) {
          add(CategoryErrorEvent(exception: exception));
        },
        (categories) {
          // allCategories = categories;
          add(CategoryListSuccessEvent(categories: [...categories]));
        },
      );
    });
  }
  _categoryListSuccess (CategoryListSuccessEvent event, Emitter<CategoryState> emit) async {
    emit(const CategoryLoadingState());
    emit(CategoryListSuccessState(allCategories: event.categories));
  }
  _categorySuccess (CategorySuccessEvent event, Emitter<CategoryState> emit) async {
    emit(const CategoryLoadingState());
    emit(CategorySuccessState(allCategories: event.categories, category: event.category));
  }
  _categoryItemSuccess (CategoryItemSuccessEvent event, Emitter<CategoryState> emit) async {
    emit(const CategoryLoadingState());
    emit(CategoryItemSuccessState(category: event.category));
  }
  _error(CategoryErrorEvent event, Emitter<CategoryState> emit) async {
    emit(const CategoryLoadingState());
    emit(CategoryErrorState(error: event.exception.userMessage.toString()));
  }

  _deleteCategory(CategoryDeleteEvent event, Emitter<CategoryState> emit) async {
    emit(const CategoryLoadingState());
    final result = await categoryRepository.deleteCategory(categoryId: event.categoryId);
  }
  _getById(CategoryGetByIdEvent event, Emitter<CategoryState> emit) async {
    emit(const CategoryLoadingState());
    if(event.isNedAllCategories) {
      final result = await categoryRepository.getCategoryAndListByID( categoryId: event.categoryId);
      result.fold(
        (BaseException l) => emit(CategoryErrorState(error: l.userMessage.toString())),
        (ItemAndList data) => emit(CategorySuccessState(allCategories: data.list, category: data.item)),
      );
    }else {
      final result = await categoryRepository.getCategoryByID(categoryId: event.categoryId);
      result.fold(
        (BaseException l) => emit(CategoryErrorState(error: l.userMessage.toString())),
        (category) => emit(CategoryItemSuccessState(category: category)),
      ) ;
    }
  }

  // получемние всех категорий из апи force: true в  categoryRepository.allCategoriesStream
  _init(CategoryInitEvent event, Emitter<CategoryState> emit) async {
    emit(const CategoryLoadingState());

    await categoryRepository.getAllCategories(force: event.force);
    // if (event.categoryId != 0) {
    //   final categoryResult = await categoryRepository.getCategoryByID(categoryId: event.categoryId);
    //   categoryResult.fold(
    //     (BaseException l) => emit(CategoryErrorState(error: l.userMessage.toString())),
    //     (category) => emit(CategoryLoadedState(allCategories: [...allCategories], category: category)),
    //   );
    // } else {
    //   emit(CategoryLoadedState(allCategories: [...allCategories], category: CategoryModel.init()));
    // }
  }

  _saveCategory(CategorySaveEvent event, Emitter<CategoryState> emit) async {
    // emit(const CategoryLoading());
    await categoryRepository.addCategory(categoryModel: event.category);
    // emit(CategoryLoaded(category: event.category, allCategories: allCategories));
  }
}
