part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}

class CategoryInitEvent extends CategoryEvent {
  const CategoryInitEvent();

  @override
  List<Object?> get props => [];
}
class CategoryErrorEvent extends CategoryEvent {
  final BaseException exception;
  const CategoryErrorEvent({required this.exception});

  @override
  List<Object?> get props => [exception];
}
class CategoryLoadedEvent extends CategoryEvent {
  final List<CategoryModel> categories ;
  const CategoryLoadedEvent({required this.categories});

  @override
  List<Object?> get props => [categories];
}
class CategoryLoadEvent extends CategoryEvent {
  const CategoryLoadEvent();

  @override
  List<Object?> get props => [];
}
// class CategoryGetEvent extends CategoryEvent {
//   @override
//   List<Object> get props => [];
// }
//
// class CategoryDeleteEvent extends CategoryEvent {
//   final  int categoryId;
//   const CategoryDeleteEvent({required this.categoryId});
//   @override
//   List<Object?> get props => [categoryId];
// }