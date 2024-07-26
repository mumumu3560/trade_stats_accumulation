//trade_form.dartファイルの内容

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/database.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/extensions/all_extension.dart';
import 'package:trade_stats_accumulation/features/pages/add_page/components/asset_selector/ui/asset_selector.dart';
import 'package:trade_stats_accumulation/features/pages/add_page/components/date_time_picker/ui/date_time_picker.dart';
import 'package:trade_stats_accumulation/features/pages/add_page/components/image_selector/ui/image_selector.dart';
import 'package:trade_stats_accumulation/features/pages/add_page/components/price_range_input/ui/price_range_input.dart';
import 'package:trade_stats_accumulation/features/pages/add_page/components/tag_selector/ui/tag_selector.dart';
import 'package:trade_stats_accumulation/features/pages/edit_page/components/entry_type_selector/ui/entry_type_selector.dart';
import 'package:trade_stats_accumulation/utils/image_select.dart';

class TradeForm extends HookConsumerWidget {
  final MyDatabase dbAdmin;

  const TradeForm({
    Key? key,
    required this.dbAdmin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedAsset = useState<DriftTradingAssetData?>(null);
    final isBuy = useState(true);
    final selectedTags = useState<List<DriftTradeTag>>([]);
    
    final premiseController = useTextEditingController();
    final urlController = useTextEditingController();
    final lotController = useTextEditingController();
    final entryPriceController = useTextEditingController();
    final exitPriceController = useTextEditingController();
    final startPriceController = useTextEditingController();
    final endPriceController = useTextEditingController();
    final startPriceResultController = useTextEditingController();
    final endPriceResultController = useTextEditingController();
    final entriedAtController = useTextEditingController();
    final exitedAtController = useTextEditingController();
    final pipsController = useTextEditingController();
    final moneyController = useTextEditingController();
    final allTags = useState<List<DriftTradeTag>>([]);
    
    final imagePathBeforeController = useTextEditingController();
    final imagePathAfterController = useTextEditingController();

    useEffect(() {
      dbAdmin.getAllTags().then((value) => allTags.value = value);
      return null;
    }, []);


    void _submitForm(BuildContext context) {
      if (
        selectedAsset.value == null 
        || lotController.text.isEmpty 
        || entryPriceController.text.isEmpty
        || startPriceController.text.isEmpty
        || endPriceController.text.isEmpty
        || entriedAtController.text.isEmpty
      ) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("必須項目を入力してください")),
        );
        return;
      }
      print("${entryPriceController.text}+ここがエントリー");
      
      final tradeData = DriftTradeData(
        //idはインサートするときに決める(自動インクリメント)のでここは何の値でも良い
        id: 0,
        currencyPair: selectedAsset.value!.name ?? '',
        premise: premiseController.text,
        
        isBuy: isBuy.value,
        lot: double.tryParse(lotController.text) ?? 0,
        tags: selectedTags.value.map((tag) => tag.tagName).toList(),
        entryPrice: double.tryParse(entryPriceController.text),
        exitPrice: double.tryParse(exitPriceController.text),
        startPrice: double.tryParse(startPriceController.text),
        endPrice: double.tryParse(endPriceController.text),
        startPriceResult: double.tryParse(startPriceResultController.text),
        endPriceResult: double.tryParse(endPriceResultController.text),
        updatedAt: DateTime.now(),
        createdAt: DateTime.now(),

        //urlはいつ決めるか検討中いらないかもしれない
        imagePathBefore: imagePathBeforeController.text,
        imagePathAfter: imagePathAfterController.text,
        urlText: urlController.text,
        entriedAt: DateTime.tryParse(entriedAtController.text),
        exitedAt: DateTime.tryParse(exitedAtController.text),
        pips: pipsController.text.isNotEmpty ? int.tryParse(pipsController.text) : null,
        money: moneyController.text.isNotEmpty ? double.tryParse(moneyController.text) : null,
      );

      print("${tradeData}ここでエントリー");
      
      dbAdmin.insertTradeData(tradeData).then((_) {
        // タグの使用回数を更新これいらないか？
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
          onAssetSelected: (asset) {
            selectedAsset.value = asset;
          },
        ),
        SizedBox(height: 16),
        EntryTypeSelector(isBuy: isBuy),
        SizedBox(height: 16),
        _buildTextInput("Lot*", lotController, "例: 0.01"),
        SizedBox(height: 16),
        _buildTextInput("メモ", premiseController, "エントリーの理由や市場状況など", maxLines: 3),
        SizedBox(height: 16),

        _buildTextInput("参考URL", urlController, "例: https://www.google.com"),
        SizedBox(height: 16),

        TagSelector(
          selectedTags: selectedTags.value,
          onTagSelected: (tag) {
            selectedTags.value = [...selectedTags.value, tag];
          },
          onTagDeselected: (tag) {
            selectedTags.value = selectedTags.value.where((t) => t != tag).toList();
          },

        ),

        SizedBox(height: 16),

        ImageSelector(
          imagePathController: imagePathBeforeController,
          label: "エントリー前の画像",
        ),

        SizedBox(height: 16),

        ImageSelector(
          imagePathController: imagePathAfterController,
          label: "エントリー後の画像",
        ),



        SizedBox(height: 16),
        _buildTextInput("Pips", pipsController, "例: 10"),
        SizedBox(height: 16),
        _buildTextInput("損益 (円)", moneyController, "例: 1000.50"),
        SizedBox(height: 16),
        DateTimePicker(label: "エントリー日時*", controller: entriedAtController),
        SizedBox(height: 16),
        DateTimePicker(label: "決済日時", controller: exitedAtController),
        SizedBox(height: 16),
        PriceRangeInput(
          label: "予想SL価格+エントリー価格*",
          entryOrExitController: entryPriceController,
          startController: startPriceController,
          endController: endPriceController,
          isEntry: true,
        ),
        SizedBox(height: 16),
        PriceRangeInput(
          label: "実際のSL価格+決済価格",
          entryOrExitController: exitPriceController,
          startController: startPriceResultController,
          endController: endPriceResultController,
          isEntry: false,
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