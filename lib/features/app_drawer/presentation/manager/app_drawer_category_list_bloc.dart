import 'package:equatable/equatable.dart';
import 'package:fake_store/features/home/presentation/home_methods.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/models/category_model.dart';
import '../../../../core/domain/entities/menu_category_item_model.dart';
import '../../../../core/domain/repository/category_repository.dart';

part 'app_drawer_category_list_event.dart';

part 'app_drawer_category_list_state.dart';

class AppDrawerCategoryListBloc extends Bloc<AppDrawerCategoryListEvent, AppDrawerCategoryListState> {
  final CategoryRepository categoryRepository;

  List<CategoryModel> allCategories = [];

  AppDrawerCategoryListBloc({required this.categoryRepository}) : super(AppDrawerCategoryListLoadingState()) {
    on<AppDrawerCategoryListInitialEvent>(_onAppDrawerCategoryListInitialEvent);
  }

  _onAppDrawerCategoryListInitialEvent(AppDrawerCategoryListInitialEvent event, Emitter<AppDrawerCategoryListState> emit) async {
    emit(AppDrawerCategoryListLoadingState());
    emit(AppDrawerCategoryListSuccessState(menuCategoryItems: getMenuCategoryItems(allCategories)));
  }
}
