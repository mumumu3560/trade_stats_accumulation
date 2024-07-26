import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trade_stats_accumulation/core/domain/class/data_class/trade_data/data_class/trade_data_class.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/database.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/extensions/all_extension.dart';
import 'package:trade_stats_accumulation/features/pages/detail_page/detail_page.dart';
import 'package:trade_stats_accumulation/features/pages/edit_page/components/image_selector/ui/image_selector.dart';
import 'asset_selector/ui/asset_selector.dart';
import 'entry_type_selector/ui/entry_type_selector.dart';
import 'tag_selector/ui/tag_selector.dart';
import 'date_time_picker/ui/date_time_picker.dart';
import 'price_range_input/ui/price_range_input.dart';

class TradeForm extends HookConsumerWidget {
  final MyDatabase dbAdmin;
  final TradeData tradeData;

  const TradeForm({
    Key? key,
    required this.dbAdmin,
    required this.tradeData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedAsset = useState<DriftTradingAssetData?>(
      tradeData.currencyPair.isNotEmpty 
        ? DriftTradingAssetData(id: tradeData.id, name: tradeData.currencyPair, type: '')
        : null
    );
    final isBuy = useState(tradeData.isBuy);
    final selectedTags = useState<List<DriftTradeTag>>(
      tradeData.tags?.map((tagName) => DriftTradeTag(
        id: 0,
        tagName: tagName,
        useCount: 0,
        genre: '',
        createdAt: DateTime.now(),
      )).toList() ?? []
    );
    
    final premiseController = useTextEditingController(text: tradeData.premise);
    final urlController = useTextEditingController(text: tradeData.urlText);
    final lotController = useTextEditingController(text: tradeData.lot.toString());
    final entryPriceController = useTextEditingController(text: tradeData.entryPrice?.toString());
    final exitPriceController = useTextEditingController(text: tradeData.exitPrice?.toString());
    final startPriceController = useTextEditingController(text: tradeData.startPrice?.toString());
    final endPriceController = useTextEditingController(text: tradeData.endPrice?.toString());
    final startPriceResultController = useTextEditingController(text: tradeData.startPriceResult?.toString());
    final endPriceResultController = useTextEditingController(text: tradeData.endPriceResult?.toString());
    final entriedAtController = useTextEditingController(text: tradeData.entriedAt?.toString());
    final exitedAtController = useTextEditingController(text: tradeData.exitedAt?.toString());
    final pipsController = useTextEditingController(text: tradeData.pips?.toString());
    final moneyController = useTextEditingController(text: tradeData.money?.toString());
    final allTags = useState<List<DriftTradeTag>>([]);
    
    final imagePathBeforeController = useTextEditingController(text: tradeData.imagePathBefore);
    final imagePathAfterController = useTextEditingController(text: tradeData.imagePathAfter);

    useEffect(() {
      dbAdmin.getAllTags().then((value) => allTags.value = value);
      return null;
    }, []);

    Future<void> _submitForm(BuildContext context) async {
      if (selectedAsset.value == null || lotController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("必須項目を入力してください")),
        );
        return;
      }
      
      final updatedTradeData = DriftTradeData(
        id: tradeData.id,
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
        createdAt: tradeData.createdAt,
        urlText: urlController.text,
        imagePathBefore: imagePathBeforeController.text,
        imagePathAfter: imagePathAfterController.text,
        entriedAt: DateTime.tryParse(entriedAtController.text),
        exitedAt: DateTime.tryParse(exitedAtController.text),
        pips: pipsController.text.isNotEmpty ? int.tryParse(pipsController.text) : null,
        money: moneyController.text.isNotEmpty ? double.tryParse(moneyController.text) : null,
        title: tradeData.title,
      );

      try {
        final success = await dbAdmin.updateTradeData(tradeData.id, updatedTradeData);
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("データが正常に更新されました。")),
          );

          if(context.mounted){
            Navigator.of(context).pop();
          }

          if(context.mounted){
            Navigator.of(context).pop();
          }

          if(context.mounted){

            final newTradeData = TradeData(
              id: updatedTradeData.id,
              currencyPair: updatedTradeData.currencyPair ?? '',
              premise: updatedTradeData.premise,
              isBuy: updatedTradeData.isBuy,
              lot: updatedTradeData.lot ?? 0,
              tags: updatedTradeData.tags,
              entryPrice: updatedTradeData.entryPrice,
              exitPrice: updatedTradeData.exitPrice,
              startPrice: updatedTradeData.startPrice,
              endPrice: updatedTradeData.endPrice,
              startPriceResult: updatedTradeData.startPriceResult,
              endPriceResult: updatedTradeData.endPriceResult,
              updatedAt: updatedTradeData.updatedAt,
              createdAt: updatedTradeData.createdAt,
              urlText: updatedTradeData.urlText,
              imagePathBefore: updatedTradeData.imagePathBefore,
              imagePathAfter: updatedTradeData.imagePathAfter,
              entriedAt: updatedTradeData.entriedAt,
              exitedAt: updatedTradeData.exitedAt,
              pips: updatedTradeData.pips,
              money: updatedTradeData.money,
              title: updatedTradeData.title,
            
            );
            
            //ページ遷移のために使う
          Navigator.of(context).push(


            /*
            
             */
            MaterialPageRoute(
              builder: (context) => DetailPage(
                tradeData: newTradeData,
              ),
            ),
          );




          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("データの更新に失敗しました")),
          );
        }
      } catch (e) {
        print("Error updating trade data: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("エラーが発生しました: $e")),
        );
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AssetSelector(
          onAssetSelected: (asset) {
            selectedAsset.value = asset;
          },
          initialAsset: selectedAsset.value,
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
          child: Text("更新"),
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
