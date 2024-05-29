import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_description.freezed.dart';

part 'category_description.g.dart';

@freezed
abstract class CategoryDescription with _$CategoryDescription {
  const factory CategoryDescription({
    @JsonKey(name: 'id') required int categoryDescriptionId,
    @JsonKey(name: 'category') required int categoryId,
    @JsonKey(name: 'language') required int languageId,
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

  factory CategoryDescription.fromJson(Map<String, dynamic> json) => _$CategoryDescriptionFromJson(json);

  factory CategoryDescription.init() => const CategoryDescription(
        categoryDescriptionId: 0,
        categoryId: 0,
        languageId: 0,
        name: '',
        slug: '',
        description: '',
        metaTitle: '',
        metaDescription: '',
        metaKeyword: '',
        seoKeyword: '',
        seoH1: '',
        seoH2: '',
        seoH3: '',
      );
}
