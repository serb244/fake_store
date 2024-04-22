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
  @JsonKey(name: 'category_id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent')
  int? get parentCategoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'top')
  bool get top => throw _privateConstructorUsedError;
  @JsonKey(name: 'column')
  int get column => throw _privateConstructorUsedError;
  @JsonKey(name: 'sort_order')
  int get sortOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  bool get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_added')
  DateTime get dateAdded => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_modified')
  DateTime get dateModified => throw _privateConstructorUsedError;
  @JsonKey(name: 'languageId', defaultValue: 1)
  int get languageId => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  CategoryDescription get description => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'category_id') int id,
      @JsonKey(name: 'image') String? image,
      @JsonKey(name: 'parent') int? parentCategoryId,
      @JsonKey(name: 'top') bool top,
      @JsonKey(name: 'column') int column,
      @JsonKey(name: 'sort_order') int sortOrder,
      @JsonKey(name: 'status') bool status,
      @JsonKey(name: 'date_added') DateTime dateAdded,
      @JsonKey(name: 'date_modified') DateTime dateModified,
      @JsonKey(name: 'languageId', defaultValue: 1) int languageId,
      @JsonKey(name: 'description') CategoryDescription description});

  $CategoryDescriptionCopyWith<$Res> get description;
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
    Object? id = null,
    Object? image = freezed,
    Object? parentCategoryId = freezed,
    Object? top = null,
    Object? column = null,
    Object? sortOrder = null,
    Object? status = null,
    Object? dateAdded = null,
    Object? dateModified = null,
    Object? languageId = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as CategoryDescription,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryDescriptionCopyWith<$Res> get description {
    return $CategoryDescriptionCopyWith<$Res>(_value.description, (value) {
      return _then(_value.copyWith(description: value) as $Val);
    });
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
      {@JsonKey(name: 'category_id') int id,
      @JsonKey(name: 'image') String? image,
      @JsonKey(name: 'parent') int? parentCategoryId,
      @JsonKey(name: 'top') bool top,
      @JsonKey(name: 'column') int column,
      @JsonKey(name: 'sort_order') int sortOrder,
      @JsonKey(name: 'status') bool status,
      @JsonKey(name: 'date_added') DateTime dateAdded,
      @JsonKey(name: 'date_modified') DateTime dateModified,
      @JsonKey(name: 'languageId', defaultValue: 1) int languageId,
      @JsonKey(name: 'description') CategoryDescription description});

  @override
  $CategoryDescriptionCopyWith<$Res> get description;
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
    Object? id = null,
    Object? image = freezed,
    Object? parentCategoryId = freezed,
    Object? top = null,
    Object? column = null,
    Object? sortOrder = null,
    Object? status = null,
    Object? dateAdded = null,
    Object? dateModified = null,
    Object? languageId = null,
    Object? description = null,
  }) {
    return _then(_$CategoryModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as CategoryDescription,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryModelImpl
    with DiagnosticableTreeMixin
    implements _CategoryModel {
  const _$CategoryModelImpl(
      {@JsonKey(name: 'category_id') required this.id,
      @JsonKey(name: 'image') this.image,
      @JsonKey(name: 'parent') required this.parentCategoryId,
      @JsonKey(name: 'top') required this.top,
      @JsonKey(name: 'column') required this.column,
      @JsonKey(name: 'sort_order') required this.sortOrder,
      @JsonKey(name: 'status') required this.status,
      @JsonKey(name: 'date_added') required this.dateAdded,
      @JsonKey(name: 'date_modified') required this.dateModified,
      @JsonKey(name: 'languageId', defaultValue: 1) required this.languageId,
      @JsonKey(name: 'description') required this.description});

  factory _$CategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryModelImplFromJson(json);

  @override
  @JsonKey(name: 'category_id')
  final int id;
  @override
  @JsonKey(name: 'image')
  final String? image;
  @override
  @JsonKey(name: 'parent')
  final int? parentCategoryId;
  @override
  @JsonKey(name: 'top')
  final bool top;
  @override
  @JsonKey(name: 'column')
  final int column;
  @override
  @JsonKey(name: 'sort_order')
  final int sortOrder;
  @override
  @JsonKey(name: 'status')
  final bool status;
  @override
  @JsonKey(name: 'date_added')
  final DateTime dateAdded;
  @override
  @JsonKey(name: 'date_modified')
  final DateTime dateModified;
  @override
  @JsonKey(name: 'languageId', defaultValue: 1)
  final int languageId;
  @override
  @JsonKey(name: 'description')
  final CategoryDescription description;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CategoryModel(id: $id, image: $image, parentCategoryId: $parentCategoryId, top: $top, column: $column, sortOrder: $sortOrder, status: $status, dateAdded: $dateAdded, dateModified: $dateModified, languageId: $languageId, description: $description)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CategoryModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('parentCategoryId', parentCategoryId))
      ..add(DiagnosticsProperty('top', top))
      ..add(DiagnosticsProperty('column', column))
      ..add(DiagnosticsProperty('sortOrder', sortOrder))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('dateAdded', dateAdded))
      ..add(DiagnosticsProperty('dateModified', dateModified))
      ..add(DiagnosticsProperty('languageId', languageId))
      ..add(DiagnosticsProperty('description', description));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
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
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      image,
      parentCategoryId,
      top,
      column,
      sortOrder,
      status,
      dateAdded,
      dateModified,
      languageId,
      description);

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
      {@JsonKey(name: 'category_id') required final int id,
      @JsonKey(name: 'image') final String? image,
      @JsonKey(name: 'parent') required final int? parentCategoryId,
      @JsonKey(name: 'top') required final bool top,
      @JsonKey(name: 'column') required final int column,
      @JsonKey(name: 'sort_order') required final int sortOrder,
      @JsonKey(name: 'status') required final bool status,
      @JsonKey(name: 'date_added') required final DateTime dateAdded,
      @JsonKey(name: 'date_modified') required final DateTime dateModified,
      @JsonKey(name: 'languageId', defaultValue: 1)
      required final int languageId,
      @JsonKey(name: 'description')
      required final CategoryDescription description}) = _$CategoryModelImpl;

  factory _CategoryModel.fromJson(Map<String, dynamic> json) =
      _$CategoryModelImpl.fromJson;

  @override
  @JsonKey(name: 'category_id')
  int get id;
  @override
  @JsonKey(name: 'image')
  String? get image;
  @override
  @JsonKey(name: 'parent')
  int? get parentCategoryId;
  @override
  @JsonKey(name: 'top')
  bool get top;
  @override
  @JsonKey(name: 'column')
  int get column;
  @override
  @JsonKey(name: 'sort_order')
  int get sortOrder;
  @override
  @JsonKey(name: 'status')
  bool get status;
  @override
  @JsonKey(name: 'date_added')
  DateTime get dateAdded;
  @override
  @JsonKey(name: 'date_modified')
  DateTime get dateModified;
  @override
  @JsonKey(name: 'languageId', defaultValue: 1)
  int get languageId;
  @override
  @JsonKey(name: 'description')
  CategoryDescription get description;
  @override
  @JsonKey(ignore: true)
  _$$CategoryModelImplCopyWith<_$CategoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
