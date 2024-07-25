import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trade_stats_accumulation/features/pages/analysis_page/components/analysis_result/components/riverpod/analysis_result_logic.dart';
class AnalysisResults extends HookConsumerWidget {
  const AnalysisResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultState = ref.watch(analysisResultNotifierProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('分析結果',),
        SizedBox(height: 10),
        _buildResultItem('勝率', '${(resultState.winRate * 100).toStringAsFixed(2)}%'),
        _buildResultItem('平均利益', '${resultState.averageProfit.toStringAsFixed(2)} pips'),
        _buildResultItem('平均損失', '${resultState.averageLoss.toStringAsFixed(2)} pips'),
        _buildResultItem('リスクリワード比', '1 : ${resultState.riskRewardRatio.toStringAsFixed(2)}'),
        _buildResultItem('総取引数', '${resultState.totalTrades}'),
      ],
    );
  }

  Widget _buildResultItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}