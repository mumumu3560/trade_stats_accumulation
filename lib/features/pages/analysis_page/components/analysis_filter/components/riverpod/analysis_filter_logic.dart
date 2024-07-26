import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trade_stats_accumulation/core/application/riverpod/db_admin/db_admin.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/database.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/extensions/all_extension.dart';
import 'package:trade_stats_accumulation/features/pages/analysis_page/components/analysis_filter/components/state/analysis_filter_state.dart';

part 'analysis_filter_logic.g.dart';

@riverpod
class AnalysisFilterNotifier extends _$AnalysisFilterNotifier {
  @override
  AnalysisFilterState build() {
    return AnalysisFilterState.initial();
  }

  Future<void> initialize() async {
    final db = ref.read(dbAdminNotifierProvider);
    final tags = await db.getAllTags();
    final genres = await db.getDistinctGenres();
    state = state.copyWith(
      allTags: tags,
      filteredTags: tags,
      genres: genres,
    );
  }

  void selectGenre(String? genre) {
    final filteredTags = genre == null
        ? state.allTags
        : state.allTags.where((tag) => tag.genre == genre).toList();
    state = state.copyWith(
      selectedGenre: genre,
      filteredTags: filteredTags,
    );
  }

  /*
  
   */
  void updateAsset(DriftTradingAssetData? asset) {
    state = state.copyWith(selectedAsset: asset);

  }

  void updateUseAndForTags(bool value) {
    state = state.copyWith(useAndForTags: value);
  }

  void updateSelectedTags(List<String> tags) {
    state = state.copyWith(selectedTags: tags);
  }

  void updateIsBuy(bool value) {
    state = state.copyWith(isBuy: value);
  }
}