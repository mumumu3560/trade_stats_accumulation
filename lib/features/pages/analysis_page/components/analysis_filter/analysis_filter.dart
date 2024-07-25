
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trade_stats_accumulation/features/pages/analysis_page/components/analysis_filter/components/riverpod/analysis_filter_logic.dart';
class AnalysisFilter extends HookConsumerWidget {
  const AnalysisFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(analysisFilterNotifierProvider);
    final filterNotifier = ref.read(analysisFilterNotifierProvider.notifier);

    useEffect(() {
      filterNotifier.initialize();
      return null;
    }, []);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('フィルター',),
        SizedBox(height: 10),
        Row(
          children: [
            Text('取引タイプ: '),
            ToggleButtons(
              children: [Icon(Icons.arrow_upward), Icon(Icons.arrow_downward)],
              isSelected: [filterState.isBuy, !filterState.isBuy],
              onPressed: (index) => filterNotifier.updateIsBuy(index == 0),
            ),
          ],
        ),
        SizedBox(height: 10),

        Text("検索するタグ: "),



        Wrap( 
          spacing: 8,
          children: filterState.selectedTags.map((tag) => Chip(
            label: Text(tag),
            onDeleted: () {
              List<String> updatedTags = List.from(filterState.selectedTags);
              updatedTags.remove(tag);
              filterNotifier.updateSelectedTags(updatedTags);
            },
          )).toList(),

        ),



        SizedBox(height: 10),
        Text('ジャンル:'),
        DropdownButton<String>(
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
        ),
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
          )).toList(),
        ),

        SizedBox(height: 10),

        //ここでAnd検索のチェックボックスを追加
        Text('And検索'),
        Checkbox(
          value: filterState.useAndForTags,
          onChanged: (value) => filterNotifier.updateUseAndForTags(value!),
        ),
      ],
    );
  }
}