part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();
}

class CategoryLoadingState extends CategoryState {
  @override
  List<Object> get props => [];

  const CategoryLoadingState();
}

class CategoryErrorState extends CategoryState {
  final String error;

  const CategoryErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

class CategorySuccessState extends CategoryState {
  final List<CategoryModel> categoryList;

  const CategorySuccessState({required this.categoryList});

  @override
  List<Object> get props => [categoryList];
}
// class CategoryState extends Equatable{
//   final bool isLoading;
//   // final CategoryModel? categoryModel;
//   final List<CategoryModel>? categoryModelList;
//   final String? error;
//   const CategoryState({
//     this.isLoading = false,
//     // this.categoryModel,
//     this.error,
//     this.categoryModelList,
//   });
//
//   @override
//   List<Object> get props => [ isLoading,   error ?? "" ];
//
//   CategoryState copyWith({
//     bool? isLoading,
//     CategoryModel? categoryModel,
//     String? error,
//     List<CategoryModel>? categoryModelList
//   }) {
//     print(error);
//     print(this.error);
//     print(error == this.error);
//
//
//     return CategoryState(
//       isLoading: isLoading ?? this.isLoading,
//       // categoryModel: categoryModel ?? this.categoryModel,
//       error: error ,
//       categoryModelList: categoryModelList ?? this.categoryModelList,
//     );
//   }
// }
