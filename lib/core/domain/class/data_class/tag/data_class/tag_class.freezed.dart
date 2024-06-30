// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tag_class.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TagData {
  int get id => throw _privateConstructorUsedError;
  String get tagName => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  int get useCount => throw _privateConstructorUsedError;
  String get genre => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TagDataCopyWith<TagData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagDataCopyWith<$Res> {
  factory $TagDataCopyWith(TagData value, $Res Function(TagData) then) =
      _$TagDataCopyWithImpl<$Res, TagData>;
  @useResult
  $Res call(
      {int id, String tagName, DateTime createdAt, int useCount, String genre});
}

/// @nodoc
class _$TagDataCopyWithImpl<$Res, $Val extends TagData>
    implements $TagDataCopyWith<$Res> {
  _$TagDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tagName = null,
    Object? createdAt = null,
    Object? useCount = null,
    Object? genre = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      tagName: null == tagName
          ? _value.tagName
          : tagName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      useCount: null == useCount
          ? _value.useCount
          : useCount // ignore: cast_nullable_to_non_nullable
              as int,
      genre: null == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TagDataImplCopyWith<$Res> implements $TagDataCopyWith<$Res> {
  factory _$$TagDataImplCopyWith(
          _$TagDataImpl value, $Res Function(_$TagDataImpl) then) =
      __$$TagDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String tagName, DateTime createdAt, int useCount, String genre});
}

/// @nodoc
class __$$TagDataImplCopyWithImpl<$Res>
    extends _$TagDataCopyWithImpl<$Res, _$TagDataImpl>
    implements _$$TagDataImplCopyWith<$Res> {
  __$$TagDataImplCopyWithImpl(
      _$TagDataImpl _value, $Res Function(_$TagDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tagName = null,
    Object? createdAt = null,
    Object? useCount = null,
    Object? genre = null,
  }) {
    return _then(_$TagDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      tagName: null == tagName
          ? _value.tagName
          : tagName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      useCount: null == useCount
          ? _value.useCount
          : useCount // ignore: cast_nullable_to_non_nullable
              as int,
      genre: null == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TagDataImpl implements _TagData {
  const _$TagDataImpl(
      {required this.id,
      required this.tagName,
      required this.createdAt,
      required this.useCount,
      required this.genre});

  @override
  final int id;
  @override
  final String tagName;
  @override
  final DateTime createdAt;
  @override
  final int useCount;
  @override
  final String genre;

  @override
  String toString() {
    return 'TagData(id: $id, tagName: $tagName, createdAt: $createdAt, useCount: $useCount, genre: $genre)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TagDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tagName, tagName) || other.tagName == tagName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.useCount, useCount) ||
                other.useCount == useCount) &&
            (identical(other.genre, genre) || other.genre == genre));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, tagName, createdAt, useCount, genre);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TagDataImplCopyWith<_$TagDataImpl> get copyWith =>
      __$$TagDataImplCopyWithImpl<_$TagDataImpl>(this, _$identity);
}

abstract class _TagData implements TagData {
  const factory _TagData(
      {required final int id,
      required final String tagName,
      required final DateTime createdAt,
      required final int useCount,
      required final String genre}) = _$TagDataImpl;

  @override
  int get id;
  @override
  String get tagName;
  @override
  DateTime get createdAt;
  @override
  int get useCount;
  @override
  String get genre;
  @override
  @JsonKey(ignore: true)
  _$$TagDataImplCopyWith<_$TagDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
