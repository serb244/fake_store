// part of 'app_drawer_category_list_bloc.dart';
//
// abstract class AppDrawerCategoryListEvent extends Equatable {
//   const AppDrawerCategoryListEvent();
// }
//
// class AppDrawerCategoryListInitialEvent extends AppDrawerCategoryListEvent {
//   @override
//   List<Object> get props => [];
//
//   const AppDrawerCategoryListInitialEvent();
// }
//
// class AppDrawerCategoryListErrorEvent extends AppDrawerCategoryListEvent {
//   final BaseException exception;
//
//   const AppDrawerCategoryListErrorEvent({required this.exception});
//
//   @override
//   List<Object> get props => [];
// }
//
// class AppDrawerCategoryListSuccessEvent extends AppDrawerCategoryListEvent {
//   final List<CategoryModel> categoryList;
//
//   const AppDrawerCategoryListSuccessEvent({required this.categoryList});
//
//   @override
//   List<Object> get props => [categoryList];
// }
//
// class AppDrawerCategoryListDeleteEvent extends AppDrawerCategoryListEvent {
//   final  int categoryId;
//   const AppDrawerCategoryListDeleteEvent({required this.categoryId});
//   @override
//   List<Object?> get props => [categoryId];
// }