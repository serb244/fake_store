import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../core/data/models/category_model.dart';
import '../../../../core/data/models/category_model.dart';
import '../../../../core/domain/repository/category_repository.dart';
import '../../../../core/error/exceptions.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryBloc({required this.categoryRepository}) : super(const CategoryState()) {
    on<CategoryGetEvent>(_getCategory);
  }

  _getCategory(CategoryGetEvent event, Emitter<CategoryState> emit) async {
    emit(state.copyWith(isLoading: true));
    final  result = await categoryRepository.getChildCategoryListByMainCategoryId();
    // final  result = await categoryRepository.getCategoryByID(categoryId: 2);
    result.fold(
          (BaseException l){
            print("l.userMessage");
            print(l.userMessage);
            print(l.systemMessage);
            print(l.message);
            print(l.stackTrace);
            print("l.message");
            emit(state.copyWith(isLoading: false, error:l.userMessage));
          } ,
          (r) {
        emit(state.copyWith(isLoading: false, error: null, categoryModelList: r));
      },
    );

}
}
