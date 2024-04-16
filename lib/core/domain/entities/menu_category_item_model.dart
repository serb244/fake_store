import '../../../../core/data/models/category_model.dart';

class MenuCategoryItemModel {
  final CategoryModel topCategory;
  final List<CategoryModel> subCategories;
  final bool isOpen;

  MenuCategoryItemModel({required this.topCategory, required this.subCategories, this.isOpen = false});

  MenuCategoryItemModel copyWith({
    CategoryModel? topCategory,
    List<CategoryModel>? subCategories,
    bool? isOpen,
  }) {
    return MenuCategoryItemModel(
      topCategory: topCategory ?? this.topCategory,
      subCategories: subCategories ?? this.subCategories,
      isOpen: isOpen ?? this.isOpen,
    );
  }

}
