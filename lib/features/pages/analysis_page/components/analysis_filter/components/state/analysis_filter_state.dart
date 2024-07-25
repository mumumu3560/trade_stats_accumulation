import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/database.dart';

part 'analysis_filter_state.freezed.dart';

@freezed
class AnalysisFilterState with _$AnalysisFilterState {
  factory AnalysisFilterState({
    required List<DriftTradeTag> allTags,
    required List<DriftTradeTag> filteredTags,
    required List<String> genres,
    String? selectedGenre,
    @Default([]) List<String> selectedTags,
    @Default(true) bool isBuy,
    @Default(false) bool useAndForTags,
  }) = _AnalysisFilterState;

  factory AnalysisFilterState.initial() => AnalysisFilterState(
    allTags: [],
    filteredTags: [],
    genres: [],
  );
}