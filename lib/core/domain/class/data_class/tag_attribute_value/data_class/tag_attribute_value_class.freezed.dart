// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tag_attribute_value_class.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TagAttributeValueData {
  int get tagId => throw _privateConstructorUsedError;
  int get attributeId => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TagAttributeValueDataCopyWith<TagAttributeValueData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagAttributeValueDataCopyWith<$Res> {
  factory $TagAttributeValueDataCopyWith(TagAttributeValueData value,
          $Res Function(TagAttributeValueData) then) =
      _$TagAttributeValueDataCopyWithImpl<$Res, TagAttributeValueData>;
  @useResult
  $Res call({int tagId, int attributeId, String value});
}

/// @nodoc
class _$TagAttributeValueDataCopyWithImpl<$Res,
        $Val extends TagAttributeValueData>
    implements $TagAttributeValueDataCopyWith<$Res> {
  _$TagAttributeValueDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tagId = null,
    Object? attributeId = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      tagId: null == tagId
          ? _value.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as int,
      attributeId: null == attributeId
          ? _value.attributeId
          : attributeId // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TagAttributeValueDataImplCopyWith<$Res>
    implements $TagAttributeValueDataCopyWith<$Res> {
  factory _$$TagAttributeValueDataImplCopyWith(
          _$TagAttributeValueDataImpl value,
          $Res Function(_$TagAttributeValueDataImpl) then) =
      __$$TagAttributeValueDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int tagId, int attributeId, String value});
}

/// @nodoc
class __$$TagAttributeValueDataImplCopyWithImpl<$Res>
    extends _$TagAttributeValueDataCopyWithImpl<$Res,
        _$TagAttributeValueDataImpl>
    implements _$$TagAttributeValueDataImplCopyWith<$Res> {
  __$$TagAttributeValueDataImplCopyWithImpl(_$TagAttributeValueDataImpl _value,
      $Res Function(_$TagAttributeValueDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tagId = null,
    Object? attributeId = null,
    Object? value = null,
  }) {
    return _then(_$TagAttributeValueDataImpl(
      tagId: null == tagId
          ? _value.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as int,
      attributeId: null == attributeId
          ? _value.attributeId
          : attributeId // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TagAttributeValueDataImpl implements _TagAttributeValueData {
  const _$TagAttributeValueDataImpl(
      {required this.tagId, required this.attributeId, required this.value});

  @override
  final int tagId;
  @override
  final int attributeId;
  @override
  final String value;

  @override
  String toString() {
    return 'TagAttributeValueData(tagId: $tagId, attributeId: $attributeId, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TagAttributeValueDataImpl &&
            (identical(other.tagId, tagId) || other.tagId == tagId) &&
            (identical(other.attributeId, attributeId) ||
                other.attributeId == attributeId) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tagId, attributeId, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TagAttributeValueDataImplCopyWith<_$TagAttributeValueDataImpl>
      get copyWith => __$$TagAttributeValueDataImplCopyWithImpl<
          _$TagAttributeValueDataImpl>(this, _$identity);
}

abstract class _TagAttributeValueData implements TagAttributeValueData {
  const factory _TagAttributeValueData(
      {required final int tagId,
      required final int attributeId,
      required final String value}) = _$TagAttributeValueDataImpl;

  @override
  int get tagId;
  @override
  int get attributeId;
  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$TagAttributeValueDataImplCopyWith<_$TagAttributeValueDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
