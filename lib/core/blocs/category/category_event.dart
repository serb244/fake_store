part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}

class CategorySaveEvent extends CategoryEvent {
  final CategoryModel category;

  const CategorySaveEvent(this.category);

  @override
  List<Object?> get props => [category];
}

class CategoryGetByIdEvent extends CategoryEvent {
  final int categoryId;
  final bool isNedAllCategories;
  const CategoryGetByIdEvent({required this.categoryId, this.isNedAllCategories = true});

  @override
  List<Object?> get props => [categoryId];
}
class CategoryErrorEvent extends CategoryEvent {
  final BaseException exception;
  const CategoryErrorEvent({required this.exception});

  @override
  List<Object?> get props => [exception];
}
class CategoryInitEvent extends CategoryEvent {
  final bool force;
  const CategoryInitEvent({this.force = false});

  @override
  List<Object?> get props => [force];
}
class CategoryListSuccessEvent extends CategoryEvent {
  final List<CategoryModel> categories ;
  const CategoryListSuccessEvent({required this.categories});

  @override
  List<Object?> get props => [categories];
}
class CategoryItemSuccessEvent extends CategoryEvent {
  final CategoryModel category ;
  const CategoryItemSuccessEvent({required this.category});

  @override
  List<Object?> get props => [category];
}
class CategorySuccessEvent extends CategoryEvent {
  final CategoryModel category ;
  final List<CategoryModel> categories ;
  const CategorySuccessEvent({required this.category, required this.categories});

  @override
  List<Object?> get props => [category];
}
class CategoryDeleteEvent extends CategoryEvent {
  final int categoryId;

  const CategoryDeleteEvent({required this.categoryId});

  @override
  List<Object?> get props => [categoryId];
}

