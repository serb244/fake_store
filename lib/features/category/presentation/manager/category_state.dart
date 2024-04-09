part of 'category_bloc.dart';

class CategoryState extends Equatable{
  final bool isLoading;
  final CategoryModel? categoryModel;
  final String? error;
  const CategoryState({
    this.isLoading = false,
    this.categoryModel,
    this.error,
  });

  @override
  List<Object> get props => [ isLoading,   error ?? "" ];

  CategoryState copyWith({
    bool? isLoading,
    CategoryModel? categoryModel,
    String? error,
  }) {
    print(error);
    print(this.error);
    print(error == this.error);


    return CategoryState(
      isLoading: isLoading ?? this.isLoading,
      categoryModel: categoryModel ?? this.categoryModel,
      error: error ,
    );
  }
}