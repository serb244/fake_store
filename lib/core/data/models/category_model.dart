import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';
@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required int categoryId,
    String? image,
    required int? parentCategoryId, // Can be null for top-level categories
    required bool top,
    required int column,
    required int sortOrder,
    required bool status,
    required DateTime dateAdded,
    required DateTime dateModified,
    required int languageId,
    required String name,
    required String description,
    String? metaTitle,
    String? metaDescription,
    String? metaKeyword,
    String? seoKeyword,
    String? seoH1,
    String? seoH2,
    String? seoH3,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);
}
