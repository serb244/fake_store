import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'category_description.dart';

part 'category_model.freezed.dart';

part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    @JsonKey(name: 'category_id') required int id,
    @JsonKey(name: 'image') String? image,
    @JsonKey(name: 'parent') required int? parentCategoryId,
    @JsonKey(name: 'top') required bool top,
    @JsonKey(name: 'column') required int column,
    @JsonKey(name: 'sort_order') required int sortOrder,
    @JsonKey(name: 'status') required bool status,
    @JsonKey(name: 'date_added') required DateTime dateAdded,
    @JsonKey(name: 'date_modified') required DateTime dateModified,
    @JsonKey(name: 'languageId', defaultValue: 1) required int languageId,
    @JsonKey(name: 'description') required CategoryDescription description,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

  factory CategoryModel.init() => CategoryModel(
        id: 0,
        parentCategoryId: null,
        top: false,
        column: 0,
        sortOrder: 0,
        status: true,
        dateAdded: DateTime.now(),
        dateModified: DateTime.now(),
        languageId: 1,
        description: const CategoryDescription(
          categoryId: 0,
          languageId: 1,
          name: "name",
          slug: "",
          description: "",
          metaTitle: "",
          metaDescription: "",
          metaKeyword: "",
          seoKeyword: "",
          seoH1: "",
          seoH2: "",
          seoH3: "",
        ),
      );

}

List<CategoryModel> getChildCategoryList({required int? categoryId, required List<CategoryModel> categoryList}) {
  List<CategoryModel> categoryModelList = [];
  for (CategoryModel categoryModel in categoryList) {
    if (categoryModel.parentCategoryId == categoryId) {
      categoryModelList.add(categoryModel);
    }
  }
  return categoryModelList;
}