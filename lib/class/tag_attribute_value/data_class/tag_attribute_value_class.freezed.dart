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
mixin _$TagAttributeValue {
  int get tagId => throw _privateConstructorUsedError;
  int get attributeId => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TagAttributeValueCopyWith<TagAttributeValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagAttributeValueCopyWith<$Res> {
  factory $TagAttributeValueCopyWith(
          TagAttributeValue value, $Res Function(TagAttributeValue) then) =
      _$TagAttributeValueCopyWithImpl<$Res, TagAttributeValue>;
  @useResult
  $Res call({int tagId, int attributeId, String value});
}

/// @nodoc
class _$TagAttributeValueCopyWithImpl<$Res, $Val extends TagAttributeValue>
    implements $TagAttributeValueCopyWith<$Res> {
  _$TagAttributeValueCopyWithImpl(this._value, this._then);

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
abstract class _$$TagAttributeValueImplCopyWith<$Res>
    implements $TagAttributeValueCopyWith<$Res> {
  factory _$$TagAttributeValueImplCopyWith(_$TagAttributeValueImpl value,
          $Res Function(_$TagAttributeValueImpl) then) =
      __$$TagAttributeValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int tagId, int attributeId, String value});
}

/// @nodoc
class __$$TagAttributeValueImplCopyWithImpl<$Res>
    extends _$TagAttributeValueCopyWithImpl<$Res, _$TagAttributeValueImpl>
    implements _$$TagAttributeValueImplCopyWith<$Res> {
  __$$TagAttributeValueImplCopyWithImpl(_$TagAttributeValueImpl _value,
      $Res Function(_$TagAttributeValueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tagId = null,
    Object? attributeId = null,
    Object? value = null,
  }) {
    return _then(_$TagAttributeValueImpl(
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

class _$TagAttributeValueImpl implements _TagAttributeValue {
  const _$TagAttributeValueImpl(
      {required this.tagId, required this.attributeId, required this.value});

  @override
  final int tagId;
  @override
  final int attributeId;
  @override
  final String value;

  @override
  String toString() {
    return 'TagAttributeValue(tagId: $tagId, attributeId: $attributeId, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TagAttributeValueImpl &&
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
  _$$TagAttributeValueImplCopyWith<_$TagAttributeValueImpl> get copyWith =>
      __$$TagAttributeValueImplCopyWithImpl<_$TagAttributeValueImpl>(
          this, _$identity);
}

abstract class _TagAttributeValue implements TagAttributeValue {
  const factory _TagAttributeValue(
      {required final int tagId,
      required final int attributeId,
      required final String value}) = _$TagAttributeValueImpl;

  @override
  int get tagId;
  @override
  int get attributeId;
  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$TagAttributeValueImplCopyWith<_$TagAttributeValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
