//trade_form.dart


import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/database.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/extensions/all_extension.dart';
import '../asset_selector/ui/asset_selector.dart';
import 'components/entry_type_selector.dart';
import 'components/tag_selector.dart';
import 'components/date_time_picker.dart';
import 'components/price_range_input.dart';

class TradeForm extends HookConsumerWidget {
  final ValueNotifier<DriftTradingAssetData?> selectedAsset;
  final ValueNotifier<bool> isBuy;
  final ValueNotifier<List<DriftTradeTag>> selectedTags;
  final MyDatabase dbAdmin;

  const TradeForm({
    Key? key,
    required this.selectedAsset,
    required this.isBuy,
    required this.selectedTags,
    required this.dbAdmin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final premiseController = useTextEditingController();
    final lotController = useTextEditingController();
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



    void _submitForm(BuildContext context) {
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
      
      /*
      
       */
      dbAdmin.insertTradeData(tradeData).then((_) {
        // タグの使用回数を更新
        for (var tag in selectedTags.value) {
          dbAdmin.updateTag(tag.copyWith(useCount: tag.useCount + 1));
        }
      });
      Navigator.of(context).pop();
    }

    

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AssetSelector(
          selectedAsset: selectedAsset,
          assets: assets.value,
          onAssetAdded: (asset) {
            assets.value = [...assets.value, asset];
            selectedAsset.value = asset;
          },
        ),
        SizedBox(height: 16),
        EntryTypeSelector(isBuy: isBuy),
        SizedBox(height: 16),
        _buildTextInput("Lot*", lotController, "例: 0.01"),
        SizedBox(height: 16),
        _buildTextInput("前提", premiseController, "エントリーの理由や市場状況など", maxLines: 3),
        SizedBox(height: 16),
        TagSelector(
          selectedTags: selectedTags,
          allTags: allTags.value,
          onTagAdded: (tag) {
            allTags.value = [...allTags.value, tag];
          },
        ),
        SizedBox(height: 16),
        _buildTextInput("Pips", pipsController, "例: 10"),
        SizedBox(height: 16),
        _buildTextInput("損益 (円)", moneyController, "例: 1000.50"),
        SizedBox(height: 16),
        DateTimePicker(label: "エントリー日時", controller: entriedAtController),
        SizedBox(height: 16),
        DateTimePicker(label: "決済日時", controller: exitedAtController),
        SizedBox(height: 16),
        PriceRangeInput(
          label: "予想価格範囲",
          startController: startPriceController,
          endController: endPriceController,
        ),
        SizedBox(height: 16),
        PriceRangeInput(
          label: "実際の価格範囲",
          startController: startPriceResultController,
          endController: endPriceResultController,
        ),
        SizedBox(height: 24),
        ElevatedButton(
          onPressed: () => _submitForm(context),
          child: Text("追加"),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
          ),
        ),
      ],
    );

    
  }
  

  Widget _buildTextInput(String label, TextEditingController controller, String hint, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
          ),
        ),
      ],
    );
    }

  
}