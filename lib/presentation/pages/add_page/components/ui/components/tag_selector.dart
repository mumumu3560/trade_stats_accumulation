//tag_selector.dart

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/database.dart';

class TagSelector extends HookConsumerWidget {
  final ValueNotifier<List<DriftTradeTag>> selectedTags;
  final List<DriftTradeTag> allTags;
  final Function(DriftTradeTag) onTagAdded;

  const TagSelector({
    Key? key,
    required this.selectedTags,
    required this.allTags,
    required this.onTagAdded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("タグ", style: TextStyle(fontWeight: FontWeight.bold)),
        Wrap(
          spacing: 8,
          children: [
            ...selectedTags.value.map((tag) => Chip(
                  label: Text(tag.tagName),
                  onDeleted: () {
                    selectedTags.value = List.from(selectedTags.value)..remove(tag);
                  },
                )),
            InputChip(
              label: Text("タグを追加"),
              onPressed: () async {
                final result = await _showTagSelectionDialog(context);
                if (result != null && !selectedTags.value.contains(result)) {
                  selectedTags.value = [...selectedTags.value, result];
                }
              },
            ),
          ],
        ),
      ],
    );
  }

  Future<DriftTradeTag?> _showTagSelectionDialog(BuildContext context) async {
    // ダイアログの実装（既存のコードを使用）
  }
}