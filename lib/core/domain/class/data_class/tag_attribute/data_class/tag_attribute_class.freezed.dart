// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tag_attribute_class.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TagAttributeData {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get dataType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TagAttributeDataCopyWith<TagAttributeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagAttributeDataCopyWith<$Res> {
  factory $TagAttributeDataCopyWith(
          TagAttributeData value, $Res Function(TagAttributeData) then) =
      _$TagAttributeDataCopyWithImpl<$Res, TagAttributeData>;
  @useResult
  $Res call({int id, String name, String dataType});
}

/// @nodoc
class _$TagAttributeDataCopyWithImpl<$Res, $Val extends TagAttributeData>
    implements $TagAttributeDataCopyWith<$Res> {
  _$TagAttributeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? dataType = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dataType: null == dataType
          ? _value.dataType
          : dataType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TagAttributeDataImplCopyWith<$Res>
    implements $TagAttributeDataCopyWith<$Res> {
  factory _$$TagAttributeDataImplCopyWith(_$TagAttributeDataImpl value,
          $Res Function(_$TagAttributeDataImpl) then) =
      __$$TagAttributeDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String dataType});
}

/// @nodoc
class __$$TagAttributeDataImplCopyWithImpl<$Res>
    extends _$TagAttributeDataCopyWithImpl<$Res, _$TagAttributeDataImpl>
    implements _$$TagAttributeDataImplCopyWith<$Res> {
  __$$TagAttributeDataImplCopyWithImpl(_$TagAttributeDataImpl _value,
      $Res Function(_$TagAttributeDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? dataType = null,
  }) {
    return _then(_$TagAttributeDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dataType: null == dataType
          ? _value.dataType
          : dataType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TagAttributeDataImpl implements _TagAttributeData {
  const _$TagAttributeDataImpl(
      {required this.id, required this.name, required this.dataType});

  @override
  final int id;
  @override
  final String name;
  @override
  final String dataType;

  @override
  String toString() {
    return 'TagAttributeData(id: $id, name: $name, dataType: $dataType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TagAttributeDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dataType, dataType) ||
                other.dataType == dataType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, dataType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TagAttributeDataImplCopyWith<_$TagAttributeDataImpl> get copyWith =>
      __$$TagAttributeDataImplCopyWithImpl<_$TagAttributeDataImpl>(
          this, _$identity);
}

abstract class _TagAttributeData implements TagAttributeData {
  const factory _TagAttributeData(
      {required final int id,
      required final String name,
      required final String dataType}) = _$TagAttributeDataImpl;

  @override
  int get id;
  @override
  String get name;
  @override
  String get dataType;
  @override
  @JsonKey(ignore: true)
  _$$TagAttributeDataImplCopyWith<_$TagAttributeDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
