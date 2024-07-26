import 'package:freezed_annotation/freezed_annotation.dart';

part 'analysis_page_state.freezed.dart';

@freezed
class AnalysisPageState with _$AnalysisPageState {
  factory AnalysisPageState({
    @Default(false) bool isLoading,
  }) = _AnalysisPageState;
}