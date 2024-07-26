import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trade_stats_accumulation/core/application/riverpod/db_admin/db_admin.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/database.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/extensions/all_extension.dart';
import 'package:trade_stats_accumulation/features/pages/analysis_page/components/analysis_result/components/state/analysis_result_state.dart';

part 'analysis_result_logic.g.dart';

@riverpod
class AnalysisResultNotifier extends _$AnalysisResultNotifier {
  @override
  AnalysisResultState build() {
    return AnalysisResultState.initial();
  }

  Future<void> performAnalysis(bool isBuy, List<String> selectedTags, bool useAndForTags, DriftTradingAssetData? selectedAsset) async {
    final db = ref.read(dbAdminNotifierProvider);
    //ここでフィルターする
    final filteredTrades = await db.getFilteredDriftTradeDatas(
      isBuy: isBuy,
      tags: selectedTags,
      useAndForTags: useAndForTags,
      currencyPair: selectedAsset?.name ,
    );

    final winningTrades = filteredTrades.where((trade) => (trade.pips ?? 0) > 0).toList();
    final losingTrades = filteredTrades.where((trade) => (trade.pips ?? 0) < 0).toList();

    final winRate = filteredTrades.isNotEmpty ? winningTrades.length / filteredTrades.length : 0;
    final averageProfit = winningTrades.isNotEmpty
        ? winningTrades.map((t) => t.pips ?? 0).reduce((a, b) => a + b) / winningTrades.length
        : 0;
    final averageLoss = losingTrades.isNotEmpty
        ? losingTrades.map((t) => t.pips ?? 0).reduce((a, b) => a + b).abs() / losingTrades.length
        : 0;
    final riskRewardRatio = averageLoss != 0 ? averageProfit / averageLoss : 0;

    state = AnalysisResultState(
      winRate: winRate.toDouble(),
      averageProfit: averageProfit.toDouble(),
      averageLoss: averageLoss.toDouble(),
      riskRewardRatio: riskRewardRatio.toDouble(),
      totalTrades: filteredTrades.length,
    );
  }
}