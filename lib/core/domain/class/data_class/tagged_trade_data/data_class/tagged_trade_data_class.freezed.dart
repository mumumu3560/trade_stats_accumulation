// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tagged_trade_data_class.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TaggedTradeData {
  int get tradeDataId => throw _privateConstructorUsedError;
  int get tagId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaggedTradeDataCopyWith<TaggedTradeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaggedTradeDataCopyWith<$Res> {
  factory $TaggedTradeDataCopyWith(
          TaggedTradeData value, $Res Function(TaggedTradeData) then) =
      _$TaggedTradeDataCopyWithImpl<$Res, TaggedTradeData>;
  @useResult
  $Res call({int tradeDataId, int tagId});
}

/// @nodoc
class _$TaggedTradeDataCopyWithImpl<$Res, $Val extends TaggedTradeData>
    implements $TaggedTradeDataCopyWith<$Res> {
  _$TaggedTradeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tradeDataId = null,
    Object? tagId = null,
  }) {
    return _then(_value.copyWith(
      tradeDataId: null == tradeDataId
          ? _value.tradeDataId
          : tradeDataId // ignore: cast_nullable_to_non_nullable
              as int,
      tagId: null == tagId
          ? _value.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaggedTradeDataImplCopyWith<$Res>
    implements $TaggedTradeDataCopyWith<$Res> {
  factory _$$TaggedTradeDataImplCopyWith(_$TaggedTradeDataImpl value,
          $Res Function(_$TaggedTradeDataImpl) then) =
      __$$TaggedTradeDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int tradeDataId, int tagId});
}

/// @nodoc
class __$$TaggedTradeDataImplCopyWithImpl<$Res>
    extends _$TaggedTradeDataCopyWithImpl<$Res, _$TaggedTradeDataImpl>
    implements _$$TaggedTradeDataImplCopyWith<$Res> {
  __$$TaggedTradeDataImplCopyWithImpl(
      _$TaggedTradeDataImpl _value, $Res Function(_$TaggedTradeDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tradeDataId = null,
    Object? tagId = null,
  }) {
    return _then(_$TaggedTradeDataImpl(
      tradeDataId: null == tradeDataId
          ? _value.tradeDataId
          : tradeDataId // ignore: cast_nullable_to_non_nullable
              as int,
      tagId: null == tagId
          ? _value.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TaggedTradeDataImpl implements _TaggedTradeData {
  const _$TaggedTradeDataImpl({required this.tradeDataId, required this.tagId});

  @override
  final int tradeDataId;
  @override
  final int tagId;

  @override
  String toString() {
    return 'TaggedTradeData(tradeDataId: $tradeDataId, tagId: $tagId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaggedTradeDataImpl &&
            (identical(other.tradeDataId, tradeDataId) ||
                other.tradeDataId == tradeDataId) &&
            (identical(other.tagId, tagId) || other.tagId == tagId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tradeDataId, tagId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaggedTradeDataImplCopyWith<_$TaggedTradeDataImpl> get copyWith =>
      __$$TaggedTradeDataImplCopyWithImpl<_$TaggedTradeDataImpl>(
          this, _$identity);
}

abstract class _TaggedTradeData implements TaggedTradeData {
  const factory _TaggedTradeData(
      {required final int tradeDataId,
      required final int tagId}) = _$TaggedTradeDataImpl;

  @override
  int get tradeDataId;
  @override
  int get tagId;
  @override
  @JsonKey(ignore: true)
  _$$TaggedTradeDataImplCopyWith<_$TaggedTradeDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
