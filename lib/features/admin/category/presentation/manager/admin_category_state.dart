part of 'admin_category_bloc.dart';

abstract class AdminCategoryState extends Equatable {
  const AdminCategoryState();
}

class AdminCategoryLoading extends AdminCategoryState {
  @override
  List<Object> get props => [];

  const AdminCategoryLoading();
}

class AdminCategoryLoaded extends AdminCategoryState {
  final CategoryModel category;
final List<CategoryModel> allCategories;
  const AdminCategoryLoaded({required this.category, required this.allCategories});

  @override
  List<Object> get props => [category, allCategories];
}

class AdminCategoryError extends AdminCategoryState {
  final String error;

  const AdminCategoryError({ required this.error});

  @override
  List<Object> get props => [error];
}
