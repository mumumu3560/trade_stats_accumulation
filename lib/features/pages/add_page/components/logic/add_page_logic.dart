import 'package:flutter/material.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/database.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/extensions/extensions_importer.dart';

Future<void> addTrade(
  DriftTradingAssetData? selectedAsset,
  TextEditingController lotController,
  TextEditingController premiseController,
  bool isBuy,
  List<DriftTradeTag> selectedTags,
  TextEditingController startPriceController,
  TextEditingController endPriceController,
  TextEditingController startPriceResultController,
  TextEditingController endPriceResultController,
  TextEditingController entriedAtController,
  TextEditingController exitedAtController,
  TextEditingController pipsController,
  TextEditingController moneyController,
  MyDatabase dbAdmin,
) async {
  if (selectedAsset == null || lotController.text.isEmpty || premiseController.text.isEmpty) {
    // 必須項目が未入力の場合、エラーメッセージを表示する
    return;
  }

  final newTrade = DriftTradeData(
    id: 0,
    lot: double.parse(lotController.text),
    premise: premiseController.text,
    isBuy: isBuy,
    startPrice: double.tryParse(startPriceController.text),
    endPrice: double.tryParse(endPriceController.text),
    startPriceResult: double.tryParse(startPriceResultController.text),
    endPriceResult: double.tryParse(endPriceResultController.text),
    entriedAt: DateTime.parse(entriedAtController.text),
    exitedAt: DateTime.parse(exitedAtController.text),
    pips: int.tryParse(pipsController.text),
    money: double.tryParse(moneyController.text),
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  final id = await dbAdmin.insertTradeData(newTrade);


  /*
  
   */
  for (var tag in selectedTags) {
    await dbAdmin.addTagToTradeData(id, tag.id);
  }
}
