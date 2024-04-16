part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

// class HomeInitialState extends HomeState {
//   @override
//   List<Object> get props => [];
// }

class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}


class HomeErrorState extends HomeState {
  final String error;

  const HomeErrorState({required this.error});
  @override
  List<Object> get props => [ error ];
}

class HomeSuccessState extends HomeState {
  final List<MenuCategoryItemModel> menuCategoryItems;

  const HomeSuccessState({required this.menuCategoryItems});
  @override
  List<Object> get props => [menuCategoryItems];
}

