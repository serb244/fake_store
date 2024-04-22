import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../core/data/models/category_model.dart';
import '../../../../../core/domain/repository/category_repository.dart';
import '../../../../../core/error/exceptions.dart';

part 'admin_category_event.dart';

part 'admin_category_state.dart';

class AdminCategoryBloc extends Bloc<AdminCategoryEvent, AdminCategoryState> {
  final CategoryRepository categoryRepository;
  List<CategoryModel> allCategories = [];

  AdminCategoryBloc({required this.categoryRepository}) : super(const AdminCategoryLoadingState()) {
    on<AdminCategorySaveEvent>(_saveCategory);
    on<AdminCategoryInitEvent>(_init);
    on<AdminCategoryErrorEvent>(_error);
    on<AdminCategoryDeleteEvent>(_deleteCategory);
    categoryRepository.allCategoriesStream.listen((Either<BaseException, List<CategoryModel>> eitherCategoriesOrException) {
      eitherCategoriesOrException.fold(
        (exception) {
          add(AdminCategoryErrorEvent(message: exception.userMessage.toString()));
        },
        (categories) {
          allCategories = categories;
        },
      );
    });
  }

  _error(AdminCategoryErrorEvent event, Emitter<AdminCategoryState> emit) async {
    emit(const AdminCategoryLoadingState());
    emit(AdminCategoryErrorState(error: event.message));
  }

  _deleteCategory(AdminCategoryDeleteEvent event, Emitter<AdminCategoryState> emit) async {
    emit(const AdminCategoryLoadingState());
    final result = await categoryRepository.deleteCategory(categoryId: event.categoryId);
  }

  _init(AdminCategoryInitEvent event, Emitter<AdminCategoryState> emit) async {
    emit(const AdminCategoryLoadingState());
    await categoryRepository.getAllCategories();
    if (event.categoryId != 0) {
      final categoryResult = await categoryRepository.getCategoryByID(categoryId: event.categoryId);
      categoryResult.fold(
        (BaseException l) => emit(AdminCategoryErrorState(error: l.userMessage.toString())),
        (category) => emit(AdminCategoryLoadedState(allCategories: [...allCategories], category: category)),
      );
    } else {
      emit(AdminCategoryLoadedState(allCategories: [...allCategories], category: CategoryModel.init()));
    }
  }

  _saveCategory(AdminCategorySaveEvent event, Emitter<AdminCategoryState> emit) async {
    // emit(const AdminCategoryLoading());
    await categoryRepository.addCategory(categoryModel: event.category);
    // emit(AdminCategoryLoaded(category: event.category, allCategories: allCategories));
  }
}
