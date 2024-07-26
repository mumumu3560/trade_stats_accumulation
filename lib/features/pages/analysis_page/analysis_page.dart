import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trade_stats_accumulation/core/application/config/money/admob/inline_adaptive_banner.dart';
import 'package:trade_stats_accumulation/features/pages/analysis_page/components/analysis_filter/analysis_filter.dart';
import 'package:trade_stats_accumulation/features/pages/analysis_page/components/analysis_result/analysis_result.dart';
import 'package:trade_stats_accumulation/features/pages/analysis_page/components/riverpod/analysis_page_logic.dart';
import 'package:trade_stats_accumulation/utils/various.dart';

class AnalysisPage extends HookConsumerWidget {
  const AnalysisPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = ref.watch(analysisPageNotifierProvider);
    final pageNotifier = ref.read(analysisPageNotifierProvider.notifier);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text("トレード分析"),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: AnalysisFilter(),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: pageNotifier.performAnalysis,
                        icon: Icon(Icons.analytics),
                        label: Text('分析を実行'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      if (pageState.isLoading)
                        Center(child: CircularProgressIndicator())
                      else
                        Card(
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: AnalysisResults(),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: SizeConfig.blockSizeVertical! * 2),

            SizedBox(height: 16),

          Container(
            color: Colors.white,
            height: SizeConfig.blockSizeVertical! * 10,

            child: InlineAdaptiveAdBanner(
              requestId: "ANALYSIS", 
              adHeight: SizeConfig.blockSizeVertical!.toInt() * 10,
            ),
          ),
          ],
        ),
      ),
    );
  }
}