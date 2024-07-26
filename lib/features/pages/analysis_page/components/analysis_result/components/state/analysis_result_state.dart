import 'package:freezed_annotation/freezed_annotation.dart';

part 'analysis_result_state.freezed.dart';

@freezed
class AnalysisResultState with _$AnalysisResultState {
  factory AnalysisResultState({
    required double winRate,
    required double averageProfit,
    required double averageLoss,
    required double riskRewardRatio,
    required int totalTrades,
  }) = _AnalysisResultState;

  factory AnalysisResultState.initial() => AnalysisResultState(
    winRate: 0,
    averageProfit: 0,
    averageLoss: 0,
    riskRewardRatio: 0,
    totalTrades: 0,
  );
}