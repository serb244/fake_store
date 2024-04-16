
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/repository/category_repository.dart';

part 'admin_category_event.dart';
part 'admin_category_state.dart';

class AdminCategoryBloc extends Bloc<AdminCategoryEvent, AdminCategoryState> {
  final CategoryRepository categoryRepository;
  AdminCategoryBloc({required this.categoryRepository}) : super(AdminCategoryInitial()) {
    on<AdminCategoryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
