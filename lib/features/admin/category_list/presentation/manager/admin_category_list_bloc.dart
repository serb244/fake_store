import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'admin_category_list_event.dart';
part 'admin_category_list_state.dart';

class AdminCategoryListBloc extends Bloc<AdminCategoryListEvent, AdminCategoryListState> {
  AdminCategoryListBloc() : super(AdminCategoryListInitial()) {
    on<AdminCategoryListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
