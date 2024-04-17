import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/data/models/category_model.dart';
import '../../../../../core/domain/repository/category_repository.dart';
import '../../../../../core/error/exceptions.dart';

part 'admin_category_event.dart';

part 'admin_category_state.dart';

class AdminCategoryBloc extends Bloc<AdminCategoryEvent, AdminCategoryState> {
  final CategoryRepository categoryRepository;
  List<CategoryModel> allCategories = [];
  AdminCategoryBloc({required this.categoryRepository}) : super(const AdminCategoryLoading()) {
    on<AdminCategorySaveEvent>(_saveCategory);
    on<AdminCategoryInitEvent>(_init);
    on<AdminCategoryDeleteEvent>(_deleteCategory);
  }
_deleteCategory(AdminCategoryDeleteEvent event, Emitter<AdminCategoryState> emit) async {
  emit(const AdminCategoryLoading());
  final result = await categoryRepository.deleteCategory(categoryId: event.categoryId);
  result.fold(

    (BaseException l) {
      //     TODO implement error
      emit(AdminCategoryError(error: l.userMessage ?? "" ));

    }
    ,
    (r) {
      emit(AdminCategoryLoaded(allCategories: allCategories, category: CategoryModel.init()));

    }
  );
}
  _init(AdminCategoryInitEvent event, Emitter<AdminCategoryState> emit) async {
    emit(const AdminCategoryLoading());
    CategoryModel category = CategoryModel.init();
    if (event.categoryId != 0) {
      final categoryResult = await categoryRepository.getCategoryByID(categoryId: event.categoryId);
      categoryResult.fold(
        (BaseException l) {
          //     TODO implement error
          emit(AdminCategoryError(error: l.userMessage.toString()));
        },
        (r) {
          category = r;
        },
      );
    }
    final result = await categoryRepository.getChildCategoryListByMainCategoryId();
    result.fold(
      (BaseException l) {
        //     TODO implement error
        emit(AdminCategoryError(error: l.userMessage.toString()));
      },
      (  List<CategoryModel> r) {
        allCategories = [...r];
        emit(AdminCategoryLoaded(allCategories: r, category: category));
      },
    );
  }

  _saveCategory(AdminCategorySaveEvent event, Emitter<AdminCategoryState> emit) async {
    emit(const AdminCategoryLoading());
    await categoryRepository.addCategory(categoryModel: event.category);
    emit(AdminCategoryLoaded(category: event.category, allCategories: allCategories));
  }
}
