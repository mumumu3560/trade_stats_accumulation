// tag_selector.dart
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/database.dart';
import 'package:trade_stats_accumulation/features/pages/add_page/components/tag_selector/riverpod/tag_selector_logic.dart';



class TagSelector extends HookConsumerWidget {
  final List<DriftTradeTag> selectedTags;
  final Function(DriftTradeTag) onTagSelected;
  final Function(DriftTradeTag) onTagDeselected;

  const TagSelector({
    Key? key,
    required this.selectedTags,
    required this.onTagSelected,
    required this.onTagDeselected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tagState = ref.watch(tagSelectorNotifierProvider);
    final tagNotifier = ref.read(tagSelectorNotifierProvider.notifier);
    final isAddingTag = useState(false);
    final newTagNameController = useTextEditingController();
    final newGenreController = useTextEditingController();
    final selectedGenre = useState<String?>(null);

    useEffect(() {
      tagNotifier.initialize();
      return null;
    }, []);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("追加するタグ", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: selectedTags.map((tag) => Chip(
            label: Text(tag.tagName),
            onDeleted: () => onTagDeselected(tag),
          )).toList(),
        ),
        SizedBox(height: 16),

        //TextStyleは少し薄くしたい
        Text("ジャンルで絞り込み", style: TextStyle(fontWeight: FontWeight.w100)),
        DropdownButton<String>(
          isExpanded: true,
          value: tagState.selectedGenre,
          hint: Text("ジャンルを選択"),
          items: [
            DropdownMenuItem<String>(value: null, child: Text("すべて")),
            ...tagState.genres.map((genre) => DropdownMenuItem<String>(
              value: genre,
              child: Text(genre),
            )),
          ],
          onChanged: (genre) => tagNotifier.selectGenre(genre),
        ),
        SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: tagState.filteredTags.map((tag) => FilterChip(
            label: Text(tag.tagName),
            selected: selectedTags.contains(tag),
            onSelected: (selected) {
              if (selected) {
                onTagSelected(tag);
              } else {
                onTagDeselected(tag);
              }
            },
          )).toList(),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => isAddingTag.value = !isAddingTag.value,
          child: Text(isAddingTag.value ? "キャンセル" : "新しいタグを追加"),
        ),
        if (isAddingTag.value) ...[
          SizedBox(height: 16),
          TextField(
            controller: newTagNameController,
            decoration: InputDecoration(
              labelText: "新しいタグ名",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value: selectedGenre.value,
            decoration: InputDecoration(
              labelText: "ジャンルを選択または新規作成",
              border: OutlineInputBorder(),
            ),
            items: [
              ...tagState.genres.map((genre) => DropdownMenuItem<String>(
                value: genre,
                child: Text(genre),
              )),
              DropdownMenuItem<String>(value: "新規作成", child: Text("新規作成")),
            ],
            onChanged: (value) {
              selectedGenre.value = value;
              if (value != "新規作成") {
                newGenreController.text = value ?? '';
              } else {
                newGenreController.clear();
              }
            },
          ),
          SizedBox(height: 8),
          TextField(
            controller: newGenreController,
            decoration: InputDecoration(
              labelText: selectedGenre.value == "新規作成" ? "新しいジャンル名" : "ジャンル名（編集可能）",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () async {
              final tagName = newTagNameController.text.trim();
              final genre = newGenreController.text.trim();
              
              if (tagName.isNotEmpty && genre.isNotEmpty) {
                final success = await tagNotifier.addNewTag(tagName, genre, "");
                if (success) {
                  isAddingTag.value = false;
                  newTagNameController.clear();
                  newGenreController.clear();
                  selectedGenre.value = null;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("新しいタグを追加しました")),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("このタグは既に存在します")),
                  );
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("タグ名とジャンルを入力してください")),
                );
              }
            },
            child: Text("タグを追加"),
          ),
        ],
      ],
    );
  }
}