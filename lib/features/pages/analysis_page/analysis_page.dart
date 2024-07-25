import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trade_stats_accumulation/features/pages/analysis_page/components/analysis_filter/analysis_filter.dart';
import 'package:trade_stats_accumulation/features/pages/analysis_page/components/analysis_result/analysis_result.dart';
import 'package:trade_stats_accumulation/features/pages/analysis_page/components/riverpod/analysis_page_logic.dart';
class AnalysisPage extends HookConsumerWidget {
  const AnalysisPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = ref.watch(analysisPageNotifierProvider);
    final pageNotifier = ref.read(analysisPageNotifierProvider.notifier);

    final useAndForTags = useState(false);

    return Scaffold(
      appBar: AppBar(
        title: Text("トレード分析"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnalysisFilter(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: pageNotifier.performAnalysis,
                child: Text('分析を実行'),
              ),
              SizedBox(height: 20),
              if (pageState.isLoading)
                CircularProgressIndicator()
              else
                AnalysisResults(),
            ],
          ),
        ),
      ),
    );
  }
}