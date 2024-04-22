part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeInitEvent extends HomeEvent {
  const HomeInitEvent();

  @override
  List<Object?> get props => [];
}
class HomeErrorEvent extends HomeEvent {
  final BaseException exception;
  const HomeErrorEvent({required this.exception});

  @override
  List<Object?> get props => [exception];
}
class HomeLoadedEvent extends HomeEvent {
  final List<CategoryModel> categories ;
  const HomeLoadedEvent({required this.categories});

  @override
  List<Object?> get props => [categories];
}
class HomeLoadEvent extends HomeEvent {
  const HomeLoadEvent();

  @override
  List<Object?> get props => [];
}
