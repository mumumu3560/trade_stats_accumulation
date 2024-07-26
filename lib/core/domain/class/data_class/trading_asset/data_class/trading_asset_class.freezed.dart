// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trading_asset_class.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TradingAssetData {
  int get id => throw _privateConstructorUsedError; //トレード商品の名称
  String get name =>
      throw _privateConstructorUsedError; //トレード商品の種類、例えば株式、仮想通貨、FXなど
  String get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TradingAssetDataCopyWith<TradingAssetData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TradingAssetDataCopyWith<$Res> {
  factory $TradingAssetDataCopyWith(
          TradingAssetData value, $Res Function(TradingAssetData) then) =
      _$TradingAssetDataCopyWithImpl<$Res, TradingAssetData>;
  @useResult
  $Res call({int id, String name, String type});
}

/// @nodoc
class _$TradingAssetDataCopyWithImpl<$Res, $Val extends TradingAssetData>
    implements $TradingAssetDataCopyWith<$Res> {
  _$TradingAssetDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TradingAssetDataImplCopyWith<$Res>
    implements $TradingAssetDataCopyWith<$Res> {
  factory _$$TradingAssetDataImplCopyWith(_$TradingAssetDataImpl value,
          $Res Function(_$TradingAssetDataImpl) then) =
      __$$TradingAssetDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String type});
}

/// @nodoc
class __$$TradingAssetDataImplCopyWithImpl<$Res>
    extends _$TradingAssetDataCopyWithImpl<$Res, _$TradingAssetDataImpl>
    implements _$$TradingAssetDataImplCopyWith<$Res> {
  __$$TradingAssetDataImplCopyWithImpl(_$TradingAssetDataImpl _value,
      $Res Function(_$TradingAssetDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
  }) {
    return _then(_$TradingAssetDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TradingAssetDataImpl implements _TradingAssetData {
  const _$TradingAssetDataImpl(
      {required this.id, required this.name, required this.type});

  @override
  final int id;
//トレード商品の名称
  @override
  final String name;
//トレード商品の種類、例えば株式、仮想通貨、FXなど
  @override
  final String type;

  @override
  String toString() {
    return 'TradingAssetData(id: $id, name: $name, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TradingAssetDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TradingAssetDataImplCopyWith<_$TradingAssetDataImpl> get copyWith =>
      __$$TradingAssetDataImplCopyWithImpl<_$TradingAssetDataImpl>(
          this, _$identity);
}

abstract class _TradingAssetData implements TradingAssetData {
  const factory _TradingAssetData(
      {required final int id,
      required final String name,
      required final String type}) = _$TradingAssetDataImpl;

  @override
  int get id;
  @override //トレード商品の名称
  String get name;
  @override //トレード商品の種類、例えば株式、仮想通貨、FXなど
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$TradingAssetDataImplCopyWith<_$TradingAssetDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
