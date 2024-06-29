// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trade_data_class.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TradeData {
  int get id => throw _privateConstructorUsedError; //どの通貨ペアか
  String get currencyPair => throw _privateConstructorUsedError; //概要
  String? get title => throw _privateConstructorUsedError; //前提
  String? get premise => throw _privateConstructorUsedError; //値幅
  int get pips => throw _privateConstructorUsedError; //結果得られた金額
  double get money => throw _privateConstructorUsedError; //取引数量
  double get lot => throw _privateConstructorUsedError; //買いか売りか
  bool get isBuy =>
      throw _privateConstructorUsedError; //urlは例えばtradingviewのurlを保存するためのもの
  String? get urlText => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError; //ここにトレードの条件を入れる
  List<String>? get tags =>
      throw _privateConstructorUsedError; //トレードデータのサムネなど、画像のパスを入れる。ここはトレードをした際のもの
  String? get imagePathBefore =>
      throw _privateConstructorUsedError; //トレードデータのサムネなど、画像のパスを入れる。ここはトレードをした後のもの
  String? get imagePathAfter =>
      throw _privateConstructorUsedError; //さらに予想と結果を入れておきたい。
//元々どこまで予想していたか、どこまで結果が出たかを入れておく
//予想の開始地点
  double? get startPrice => throw _privateConstructorUsedError; //予想の終了地点
  double? get endPrice => throw _privateConstructorUsedError; //結果の開始地点
  double? get startPriceResult => throw _privateConstructorUsedError; //結果の終了地点
  double? get endPriceResult => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TradeDataCopyWith<TradeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TradeDataCopyWith<$Res> {
  factory $TradeDataCopyWith(TradeData value, $Res Function(TradeData) then) =
      _$TradeDataCopyWithImpl<$Res, TradeData>;
  @useResult
  $Res call(
      {int id,
      String currencyPair,
      String? title,
      String? premise,
      int pips,
      double money,
      double lot,
      bool isBuy,
      String? urlText,
      DateTime createdAt,
      DateTime updatedAt,
      List<String>? tags,
      String? imagePathBefore,
      String? imagePathAfter,
      double? startPrice,
      double? endPrice,
      double? startPriceResult,
      double? endPriceResult});
}

/// @nodoc
class _$TradeDataCopyWithImpl<$Res, $Val extends TradeData>
    implements $TradeDataCopyWith<$Res> {
  _$TradeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? currencyPair = null,
    Object? title = freezed,
    Object? premise = freezed,
    Object? pips = null,
    Object? money = null,
    Object? lot = null,
    Object? isBuy = null,
    Object? urlText = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? tags = freezed,
    Object? imagePathBefore = freezed,
    Object? imagePathAfter = freezed,
    Object? startPrice = freezed,
    Object? endPrice = freezed,
    Object? startPriceResult = freezed,
    Object? endPriceResult = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      currencyPair: null == currencyPair
          ? _value.currencyPair
          : currencyPair // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      premise: freezed == premise
          ? _value.premise
          : premise // ignore: cast_nullable_to_non_nullable
              as String?,
      pips: null == pips
          ? _value.pips
          : pips // ignore: cast_nullable_to_non_nullable
              as int,
      money: null == money
          ? _value.money
          : money // ignore: cast_nullable_to_non_nullable
              as double,
      lot: null == lot
          ? _value.lot
          : lot // ignore: cast_nullable_to_non_nullable
              as double,
      isBuy: null == isBuy
          ? _value.isBuy
          : isBuy // ignore: cast_nullable_to_non_nullable
              as bool,
      urlText: freezed == urlText
          ? _value.urlText
          : urlText // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      imagePathBefore: freezed == imagePathBefore
          ? _value.imagePathBefore
          : imagePathBefore // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePathAfter: freezed == imagePathAfter
          ? _value.imagePathAfter
          : imagePathAfter // ignore: cast_nullable_to_non_nullable
              as String?,
      startPrice: freezed == startPrice
          ? _value.startPrice
          : startPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      endPrice: freezed == endPrice
          ? _value.endPrice
          : endPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      startPriceResult: freezed == startPriceResult
          ? _value.startPriceResult
          : startPriceResult // ignore: cast_nullable_to_non_nullable
              as double?,
      endPriceResult: freezed == endPriceResult
          ? _value.endPriceResult
          : endPriceResult // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TradeDataImplCopyWith<$Res>
    implements $TradeDataCopyWith<$Res> {
  factory _$$TradeDataImplCopyWith(
          _$TradeDataImpl value, $Res Function(_$TradeDataImpl) then) =
      __$$TradeDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String currencyPair,
      String? title,
      String? premise,
      int pips,
      double money,
      double lot,
      bool isBuy,
      String? urlText,
      DateTime createdAt,
      DateTime updatedAt,
      List<String>? tags,
      String? imagePathBefore,
      String? imagePathAfter,
      double? startPrice,
      double? endPrice,
      double? startPriceResult,
      double? endPriceResult});
}

