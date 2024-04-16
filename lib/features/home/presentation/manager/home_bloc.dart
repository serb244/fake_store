import 'package:equatable/equatable.dart';
import 'package:fake_store/features/home/presentation/home_methods.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/models/category_model.dart';
import '../../../../core/domain/entities/menu_category_item_model.dart';
import '../../../../core/domain/repository/category_repository.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/entities/menu_category_item_model.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<CategoryModel> allCategories = [];
  final CategoryRepository categoryRepository;

  HomeBloc({required this.categoryRepository}) : super(HomeLoadingState()) {
    on<HomeInitEvent>(_init);
  }

  _init(HomeInitEvent event, emit) async {
    emit(HomeLoadingState());
    final result = await categoryRepository.getChildCategoryListByMainCategoryId();

    result.fold(
      (BaseException l) {
        //     TODO implement error
        emit(HomeErrorState(error: l.userMessage.toString()));
      },
      (r) {
        allCategories = [ ...r ];
        List<MenuCategoryItemModel> menuCategoryItems = getMenuCategoryItems( allCategories);
        emit(HomeSuccessState(menuCategoryItems: menuCategoryItems));
      },
    );
  }
}
