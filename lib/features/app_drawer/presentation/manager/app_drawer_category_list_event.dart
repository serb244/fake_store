part of 'app_drawer_category_list_bloc.dart';

abstract class AppDrawerCategoryListEvent extends Equatable {
  const AppDrawerCategoryListEvent();
}

class AppDrawerCategoryListInitialEvent extends AppDrawerCategoryListEvent {
  @override
  List<Object> get props => [];
}