/// @nodoc
class __$$TradeDataImplCopyWithImpl<$Res>
    extends _$TradeDataCopyWithImpl<$Res, _$TradeDataImpl>
    implements _$$TradeDataImplCopyWith<$Res> {
  __$$TradeDataImplCopyWithImpl(
      _$TradeDataImpl _value, $Res Function(_$TradeDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? currencyPair = null,
    Object? title = freezed,
    Object? premise = freezed,
    Object? pips = null,
    Object? money = null,
    Object? lot = null,
    Object? isBuy = null,
    Object? urlText = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? tags = freezed,
    Object? imagePathBefore = freezed,
    Object? imagePathAfter = freezed,
    Object? startPrice = freezed,
    Object? endPrice = freezed,
    Object? startPriceResult = freezed,
    Object? endPriceResult = freezed,
  }) {
    return _then(_$TradeDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      currencyPair: null == currencyPair
          ? _value.currencyPair
          : currencyPair // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      premise: freezed == premise
          ? _value.premise
          : premise // ignore: cast_nullable_to_non_nullable
              as String?,
      pips: null == pips
          ? _value.pips
          : pips // ignore: cast_nullable_to_non_nullable
              as int,
      money: null == money
          ? _value.money
          : money // ignore: cast_nullable_to_non_nullable
              as double,
      lot: null == lot
          ? _value.lot
          : lot // ignore: cast_nullable_to_non_nullable
              as double,
      isBuy: null == isBuy
          ? _value.isBuy
          : isBuy // ignore: cast_nullable_to_non_nullable
              as bool,
      urlText: freezed == urlText
          ? _value.urlText
          : urlText // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      imagePathBefore: freezed == imagePathBefore
          ? _value.imagePathBefore
          : imagePathBefore // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePathAfter: freezed == imagePathAfter
          ? _value.imagePathAfter
          : imagePathAfter // ignore: cast_nullable_to_non_nullable
              as String?,
      startPrice: freezed == startPrice
          ? _value.startPrice
          : startPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      endPrice: freezed == endPrice
          ? _value.endPrice
          : endPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      startPriceResult: freezed == startPriceResult
          ? _value.startPriceResult
          : startPriceResult // ignore: cast_nullable_to_non_nullable
              as double?,
      endPriceResult: freezed == endPriceResult
          ? _value.endPriceResult
          : endPriceResult // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$TradeDataImpl implements _TradeData {
  const _$TradeDataImpl(
      {required this.id,
      required this.currencyPair,
      required this.title,
      required this.premise,
      required this.pips,
      required this.money,
      required this.lot,
      required this.isBuy,
      required this.urlText,
      required this.createdAt,
      required this.updatedAt,
      required final List<String>? tags,
      required this.imagePathBefore,
      required this.imagePathAfter,
      required this.startPrice,
      required this.endPrice,
      required this.startPriceResult,
      required this.endPriceResult})
      : _tags = tags;

  @override
  final int id;
//どの通貨ペアか
  @override
  final String currencyPair;
//概要
  @override
  final String? title;
//前提
  @override
  final String? premise;
//値幅
  @override
  final int pips;
//結果得られた金額
  @override
  final double money;
//取引数量
  @override
  final double lot;
//買いか売りか
  @override
  final bool isBuy;
//urlは例えばtradingviewのurlを保存するためのもの
  @override
  final String? urlText;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
//ここにトレードの条件を入れる
  final List<String>? _tags;
//ここにトレードの条件を入れる
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

//トレードデータのサムネなど、画像のパスを入れる。ここはトレードをした際のもの
  @override
  final String? imagePathBefore;
//トレードデータのサムネなど、画像のパスを入れる。ここはトレードをした後のもの
  @override
  final String? imagePathAfter;
//さらに予想と結果を入れておきたい。
//元々どこまで予想していたか、どこまで結果が出たかを入れておく
//予想の開始地点
  @override
  final double? startPrice;
//予想の終了地点
  @override
  final double? endPrice;
//結果の開始地点
  @override
  final double? startPriceResult;
//結果の終了地点
  @override
  final double? endPriceResult;

  @override
  String toString() {
    return 'TradeData(id: $id, currencyPair: $currencyPair, title: $title, premise: $premise, pips: $pips, money: $money, lot: $lot, isBuy: $isBuy, urlText: $urlText, createdAt: $createdAt, updatedAt: $updatedAt, tags: $tags, imagePathBefore: $imagePathBefore, imagePathAfter: $imagePathAfter, startPrice: $startPrice, endPrice: $endPrice, startPriceResult: $startPriceResult, endPriceResult: $endPriceResult)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TradeDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.currencyPair, currencyPair) ||
                other.currencyPair == currencyPair) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.premise, premise) || other.premise == premise) &&
            (identical(other.pips, pips) || other.pips == pips) &&
            (identical(other.money, money) || other.money == money) &&
            (identical(other.lot, lot) || other.lot == lot) &&
            (identical(other.isBuy, isBuy) || other.isBuy == isBuy) &&
            (identical(other.urlText, urlText) || other.urlText == urlText) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.imagePathBefore, imagePathBefore) ||
                other.imagePathBefore == imagePathBefore) &&
            (identical(other.imagePathAfter, imagePathAfter) ||
                other.imagePathAfter == imagePathAfter) &&
            (identical(other.startPrice, startPrice) ||
                other.startPrice == startPrice) &&
            (identical(other.endPrice, endPrice) ||
                other.endPrice == endPrice) &&
            (identical(other.startPriceResult, startPriceResult) ||
                other.startPriceResult == startPriceResult) &&
            (identical(other.endPriceResult, endPriceResult) ||
                other.endPriceResult == endPriceResult));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      currencyPair,
      title,
      premise,
      pips,
      money,
      lot,
      isBuy,
      urlText,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_tags),
      imagePathBefore,
      imagePathAfter,
      startPrice,
      endPrice,
      startPriceResult,
      endPriceResult);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TradeDataImplCopyWith<_$TradeDataImpl> get copyWith =>
      __$$TradeDataImplCopyWithImpl<_$TradeDataImpl>(this, _$identity);
}

