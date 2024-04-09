// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return _CategoryModel.fromJson(json);
}

/// @nodoc
mixin _$CategoryModel {
  int get categoryId => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  int? get parentCategoryId =>
      throw _privateConstructorUsedError; // Can be null for top-level categories
  bool get top => throw _privateConstructorUsedError;
  int get column => throw _privateConstructorUsedError;
  int get sortOrder => throw _privateConstructorUsedError;
  bool get status => throw _privateConstructorUsedError;
  DateTime get dateAdded => throw _privateConstructorUsedError;
  DateTime get dateModified => throw _privateConstructorUsedError;
  int get languageId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get metaTitle => throw _privateConstructorUsedError;
  String? get metaDescription => throw _privateConstructorUsedError;
  String? get metaKeyword => throw _privateConstructorUsedError;
  String? get seoKeyword => throw _privateConstructorUsedError;
  String? get seoH1 => throw _privateConstructorUsedError;
  String? get seoH2 => throw _privateConstructorUsedError;
  String? get seoH3 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryModelCopyWith<CategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryModelCopyWith<$Res> {
  factory $CategoryModelCopyWith(
          CategoryModel value, $Res Function(CategoryModel) then) =
      _$CategoryModelCopyWithImpl<$Res, CategoryModel>;
  @useResult
  $Res call(
      {int categoryId,
      String? image,
      int? parentCategoryId,
      bool top,
      int column,
      int sortOrder,
      bool status,
      DateTime dateAdded,
      DateTime dateModified,
      int languageId,
      String name,
      String description,
      String? metaTitle,
      String? metaDescription,
      String? metaKeyword,
      String? seoKeyword,
      String? seoH1,
      String? seoH2,
      String? seoH3});
}

/// @nodoc
class _$CategoryModelCopyWithImpl<$Res, $Val extends CategoryModel>
    implements $CategoryModelCopyWith<$Res> {
  _$CategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? image = freezed,
    Object? parentCategoryId = freezed,
    Object? top = null,
    Object? column = null,
    Object? sortOrder = null,
    Object? status = null,
    Object? dateAdded = null,
    Object? dateModified = null,
    Object? languageId = null,
    Object? name = null,
    Object? description = null,
    Object? metaTitle = freezed,
    Object? metaDescription = freezed,
    Object? metaKeyword = freezed,
    Object? seoKeyword = freezed,
    Object? seoH1 = freezed,
    Object? seoH2 = freezed,
    Object? seoH3 = freezed,
  }) {
    return _then(_value.copyWith(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      parentCategoryId: freezed == parentCategoryId
          ? _value.parentCategoryId
          : parentCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      top: null == top
          ? _value.top
          : top // ignore: cast_nullable_to_non_nullable
              as bool,
      column: null == column
          ? _value.column
          : column // ignore: cast_nullable_to_non_nullable
              as int,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      dateAdded: null == dateAdded
          ? _value.dateAdded
          : dateAdded // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateModified: null == dateModified
          ? _value.dateModified
          : dateModified // ignore: cast_nullable_to_non_nullable
              as DateTime,
      languageId: null == languageId
          ? _value.languageId
          : languageId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      metaTitle: freezed == metaTitle
          ? _value.metaTitle
          : metaTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      metaDescription: freezed == metaDescription
          ? _value.metaDescription
          : metaDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      metaKeyword: freezed == metaKeyword
          ? _value.metaKeyword
          : metaKeyword // ignore: cast_nullable_to_non_nullable
              as String?,
      seoKeyword: freezed == seoKeyword
          ? _value.seoKeyword
          : seoKeyword // ignore: cast_nullable_to_non_nullable
              as String?,
      seoH1: freezed == seoH1
          ? _value.seoH1
          : seoH1 // ignore: cast_nullable_to_non_nullable
              as String?,
      seoH2: freezed == seoH2
          ? _value.seoH2
          : seoH2 // ignore: cast_nullable_to_non_nullable
              as String?,
      seoH3: freezed == seoH3
          ? _value.seoH3
          : seoH3 // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryModelImplCopyWith<$Res>
    implements $CategoryModelCopyWith<$Res> {
  factory _$$CategoryModelImplCopyWith(
          _$CategoryModelImpl value, $Res Function(_$CategoryModelImpl) then) =
      __$$CategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int categoryId,
      String? image,
      int? parentCategoryId,
      bool top,
      int column,
      int sortOrder,
      bool status,
      DateTime dateAdded,
      DateTime dateModified,
      int languageId,
      String name,
      String description,
      String? metaTitle,
      String? metaDescription,
      String? metaKeyword,
      String? seoKeyword,
      String? seoH1,
      String? seoH2,
      String? seoH3});
}

/// @nodoc
class __$$CategoryModelImplCopyWithImpl<$Res>
    extends _$CategoryModelCopyWithImpl<$Res, _$CategoryModelImpl>
    implements _$$CategoryModelImplCopyWith<$Res> {
  __$$CategoryModelImplCopyWithImpl(
      _$CategoryModelImpl _value, $Res Function(_$CategoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? image = freezed,
    Object? parentCategoryId = freezed,
    Object? top = null,
    Object? column = null,
    Object? sortOrder = null,
    Object? status = null,
    Object? dateAdded = null,
    Object? dateModified = null,
    Object? languageId = null,
    Object? name = null,
    Object? description = null,
    Object? metaTitle = freezed,
    Object? metaDescription = freezed,
    Object? metaKeyword = freezed,
    Object? seoKeyword = freezed,
    Object? seoH1 = freezed,
    Object? seoH2 = freezed,
    Object? seoH3 = freezed,
  }) {
    return _then(_$CategoryModelImpl(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      parentCategoryId: freezed == parentCategoryId
          ? _value.parentCategoryId
          : parentCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      top: null == top
          ? _value.top
          : top // ignore: cast_nullable_to_non_nullable
              as bool,
      column: null == column
          ? _value.column
          : column // ignore: cast_nullable_to_non_nullable
              as int,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      dateAdded: null == dateAdded
          ? _value.dateAdded
          : dateAdded // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateModified: null == dateModified
          ? _value.dateModified
          : dateModified // ignore: cast_nullable_to_non_nullable
              as DateTime,
      languageId: null == languageId
          ? _value.languageId
          : languageId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      metaTitle: freezed == metaTitle
          ? _value.metaTitle
          : metaTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      metaDescription: freezed == metaDescription
          ? _value.metaDescription
          : metaDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      metaKeyword: freezed == metaKeyword
          ? _value.metaKeyword
          : metaKeyword // ignore: cast_nullable_to_non_nullable
              as String?,
      seoKeyword: freezed == seoKeyword
          ? _value.seoKeyword
          : seoKeyword // ignore: cast_nullable_to_non_nullable
              as String?,
      seoH1: freezed == seoH1
          ? _value.seoH1
          : seoH1 // ignore: cast_nullable_to_non_nullable
              as String?,
      seoH2: freezed == seoH2
          ? _value.seoH2
          : seoH2 // ignore: cast_nullable_to_non_nullable
              as String?,
      seoH3: freezed == seoH3
          ? _value.seoH3
          : seoH3 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryModelImpl
    with DiagnosticableTreeMixin
    implements _CategoryModel {
  const _$CategoryModelImpl(
      {required this.categoryId,
      this.image,
      required this.parentCategoryId,
      required this.top,
      required this.column,
      required this.sortOrder,
      required this.status,
      required this.dateAdded,
      required this.dateModified,
      required this.languageId,
      required this.name,
      required this.description,
      this.metaTitle,
      this.metaDescription,
      this.metaKeyword,
      this.seoKeyword,
      this.seoH1,
      this.seoH2,
      this.seoH3});

  factory _$CategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryModelImplFromJson(json);

  @override
  final int categoryId;
  @override
  final String? image;
  @override
  final int? parentCategoryId;
// Can be null for top-level categories
  @override
  final bool top;
  @override
  final int column;
  @override
  final int sortOrder;
  @override
  final bool status;
  @override
  final DateTime dateAdded;
  @override
  final DateTime dateModified;
  @override
  final int languageId;
  @override
  final String name;
  @override
  final String description;
  @override
  final String? metaTitle;
  @override
  final String? metaDescription;
  @override
  final String? metaKeyword;
  @override
  final String? seoKeyword;
  @override
  final String? seoH1;
  @override
  final String? seoH2;
  @override
  final String? seoH3;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CategoryModel(categoryId: $categoryId, image: $image, parentCategoryId: $parentCategoryId, top: $top, column: $column, sortOrder: $sortOrder, status: $status, dateAdded: $dateAdded, dateModified: $dateModified, languageId: $languageId, name: $name, description: $description, metaTitle: $metaTitle, metaDescription: $metaDescription, metaKeyword: $metaKeyword, seoKeyword: $seoKeyword, seoH1: $seoH1, seoH2: $seoH2, seoH3: $seoH3)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CategoryModel'))
      ..add(DiagnosticsProperty('categoryId', categoryId))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('parentCategoryId', parentCategoryId))
      ..add(DiagnosticsProperty('top', top))
      ..add(DiagnosticsProperty('column', column))
      ..add(DiagnosticsProperty('sortOrder', sortOrder))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('dateAdded', dateAdded))
      ..add(DiagnosticsProperty('dateModified', dateModified))
      ..add(DiagnosticsProperty('languageId', languageId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('metaTitle', metaTitle))
      ..add(DiagnosticsProperty('metaDescription', metaDescription))
      ..add(DiagnosticsProperty('metaKeyword', metaKeyword))
      ..add(DiagnosticsProperty('seoKeyword', seoKeyword))
      ..add(DiagnosticsProperty('seoH1', seoH1))
      ..add(DiagnosticsProperty('seoH2', seoH2))
      ..add(DiagnosticsProperty('seoH3', seoH3));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryModelImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.parentCategoryId, parentCategoryId) ||
                other.parentCategoryId == parentCategoryId) &&
            (identical(other.top, top) || other.top == top) &&
            (identical(other.column, column) || other.column == column) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.dateAdded, dateAdded) ||
                other.dateAdded == dateAdded) &&
            (identical(other.dateModified, dateModified) ||
                other.dateModified == dateModified) &&
            (identical(other.languageId, languageId) ||
                other.languageId == languageId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.metaTitle, metaTitle) ||
                other.metaTitle == metaTitle) &&
            (identical(other.metaDescription, metaDescription) ||
                other.metaDescription == metaDescription) &&
            (identical(other.metaKeyword, metaKeyword) ||
                other.metaKeyword == metaKeyword) &&
            (identical(other.seoKeyword, seoKeyword) ||
                other.seoKeyword == seoKeyword) &&
            (identical(other.seoH1, seoH1) || other.seoH1 == seoH1) &&
            (identical(other.seoH2, seoH2) || other.seoH2 == seoH2) &&
            (identical(other.seoH3, seoH3) || other.seoH3 == seoH3));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        categoryId,
        image,
        parentCategoryId,
        top,
        column,
        sortOrder,
        status,
        dateAdded,
        dateModified,
        languageId,
        name,
        description,
        metaTitle,
        metaDescription,
        metaKeyword,
        seoKeyword,
        seoH1,
        seoH2,
        seoH3
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryModelImplCopyWith<_$CategoryModelImpl> get copyWith =>
      __$$CategoryModelImplCopyWithImpl<_$CategoryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryModelImplToJson(
      this,
    );
  }
}

