part of 'category_list_bloc.dart';

class CategoryListState extends Equatable {
  final List<CategoryModel> categoryList;

  @override
  // TODO: implement props
  List<Object?> get props => [categoryList];

  const CategoryListState({
    required this.categoryList,
  });
}
//
// class CategoryListInitial extends CategoryListState {
//   @override
//   List<Object> get props => [];
// }
