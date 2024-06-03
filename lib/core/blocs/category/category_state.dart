part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  @override
  List<Object> get props => [];
  const CategoryState();
}

class CategoryLoadingState extends CategoryState {
  @override
  List<Object> get props => [];

  const CategoryLoadingState();
}

class CategorySuccessState extends CategoryState {
  // final CategoryModel category;
  final List<CategoryModel> allCategories;

  const CategorySuccessState({
    // required this.category,
    required this.allCategories,
  });

  @override
  List<Object> get props => [
        // category,
        allCategories,
      ];
}

// class CategoryAllSuccessState extends CategorySuccessState {
//   const CategoryAllSuccessState({required super.category, required super.allCategories});
//
//   // @override
//   // List<Object> get props => [category, allCategories];
// }
//
// class CategoryItemSuccessState extends CategorySuccessState {
//   const CategoryItemSuccessState({required super.category, super.allCategories =const []});
//
//   // @override
//   // List<Object> get props => [category, allCategories];
// }
//
// class CategoryListSuccessState extends CategorySuccessState {
//
//   const CategoryListSuccessState({ super.category = initCategory,required super.allCategories });
//
//   // @override
//   // List<Object> get props => [allCategories, category];
// }

class CategoryErrorState extends CategoryState {
  final String error;

  const CategoryErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
