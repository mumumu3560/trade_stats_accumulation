//asset_selector.dart

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trade_stats_accumulation/core/application/riverpod/db_admin/db_admin.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/database.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/extensions/all_extension.dart';

class AssetSelector extends HookConsumerWidget {
  final ValueNotifier<DriftTradingAssetData?> selectedAsset;
  final List<DriftTradingAssetData> assets;
  final Function(DriftTradingAssetData) onAssetAdded;

  const AssetSelector({
    Key? key,
    required this.selectedAsset,
    required this.assets,
    required this.onAssetAdded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("取引商品*", style: TextStyle(fontWeight: FontWeight.bold)),
        DropdownButton<DriftTradingAssetData>(
          isExpanded: true,
          value: selectedAsset.value,
          hint: Text("取引商品を選択"),
          items: assets.map((DriftTradingAssetData asset) {
            return DropdownMenuItem<DriftTradingAssetData>(
              value: asset,
              child: Text(asset.name ?? ''),
            );
          }).toList(),
          onChanged: (newValue) {
            selectedAsset.value = newValue;
          },
        ),
        TextButton(
          onPressed: () async {
            final result = await _showAddAssetDialog(context, ref);
            if (result != null) {
              onAssetAdded(result);
            }
          },
          child: Text("新しい取引商品を追加"),
        ),
      ],
    );
  }

  Future<DriftTradingAssetData?> _showAddAssetDialog(BuildContext context, WidgetRef ref) async {
    final nameController = TextEditingController();
    final typeController = TextEditingController();
    final MyDatabase dbAdmin = ref.read(dbAdminNotifierProvider);

    AlertDialog(
      title: Text("新しい取引商品を追加"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: "商品名"),
          ),
          TextField(
            controller: typeController,
            decoration: InputDecoration(labelText: "タイプ"),
          ),
        ],
      ),
      actions: [
        TextButton(
          child: Text("キャンセル"),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          child: Text("追加"),
          onPressed: () async {
            if(nameController.text.isEmpty || typeController.text.isEmpty){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("必須項目を入力してください")),
              );
              return;
            }
            final newAsset = DriftTradingAssetData(
              id: 0,
              name: nameController.text,
              type: typeController.text,
            );
            final id = await dbAdmin.insertTradingAssetData(newAsset);
            Navigator.of(context).pop(newAsset.copyWith(id: id));
          },
        ),
      ],
    );
  }
}