// tag_selector_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/database.dart';

part 'tag_selector_state.freezed.dart';

@freezed
class TagSelectorState with _$TagSelectorState {
  factory TagSelectorState({
    required List<DriftTradeTag> allTags,
    required List<DriftTradeTag> filteredTags,
    required List<String> genres,
    String? selectedGenre,
  }) = _TagSelectorState;

  factory TagSelectorState.initial() => TagSelectorState(
    allTags: [],
    filteredTags: [],
    genres: [],
  );
}