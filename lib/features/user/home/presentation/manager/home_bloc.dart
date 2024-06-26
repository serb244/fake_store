import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/data/models/category/category_model.dart';
import '../../../../../core/domain/repository/category_repository.dart';
import '../../../../../core/error/exceptions.dart';


part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CategoryRepository categoryRepository;

  HomeBloc({required this.categoryRepository}) : super(HomeLoadingState()) {
    on<HomeInitEvent>(_init);
    on<HomeErrorEvent>(_error);
    on<HomeLoadedEvent>(_loaded);
    on<HomeLoadEvent>(_load);
    // categoryRepository.allCategoriesStream.listen((Either<BaseException, List<CategoryModel>> eitherCategoriesOrException) {
    //   eitherCategoriesOrException.fold(
    //     (exception) {
    //       add(HomeErrorEvent(exception: exception));
    //     },
    //     (categories) {
    //       add(HomeLoadedEvent(categories: categories));
    //     },
    //   );
    // });

    add(const HomeInitEvent());
  }
  _load (HomeLoadEvent event, emit) async {
    categoryRepository.getAllCategories();
  }
  _loaded(HomeLoadedEvent event, emit) {
    emit(HomeSuccessState(categoryList: [...event.categories]));
  }

  _error(HomeErrorEvent event, emit) {
    emit(HomeErrorState(error: event.exception.userMessage.toString()));
  }

  _init(HomeInitEvent event, emit) async {
    emit(HomeLoadingState());
    emit(const HomeSuccessState(categoryList: []));
    // final result = await categoryRepository.getAllCategories(force: true);
  }
}