abstract class _TradeData implements TradeData {
  const factory _TradeData(
      {required final int id,
      required final String currencyPair,
      required final String? title,
      required final String? premise,
      required final int pips,
      required final double money,
      required final double lot,
      required final bool isBuy,
      required final String? urlText,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final List<String>? tags,
      required final String? imagePathBefore,
      required final String? imagePathAfter,
      required final double? startPrice,
      required final double? endPrice,
      required final double? startPriceResult,
      required final double? endPriceResult}) = _$TradeDataImpl;

  @override
  int get id;
  @override //どの通貨ペアか
  String get currencyPair;
  @override //概要
  String? get title;
  @override //前提
  String? get premise;
  @override //値幅
  int get pips;
  @override //結果得られた金額
  double get money;
  @override //取引数量
  double get lot;
  @override //買いか売りか
  bool get isBuy;
  @override //urlは例えばtradingviewのurlを保存するためのもの
  String? get urlText;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override //ここにトレードの条件を入れる
  List<String>? get tags;
  @override //トレードデータのサムネなど、画像のパスを入れる。ここはトレードをした際のもの
  String? get imagePathBefore;
  @override //トレードデータのサムネなど、画像のパスを入れる。ここはトレードをした後のもの
  String? get imagePathAfter;
  @override //さらに予想と結果を入れておきたい。
//元々どこまで予想していたか、どこまで結果が出たかを入れておく
//予想の開始地点
  double? get startPrice;
  @override //予想の終了地点
  double? get endPrice;
  @override //結果の開始地点
  double? get startPriceResult;
  @override //結果の終了地点
  double? get endPriceResult;
  @override
  @JsonKey(ignore: true)
  _$$TradeDataImplCopyWith<_$TradeDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
