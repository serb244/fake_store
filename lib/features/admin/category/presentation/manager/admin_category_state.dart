part of 'admin_category_bloc.dart';

abstract class AdminCategoryState extends Equatable {
  const AdminCategoryState();
}

class AdminCategoryLoadingState extends AdminCategoryState {
  @override
  List<Object> get props => [];

  const AdminCategoryLoadingState();
}

class AdminCategoryLoadedState extends AdminCategoryState {
  final CategoryModel category;
final List<CategoryModel> allCategories;
  const AdminCategoryLoadedState({required this.category, required this.allCategories});

  @override
  List<Object> get props => [category, allCategories];
}

class AdminCategoryErrorState extends AdminCategoryState {
  final String error;

  const AdminCategoryErrorState({ required this.error});

  @override
  List<Object> get props => [error];
}
