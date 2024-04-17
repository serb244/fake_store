part of 'admin_category_bloc.dart';

abstract class AdminCategoryEvent extends Equatable {
  const AdminCategoryEvent();
}

class AdminCategorySaveEvent extends AdminCategoryEvent {
  final CategoryModel category;

  const AdminCategorySaveEvent(this.category);
  @override
  List<Object?> get props => [category];
}
class AdminCategoryInitEvent extends AdminCategoryEvent {
final  int categoryId;
  const AdminCategoryInitEvent({required this.categoryId});
  @override
  List<Object?> get props => [categoryId];
}
class AdminCategoryDeleteEvent extends AdminCategoryEvent {
final  int categoryId;
  const AdminCategoryDeleteEvent({required this.categoryId});
  @override
  List<Object?> get props => [categoryId];
}
