import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trade_stats_accumulation/features/pages/analysis_page/components/analysis_filter/components/asset_selector/ui/asset_selector.dart';
import 'package:trade_stats_accumulation/features/pages/analysis_page/components/analysis_filter/components/riverpod/analysis_filter_logic.dart';

class AnalysisFilter extends HookConsumerWidget {
  const AnalysisFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(analysisFilterNotifierProvider);
    final filterNotifier = ref.read(analysisFilterNotifierProvider.notifier);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    useEffect(() {
      filterNotifier.initialize();
      return null;
    }, []);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('フィルター', ),
        SizedBox(height: 16),

        /*
        
         */
        AssetSelector(onAssetSelected: (asset) {
          filterNotifier.updateAsset(asset);
        }),

        SizedBox(height: 16),
        Row(
          children: [
            Text('取引タイプ: ', ),
            SizedBox(width: 10),
            ToggleButtons(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('BUY', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('SELL', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
              isSelected: [filterState.isBuy, !filterState.isBuy],
              onPressed: (index) => filterNotifier.updateIsBuy(index == 0),
              color: isDarkMode ? Colors.white70 : Colors.black87,
              selectedColor: Colors.white,
              fillColor: isDarkMode ? Colors.blueGrey[700] : Colors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
          ],
        ),
        SizedBox(height: 16),
        Text("選択したタグ:", ),
        SizedBox(height: 8),
        Wrap( 
          spacing: 8,
          children: filterState.selectedTags.map((tag) => Chip(
            label: Text(tag),
            onDeleted: () {
              List<String> updatedTags = List.from(filterState.selectedTags);
              updatedTags.remove(tag);
              filterNotifier.updateSelectedTags(updatedTags);
            },
            backgroundColor: isDarkMode ? Colors.blueGrey[700] : Colors.blue[100],
            labelStyle: TextStyle(color: isDarkMode ? Colors.white : Colors.black87),
          )).toList(),
        ),
        SizedBox(height: 16),
        Text('ジャンル:', ),
        SizedBox(height: 8),
        DropdownButtonFormField<String>(
          isExpanded: true,
          value: filterState.selectedGenre,
          hint: Text("ジャンルで絞り込み"),
          items: [
            DropdownMenuItem<String>(value: null, child: Text("すべて")),
            ...filterState.genres.map((genre) => DropdownMenuItem<String>(
              value: genre,
              child: Text(genre),
            )),
          ],
          onChanged: (genre) => filterNotifier.selectGenre(genre),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
        ),
        SizedBox(height: 16),
        Text('利用可能なタグ:', ),
        SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: filterState.filteredTags.map((tag) => FilterChip(
            label: Text(tag.tagName),
            selected: filterState.selectedTags.contains(tag.tagName),
            onSelected: (selected) {
              List<String> updatedTags = List.from(filterState.selectedTags);
              if (selected) {
                updatedTags.add(tag.tagName);
              } else {
                updatedTags.remove(tag.tagName);
              }
              filterNotifier.updateSelectedTags(updatedTags);
            },
            selectedColor: isDarkMode ? Colors.blueGrey[700] : Colors.blue[100],
            checkmarkColor: isDarkMode ? Colors.white : Colors.blue,
          )).toList(),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Text('AND検索:', ),
            SizedBox(width: 8),
            Switch(
              value: filterState.useAndForTags,
              onChanged: (value) => filterNotifier.updateUseAndForTags(value),
              activeColor: isDarkMode ? Colors.blueGrey[700] : Colors.blue,
            ),
          ],
        ),
      ],
    );
  }
}