import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:trade_stats_accumulation/features/pages/analysis_page/components/analysis_result/components/riverpod/analysis_result_logic.dart';
import 'package:trade_stats_accumulation/features/pages/analysis_page/components/analysis_result/components/state/analysis_result_state.dart';
import 'package:trade_stats_accumulation/features/pages/analysis_page/components/analysis_result/score_logic.dart';

class AnalysisResults extends HookConsumerWidget {
  const AnalysisResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultState = ref.watch(analysisResultNotifierProvider);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = _getColorScheme(isDarkMode);

    // 期待値の計算
    final expectedValue = (resultState.winRate * resultState.averageProfit) +
        ((1 - resultState.winRate) * resultState.averageLoss);

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '分析結果',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.textPrimary,
                  ),
                ),
                SizedBox(height: 24),
                _buildWinRateChart(resultState.winRate, colorScheme, constraints.maxWidth),
                SizedBox(height: 24),
                _buildProfitLossComparison(resultState, colorScheme),
                SizedBox(height: 24),
                _buildRiskRewardRatio(resultState.riskRewardRatio, colorScheme),
                SizedBox(height: 24),
                _buildExpectedValue(expectedValue, colorScheme),
                SizedBox(height: 24),
                _buildTotalTrades(resultState.totalTrades, colorScheme),

                SizedBox(height: 24),
              //_buildDetailedAnalysis(resultState, colorScheme), // 新しく追加したウィジェット
          
              ],
            ),
          ),
        );
      },
    );
  }

  ColorScheme _getColorScheme(bool isDarkMode) {
    if (isDarkMode) {
      return ColorScheme(
        background: Color(0xFF1C1C1E),
        surface: Color(0xFF2C2C2E),
        primary: Color(0xFF0A84FF),
        secondary: Color(0xFF5E5CE6),
        accent: Color(0xFFFFD60A),
        textPrimary: Colors.white,
        textSecondary: Colors.white70,
        positive: Color(0xFF30D158),
        negative: Color(0xFFFF453A),
      );
    } else {
      return ColorScheme(
        background: Colors.white,
        surface: Color(0xFFF2F2F7),
        primary: Color(0xFF007AFF),
        secondary: Color(0xFF5856D6),
        accent: Color(0xFFFFCC00),
        textPrimary: Colors.black,
        textSecondary: Colors.black54,
        positive: Color(0xFF34C759),
        negative: Color(0xFFFF3B30),
      );
    }
  }

  Widget _buildWinRateChart(double winRate, ColorScheme colorScheme, double maxWidth) {
    final chartSize = maxWidth * 0.4;
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '勝率',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: colorScheme.textPrimary,
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: SizedBox(
                width: chartSize,
                height: chartSize,
                child: Stack(
                  children: [
                    PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                            color: colorScheme.positive,
                            value: winRate * 100,
                            title: '',
                            radius: chartSize / 2,
                            showTitle: false,
                          ),
                          PieChartSectionData(
                            color: colorScheme.negative.withOpacity(0.7),
                            value: (1 - winRate) * 100,
                            title: '',
                            radius: chartSize / 2,
                            showTitle: false,
                          ),
                        ],
                        sectionsSpace: 0,
                        centerSpaceRadius: 0,
                      ),
                    ),
                    Center(
                      child: Text(
                        '${(winRate * 100).toStringAsFixed(1)}%',
                        style: TextStyle(
                          fontSize: chartSize / 8,
                          fontWeight: FontWeight.bold,
                          color: colorScheme.textPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLegendItem(colorScheme.positive, '勝率', colorScheme),
                SizedBox(width: 24),
                _buildLegendItem(colorScheme.negative.withOpacity(0.7), '負率', colorScheme),


              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(Color color, String label, ColorScheme colorScheme) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            color: colorScheme.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildProfitLossComparison(AnalysisResultState state, ColorScheme colorScheme) {
    final maxValue = [state.averageProfit.abs(), state.averageLoss.abs()].reduce((a, b) => a > b ? a : b);
    final interval = maxValue > 0 ? (maxValue / 5).ceilToDouble() : 1.0;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '平均利益 vs 平均損失',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: colorScheme.textPrimary,
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: maxValue > 0 ? maxValue : 1.0,
                  minY: 0,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          String text = '';
                          if (value == 0) text = '平均利益';
                          if (value == 1) text = '平均損失';
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              text,
                              style: TextStyle(
                                color: colorScheme.textSecondary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                        reservedSize: 42,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        interval: interval,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            '${value.toStringAsFixed(1)}',
                            style: TextStyle(
                              color: colorScheme.textSecondary,
                              fontSize: 10,
                            ),
                          );
                        },
                      ),
                    ),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: interval,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: colorScheme.textSecondary.withOpacity(0.2),
                        strokeWidth: 1,
                      );
                    },
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: [
                    BarChartGroupData(
                      x: 0,
                      barRods: [
                        BarChartRodData(
                          toY: state.averageProfit > 0 ? state.averageProfit : 0,
                          color: colorScheme.positive,
                          width: 40,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 1,
                      barRods: [
                        BarChartRodData(
                          toY: state.averageLoss.abs() > 0 ? state.averageLoss.abs() : 0,
                          color: colorScheme.negative.withOpacity(0.7),
                          width: 40,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '平均利益: ${state.averageProfit.toStringAsFixed(2)} pips',
                  style: TextStyle(
                    color: colorScheme.positive,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  '平均損失: ${state.averageLoss.toStringAsFixed(2)} pips',
                  style: TextStyle(
                    color: colorScheme.negative,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRiskRewardRatio(double ratio, ColorScheme colorScheme) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'リスクリワード比',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: colorScheme.textPrimary,
              ),
            ),
            SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 40,
                      color: colorScheme.negative.withOpacity(0.7),
                      alignment: Alignment.center,
                      child: Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: ratio.round(),
                    child: Container(
                      height: 40,
                      color: colorScheme.positive,
                      alignment: Alignment.center,
                      child: Text(
                        ratio.toStringAsFixed(2),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              '1 : ${ratio.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: colorScheme.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
Widget _buildExpectedValue(double expectedValue, ColorScheme colorScheme) {
    final isPositive = expectedValue > 0;
    final color = isPositive ? colorScheme.positive : colorScheme.negative;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '期待値',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: colorScheme.textPrimary,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isPositive ? Icons.trending_up : Icons.trending_down,
                  color: color,
                  size: 40,
                ),
                SizedBox(width: 16),
                Text(
                  '${expectedValue.toStringAsFixed(2)} pips',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              '期待値は1トレードあたりの平均的な利益または損失を示します。',
              style: TextStyle(
                color: colorScheme.textSecondary,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalTrades(int totalTrades, ColorScheme colorScheme) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '総取引数',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: colorScheme.textPrimary,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.bar_chart,
                  color: colorScheme.accent,
                  size: 40,
                ),
                SizedBox(width: 16),
                Text(
                  '$totalTrades',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'これまでに分析されたトレードの総数です。',
              style: TextStyle(
                color: colorScheme.textSecondary,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }



Widget _buildDetailedAnalysis(AnalysisResultState state, ColorScheme colorScheme) {
    final analysisResult = TradeAnalyzer.analyzeTradeStrategy(state.winRate, state.totalTrades);

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '詳細な統計分析',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: colorScheme.textPrimary,
              ),
            ),
            SizedBox(height: 16),
            _buildAnalysisItem(
              '現在の勝率',
              '${(analysisResult.winRate * 100).toStringAsFixed(2)}%',
              '現在のトレード戦略の成功率です。',
              colorScheme,
            ),
            _buildAnalysisItem(
              '95%信頼区間',
              '${(analysisResult.confidenceInterval['lower']! * 100).toStringAsFixed(2)}% - ${(analysisResult.confidenceInterval['upper']! * 100).toStringAsFixed(2)}%',
              '真の勝率がこの範囲内にある可能性が95%です。範囲が狭いほど信頼性が高くなります。',
              colorScheme,
            ),
            _buildAnalysisItem(
              '現在のサンプルサイズ',
              '${analysisResult.totalTrades}トレード',
              '分析に使用されたトレードの総数です。',
              colorScheme,
            ),
            _buildAnalysisItem(
              '推奨サンプルサイズ',
              '${analysisResult.requiredSampleSize}トレード',
              '2%の誤差範囲で信頼性の高い結果を得るために必要なトレード数です。',
              colorScheme,
            ),
            _buildAnalysisItem(
              '効果検出のための必要サンプル',
              '${analysisResult.sampleSizeForEffect}トレード',
              '10%の勝率の違い（効果量0.1）を統計的に有意に検出するために必要なトレード数です。',
              colorScheme,
            ),
            SizedBox(height: 16),
            Text(
              '分析結果',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: colorScheme.textPrimary,
              ),
            ),
            SizedBox(height: 8),
            Text(
              analysisResult.conclusion,
              style: TextStyle(
                color: colorScheme.textSecondary,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnalysisItem(String label, String value, String description, ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.textPrimary,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(
              color: colorScheme.textSecondary,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }




}

class ColorScheme {
  final Color background;
  final Color surface;
  final Color primary;
  final Color secondary;
  final Color accent;
  final Color textPrimary;
  final Color textSecondary;
  final Color positive;
  final Color negative;

  ColorScheme({
    required this.background,
    required this.surface,
    required this.primary,
    required this.secondary,
    required this.accent,
    required this.textPrimary,
    required this.textSecondary,
    required this.positive,
    required this.negative,
  });
}