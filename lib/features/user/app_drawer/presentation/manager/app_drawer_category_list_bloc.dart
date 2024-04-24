// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fpdart/fpdart.dart';
//
// import '../../../../../core/data/models/category/category_model.dart';
// import '../../../../../core/domain/repository/category_repository.dart';
// import '../../../../../core/error/exceptions.dart';
//
//
// part 'app_drawer_category_list_event.dart';
//
// part 'app_drawer_category_list_state.dart';
//
// class AppDrawerCategoryListBloc extends Bloc<AppDrawerCategoryListEvent, AppDrawerCategoryListState> {
//   final CategoryRepository categoryRepository;
//
//   AppDrawerCategoryListBloc({required this.categoryRepository}) : super(const AppDrawerCategoryListLoadingState()) {
//     on<AppDrawerCategoryListInitialEvent>(_init);
//     on<AppDrawerCategoryListErrorEvent>(_error);
//     on<AppDrawerCategoryListSuccessEvent>(_loaded);
//     on<AppDrawerCategoryListDeleteEvent>(_deleteCategory);
//     categoryRepository.allCategoriesStream.listen((Either<BaseException, List<CategoryModel>> eitherCategoriesOrException) {
//       eitherCategoriesOrException.fold(
//         (exception) => add(AppDrawerCategoryListErrorEvent(exception: exception)),
//         (categories) => add(AppDrawerCategoryListSuccessEvent(categoryList: categories)),
//       );
//     });
//     add(const AppDrawerCategoryListInitialEvent());
//   }
//
//   _loaded(AppDrawerCategoryListSuccessEvent event, emit) {
//     emit(const AppDrawerCategoryListLoadingState());
//     emit(AppDrawerCategoryListSuccessState(allCategories:event.categoryList));
//   }
//
//   _deleteCategory(AppDrawerCategoryListDeleteEvent event, Emitter<AppDrawerCategoryListState> emit) async {
//     emit(const AppDrawerCategoryListLoadingState());
//  final res =  await categoryRepository.deleteCategory(categoryId: event.categoryId);
//     res.fold(
//           (exception) => add(AppDrawerCategoryListErrorEvent(exception: exception)),
//           (categories) => add(const AppDrawerCategoryListInitialEvent()),
//     );
//   }
//   _error(AppDrawerCategoryListErrorEvent event, emit) {
//     emit(const AppDrawerCategoryListLoadingState());
//     emit(AppDrawerCategoryListErrorState(error: event.exception.userMessage.toString()));
//   }
//
//   _init(AppDrawerCategoryListInitialEvent event, Emitter<AppDrawerCategoryListState> emit) async {
//     emit(const AppDrawerCategoryListLoadingState());
//     await categoryRepository.getAllCategories();
//   }
// }
