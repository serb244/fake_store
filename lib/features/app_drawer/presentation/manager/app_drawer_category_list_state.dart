part of 'app_drawer_category_list_bloc.dart';

abstract class AppDrawerCategoryListState extends Equatable {
  const AppDrawerCategoryListState();
}

class AppDrawerCategoryListLoadingState extends AppDrawerCategoryListState {
  @override
  List<Object> get props => [];

  const AppDrawerCategoryListLoadingState();
}

class AppDrawerCategoryListErrorState extends AppDrawerCategoryListState {
  final String error;

  const AppDrawerCategoryListErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

class AppDrawerCategoryListSuccessState extends AppDrawerCategoryListState {
  final List<CategoryModel> allCategories;

  const AppDrawerCategoryListSuccessState({required this.allCategories});

  @override
  List<Object?> get props => [allCategories];
}