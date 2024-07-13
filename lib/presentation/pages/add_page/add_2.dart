import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trade_stats_accumulation/core/application/riverpod/db_admin/db_admin.dart';
import 'package:trade_stats_accumulation/core/application/riverpod/theme/theme.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/database.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/extensions/extensions_importer.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/extensions/trading_asset/trading_assets_operations.dart';

class AddPage extends HookConsumerWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeModeNotifierProvider);
    final dbAdmin = ref.watch(dbAdminNotifierProvider);

    final selectedAsset = useState<DriftTradingAssetData?>(null);
    final premiseController = useTextEditingController();
    final isBuy = useState(true);
    final lotController = useTextEditingController();
    final selectedTags = useState<List<DriftTradeTag>>([]);
    final newTagController = useTextEditingController();
    final startPriceController = useTextEditingController();
    final endPriceController = useTextEditingController();
    final startPriceResultController = useTextEditingController();
    final endPriceResultController = useTextEditingController();
    final entriedAtController = useTextEditingController();
    final exitedAtController = useTextEditingController();
    final pipsController = useTextEditingController();
    final moneyController = useTextEditingController();

    final assets = useState<List<DriftTradingAssetData>>([]);
    final allTags = useState<List<DriftTradeTag>>([]);

    useEffect(() {
      dbAdmin.getAllTradingAssetDatas().then((value) => assets.value = value);
      dbAdmin.getAllTags().then((value) => allTags.value = value);
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: Text("トレード結果追加"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("取引商品*", style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButton<DriftTradingAssetData>(
              isExpanded: true,
              value: selectedAsset.value,
              hint: Text("取引商品を選択"),
              items: assets.value.map((DriftTradingAssetData asset) {
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
                // 新しい取引商品を追加するダイアログを表示
                final result = await showDialog<DriftTradingAssetData>(
                  context: context,
                  builder: (BuildContext context) {
                    final nameController = TextEditingController();
                    final typeController = TextEditingController();
                    return AlertDialog(
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
                  },
                );
                if (result != null) {
                  assets.value = [...assets.value, result];
                  selectedAsset.value = result;
                }
              },
              child: Text("新しい取引商品を追加"),
            ),

            SizedBox(height: 16),
            Text("エントリー*", style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => isBuy.value = true,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isBuy.value ? Colors.green : Colors.grey,
                    ),
                    child: Text("買い"),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => isBuy.value = false,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: !isBuy.value ? Colors.red : Colors.grey,
                    ),
                    child: Text("売り"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text("Lot*", style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: lotController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "例: 0.01",
              ),
            ),
            SizedBox(height: 16),
            Text("前提", style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: premiseController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "エントリーの理由や市場状況など",
              ),
            ),

            SizedBox(height: 16),
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
                    final result = await showDialog<DriftTradeTag>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("タグを選択または追加"),
                          content: SingleChildScrollView(
                            child: Column(
                              children: [
                                ...allTags.value.map((tag) => ListTile(
                                      title: Text(tag.tagName),
                                      onTap: () => Navigator.of(context).pop(tag),
                                    )),
                                TextButton(
                                  child: Text("新しいタグを追加"),
                                  onPressed: () async {
                                    final newTag = await showDialog<DriftTradeTag>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        final nameController = TextEditingController();
                                        final genreController = TextEditingController();
                                        return AlertDialog(
                                          title: Text("新しいタグを追加"),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              TextField(
                                                controller: nameController,
                                                decoration: InputDecoration(labelText: "タグ名"),
                                              ),
                                              TextField(
                                                controller: genreController,
                                                decoration: InputDecoration(labelText: "ジャンル"),
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
                                                final newTag = DriftTradeTag(
                                                  id: 0,
                                                  tagName: nameController.text,
                                                  genre: genreController.text,
                                                  createdAt: DateTime.now(),
                                                  useCount: 0,
                                                );
                                                final id = await dbAdmin.insertTag(newTag);
                                                Navigator.of(context).pop(newTag.copyWith(id: id));
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    if (newTag != null) {
                                      allTags.value = [...allTags.value, newTag];
                                      Navigator.of(context).pop(newTag);
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                    if (result != null && !selectedTags.value.contains(result)) {
                      selectedTags.value = [...selectedTags.value, result];
                    }
                  },
                ),
              ],
            ),

            SizedBox(height: 16),
            Text("Pips", style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: pipsController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "例: 10",
              ),
            ),

            SizedBox(height: 16),
            Text("損益 (円)", style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: moneyController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                hintText: "例: 1000.50",
              ),
            ),

            SizedBox(height: 16),
          Text("エントリー日時", style: TextStyle(fontWeight: FontWeight.bold)),
          TextField(
            controller: entriedAtController,
            decoration: InputDecoration(
              hintText: "YYYY-MM-DD HH:MM",
            ),
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (date != null) {
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (time != null) {
                  final dateTime = DateTime(
                    date.year, date.month, date.day, time.hour, time.minute,
                  );
                  entriedAtController.text = dateTime.toIso8601String();
                }
              }
            },
          ),

          SizedBox(height: 16),
          Text("決済日時", style: TextStyle(fontWeight: FontWeight.bold)),
          TextField(
            controller: exitedAtController,
            decoration: InputDecoration(
              hintText: "YYYY-MM-DD HH:MM",
            ),
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (date != null) {
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (time != null) {
                  final dateTime = DateTime(
                    date.year, date.month, date.day, time.hour, time.minute,
                  );
                  exitedAtController.text = dateTime.toIso8601String();
                }
              }
            },
          ),

            SizedBox(height: 16),
            Text("予想価格範囲", style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: startPriceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "開始価格"),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: endPriceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "終了価格"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text("実際の価格範囲", style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: startPriceResultController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "開始価格（結果）"),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: endPriceResultController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "終了価格（結果）"),
                  ),
                ),
              ],
            ),

            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (selectedAsset.value == null || lotController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("必須項目を入力してください")),
                  );
                  return;
                }
                final tradeData = DriftTradeData(
                  id: 0,
                  currencyPair: selectedAsset.value!.name,
                  premise: premiseController.text,
                  isBuy: isBuy.value,
                  lot: double.tryParse(lotController.text) ?? 0,
                  tags: selectedTags.value.map((tag) => tag.tagName).toList(),
                  startPrice: double.tryParse(startPriceController.text),
                  endPrice: double.tryParse(endPriceController.text),
                  startPriceResult: double.tryParse(startPriceResultController.text),
                  endPriceResult: double.tryParse(endPriceResultController.text),
                  updatedAt: DateTime.now(),
                  createdAt: DateTime.now(),
                  urlText: "",
                  entriedAt: DateTime.tryParse(entriedAtController.text),
                  exitedAt: DateTime.tryParse(exitedAtController.text),
                  pips: pipsController.text.isNotEmpty ? int.tryParse(pipsController.text) : null,
                  money: moneyController.text.isNotEmpty ? double.tryParse(moneyController.text) : null,
                );
                
                dbAdmin.insertTradeData(tradeData).then((_) {
                  // タグの使用回数を更新
                  for (var tag in selectedTags.value) {
                    dbAdmin.updateTag(tag.copyWith(useCount: tag.useCount + 1));
                  }
                });
                Navigator.of(context).pop();
              },
              child: Text("追加"),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}