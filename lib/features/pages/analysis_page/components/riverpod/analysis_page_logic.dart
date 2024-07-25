import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trade_stats_accumulation/features/pages/analysis_page/components/analysis_filter/components/riverpod/analysis_filter_logic.dart';
import 'package:trade_stats_accumulation/features/pages/analysis_page/components/analysis_result/components/riverpod/analysis_result_logic.dart';
import 'package:trade_stats_accumulation/features/pages/analysis_page/components/state/analysis_page_state.dart';

part 'analysis_page_logic.g.dart';

@riverpod
class AnalysisPageNotifier extends _$AnalysisPageNotifier {
  @override
  AnalysisPageState build() {
    return AnalysisPageState();
  }

  Future<void> performAnalysis() async {
    state = state.copyWith(isLoading: true);
    
    final filterState = ref.read(analysisFilterNotifierProvider);
    final resultNotifier = ref.read(analysisResultNotifierProvider.notifier);
    
    await resultNotifier.performAnalysis(
      filterState.isBuy,
      filterState.selectedTags,
      filterState.useAndForTags,
    );
    
    state = state.copyWith(isLoading: false);
  }
}