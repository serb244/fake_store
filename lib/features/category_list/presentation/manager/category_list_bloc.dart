import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/models/category_model.dart';
import '../../../../core/domain/repository/category_repository.dart';

part 'category_list_event.dart';
part 'category_list_state.dart';

class CategoryListBloc extends Bloc<CategoryListEvent, CategoryListState> {
  final CategoryRepository productsRepository;
  CategoryListBloc(this.productsRepository)
      : super(const CategoryListState(categoryList: [])) {
    on<CategoryListGetAllCategoryEvent>(_getAllCat);
  }
  void _getAllCat(CategoryListGetAllCategoryEvent event, emit) async {
    final List<CategoryModel> categoryList =
        await productsRepository.getAllCategories();
    emit(CategoryListState(categoryList: categoryList));
  }
}