abstract class _CategoryModel implements CategoryModel {
  const factory _CategoryModel(
      {required final int categoryId,
      final String? image,
      required final int? parentCategoryId,
      required final bool top,
      required final int column,
      required final int sortOrder,
      required final bool status,
      required final DateTime dateAdded,
      required final DateTime dateModified,
      required final int languageId,
      required final String name,
      required final String description,
      final String? metaTitle,
      final String? metaDescription,
      final String? metaKeyword,
      final String? seoKeyword,
      final String? seoH1,
      final String? seoH2,
      final String? seoH3}) = _$CategoryModelImpl;

  factory _CategoryModel.fromJson(Map<String, dynamic> json) =
      _$CategoryModelImpl.fromJson;

  @override
  int get categoryId;
  @override
  String? get image;
  @override
  int? get parentCategoryId;
  @override // Can be null for top-level categories
  bool get top;
  @override
  int get column;
  @override
  int get sortOrder;
  @override
  bool get status;
  @override
  DateTime get dateAdded;
  @override
  DateTime get dateModified;
  @override
  int get languageId;
  @override
  String get name;
  @override
  String get description;
  @override
  String? get metaTitle;
  @override
  String? get metaDescription;
  @override
  String? get metaKeyword;
  @override
  String? get seoKeyword;
  @override
  String? get seoH1;
  @override
  String? get seoH2;
  @override
  String? get seoH3;
  @override
  @JsonKey(ignore: true)
  _$$CategoryModelImplCopyWith<_$CategoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
