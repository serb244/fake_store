import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_description.freezed.dart';
part 'category_description.g.dart';

@freezed
abstract class CategoryDescription with _$CategoryDescription {
  const factory CategoryDescription({
    @JsonKey(name: 'id') required int categoryId,
    @JsonKey(name: 'language_id') required int languageId,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'slug') required String slug,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'meta_title') required String metaTitle,
    @JsonKey(name: 'meta_description') required String metaDescription,
    @JsonKey(name: 'meta_keyword') required String metaKeyword,
    @JsonKey(name: 'seo_keyword') required String seoKeyword,
    @JsonKey(name: 'seo_h1') required String seoH1,
    @JsonKey(name: 'seo_h2') required String seoH2,
    @JsonKey(name: 'seo_h3') required String seoH3,
  }) = _CategoryDescription;

  factory CategoryDescription.fromJson(Map<String, dynamic> json) =>
      _$CategoryDescriptionFromJson(json);
}