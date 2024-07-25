// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analysis_result_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AnalysisResultState {
  double get winRate => throw _privateConstructorUsedError;
  double get averageProfit => throw _privateConstructorUsedError;
  double get averageLoss => throw _privateConstructorUsedError;
  double get riskRewardRatio => throw _privateConstructorUsedError;
  int get totalTrades => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnalysisResultStateCopyWith<AnalysisResultState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalysisResultStateCopyWith<$Res> {
  factory $AnalysisResultStateCopyWith(
          AnalysisResultState value, $Res Function(AnalysisResultState) then) =
      _$AnalysisResultStateCopyWithImpl<$Res, AnalysisResultState>;
  @useResult
  $Res call(
      {double winRate,
      double averageProfit,
      double averageLoss,
      double riskRewardRatio,
      int totalTrades});
}

/// @nodoc
class _$AnalysisResultStateCopyWithImpl<$Res, $Val extends AnalysisResultState>
    implements $AnalysisResultStateCopyWith<$Res> {
  _$AnalysisResultStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? winRate = null,
    Object? averageProfit = null,
    Object? averageLoss = null,
    Object? riskRewardRatio = null,
    Object? totalTrades = null,
  }) {
    return _then(_value.copyWith(
      winRate: null == winRate
          ? _value.winRate
          : winRate // ignore: cast_nullable_to_non_nullable
              as double,
      averageProfit: null == averageProfit
          ? _value.averageProfit
          : averageProfit // ignore: cast_nullable_to_non_nullable
              as double,
      averageLoss: null == averageLoss
          ? _value.averageLoss
          : averageLoss // ignore: cast_nullable_to_non_nullable
              as double,
      riskRewardRatio: null == riskRewardRatio
          ? _value.riskRewardRatio
          : riskRewardRatio // ignore: cast_nullable_to_non_nullable
              as double,
      totalTrades: null == totalTrades
          ? _value.totalTrades
          : totalTrades // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnalysisResultStateImplCopyWith<$Res>
    implements $AnalysisResultStateCopyWith<$Res> {
  factory _$$AnalysisResultStateImplCopyWith(_$AnalysisResultStateImpl value,
          $Res Function(_$AnalysisResultStateImpl) then) =
      __$$AnalysisResultStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double winRate,
      double averageProfit,
      double averageLoss,
      double riskRewardRatio,
      int totalTrades});
}

/// @nodoc
class __$$AnalysisResultStateImplCopyWithImpl<$Res>
    extends _$AnalysisResultStateCopyWithImpl<$Res, _$AnalysisResultStateImpl>
    implements _$$AnalysisResultStateImplCopyWith<$Res> {
  __$$AnalysisResultStateImplCopyWithImpl(_$AnalysisResultStateImpl _value,
      $Res Function(_$AnalysisResultStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? winRate = null,
    Object? averageProfit = null,
    Object? averageLoss = null,
    Object? riskRewardRatio = null,
    Object? totalTrades = null,
  }) {
    return _then(_$AnalysisResultStateImpl(
      winRate: null == winRate
          ? _value.winRate
          : winRate // ignore: cast_nullable_to_non_nullable
              as double,
      averageProfit: null == averageProfit
          ? _value.averageProfit
          : averageProfit // ignore: cast_nullable_to_non_nullable
              as double,
      averageLoss: null == averageLoss
          ? _value.averageLoss
          : averageLoss // ignore: cast_nullable_to_non_nullable
              as double,
      riskRewardRatio: null == riskRewardRatio
          ? _value.riskRewardRatio
          : riskRewardRatio // ignore: cast_nullable_to_non_nullable
              as double,
      totalTrades: null == totalTrades
          ? _value.totalTrades
          : totalTrades // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AnalysisResultStateImpl implements _AnalysisResultState {
  _$AnalysisResultStateImpl(
      {required this.winRate,
      required this.averageProfit,
      required this.averageLoss,
      required this.riskRewardRatio,
      required this.totalTrades});

  @override
  final double winRate;
  @override
  final double averageProfit;
  @override
  final double averageLoss;
  @override
  final double riskRewardRatio;
  @override
  final int totalTrades;

  @override
  String toString() {
    return 'AnalysisResultState(winRate: $winRate, averageProfit: $averageProfit, averageLoss: $averageLoss, riskRewardRatio: $riskRewardRatio, totalTrades: $totalTrades)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalysisResultStateImpl &&
            (identical(other.winRate, winRate) || other.winRate == winRate) &&
            (identical(other.averageProfit, averageProfit) ||
                other.averageProfit == averageProfit) &&
            (identical(other.averageLoss, averageLoss) ||
                other.averageLoss == averageLoss) &&
            (identical(other.riskRewardRatio, riskRewardRatio) ||
                other.riskRewardRatio == riskRewardRatio) &&
            (identical(other.totalTrades, totalTrades) ||
                other.totalTrades == totalTrades));
  }

  @override
  int get hashCode => Object.hash(runtimeType, winRate, averageProfit,
      averageLoss, riskRewardRatio, totalTrades);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalysisResultStateImplCopyWith<_$AnalysisResultStateImpl> get copyWith =>
      __$$AnalysisResultStateImplCopyWithImpl<_$AnalysisResultStateImpl>(
          this, _$identity);
}

abstract class _AnalysisResultState implements AnalysisResultState {
  factory _AnalysisResultState(
      {required final double winRate,
      required final double averageProfit,
      required final double averageLoss,
      required final double riskRewardRatio,
      required final int totalTrades}) = _$AnalysisResultStateImpl;

  @override
  double get winRate;
  @override
  double get averageProfit;
  @override
  double get averageLoss;
  @override
  double get riskRewardRatio;
  @override
  int get totalTrades;
  @override
  @JsonKey(ignore: true)
  _$$AnalysisResultStateImplCopyWith<_$AnalysisResultStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
