

import 'package:drift/drift.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/database.dart';

extension DriftTradeDatasOperations on MyDatabase{
  
  //TODO: ここに関数を追加していく
  //この関数ではタグに関する処理も行う必要がある


  Future<int> deleteTradeData(int id) {
    return (delete(driftTradeDatas)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<bool> updateTradeData(DriftTradeData data) {
    return update(driftTradeDatas).replace(data);
  }


  Future<DriftTradeData?> getTradeDataById(int id) {
    return (select(driftTradeDatas)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  Stream<List<DriftTradeData>> watchAllTradeDatas() {
    return select(driftTradeDatas).watch();
  }

  Future<List<DriftTradeData>> getAllDriftTradeDatas() {
    return select(driftTradeDatas).get();
  }

  Stream<List<DriftTradeData>> watchDriftTradeDatasByCurrencyPair(String currencyPair) {
    return (select(driftTradeDatas)..where((tbl) => tbl.currencyPair.equals(currencyPair))).watch();
  }

  Future<List<DriftTradeData>> getDriftTradeDatasByCurrencyPair(String currencyPair) {
    return (select(driftTradeDatas)..where((tbl) => tbl.currencyPair.equals(currencyPair))).get();
  }


  Future<List<DriftTradeData>> getFilteredDriftTradeDatas({
    String? currencyPair,
    List<String>? tags,
    bool useAndForTags = false,
    String? premise,
    bool? isBuy,
    DateTime? startDate,
    DateTime? endDate,
  }) {
  return (select(driftTradeDatas)
    ..where((tbl) {
      var predicates = <Expression<bool>>[];
      
      if (currencyPair != null) {
        predicates.add(tbl.currencyPair.equals(currencyPair));
      }
      
      if (premise != null) {
        predicates.add(tbl.premise.equals(premise));
      }
      
      if (isBuy != null) {
        predicates.add(tbl.isBuy.equals(isBuy));
      }
      
      if (tags != null && tags.isNotEmpty) {
        final tagConditions = tags.map((tag) => 
          tbl.tags.like('%"$tag"%')
        ).toList();
        
        if (useAndForTags) {
          predicates.add(tagConditions.reduce((value, element) => value & element));
        } else {
          predicates.add(tagConditions.reduce((value, element) => value | element));
        }
      }
      
      if (startDate != null) {
        predicates.add(tbl.createdAt.isBiggerOrEqualValue(startDate));
      }
      
      if (endDate != null) {
        predicates.add(tbl.createdAt.isSmallerOrEqualValue(endDate));
      }
      
      return predicates.isEmpty 
        ? const Constant(true) 
        : predicates.reduce((value, element) => value & element);
    }))
    .get();
}




Future<Map<String, dynamic>> getTradeStatsInDateRange(DateTime start, DateTime end) async {
  final query = select(driftTradeDatas)
    ..where((tbl) => tbl.createdAt.isBetween(Variable(start), Variable(end)));

  final results = await query.get();

  int totalTrades = results.length;
  int winningTrades = results.where((trade) => trade.pips != null && trade.pips! > 0).length;
  int losingTrades = results.where((trade) => trade.pips != null && trade.pips! < 0).length;
  double totalPips = results.fold(0, (sum, trade) => sum + (trade.pips ?? 0));
  double totalMoney = results.fold(0, (sum, trade) => sum + (trade.money ?? 0));

  return {
    'totalTrades': totalTrades,
    'winningTrades': winningTrades,
    'losingTrades': losingTrades,
    'winRate': totalTrades > 0 ? winningTrades / totalTrades : 0,
    'totalPips': totalPips,
    'totalMoney': totalMoney,
    'averagePipsPerTrade': totalTrades > 0 ? totalPips / totalTrades : 0,
    'averageMoneyPerTrade': totalTrades > 0 ? totalMoney / totalTrades : 0,
  };
}


  Future<int> insertTradeData(DriftTradeData data) async {
    return transaction(() async {
      // TradeDataの挿入
      final insertedId = await into(driftTradeDatas).insert(
        DriftTradeDatasCompanion.insert(
          currencyPair: Value(data.currencyPair),
          title: Value(data.title),
          premise: Value(data.premise),
          pips: Value(data.pips),
          money: Value(data.money),
          lot: Value(data.lot),
          isBuy: data.isBuy,
          urlText: Value(data.urlText),
          createdAt: Value(data.createdAt),
          updatedAt: Value(data.updatedAt),
          tags: Value(data.tags),
          imagePathBefore: Value(data.imagePathBefore),
          imagePathAfter: Value(data.imagePathAfter),
          entryPrice: Value(data.entryPrice),
          exitPrice: Value(data.exitPrice),
          startPrice: Value(data.startPrice),
          endPrice: Value(data.endPrice),
          startPriceResult: Value(data.startPriceResult),
          endPriceResult: Value(data.endPriceResult),
          entriedAt: Value(data.entriedAt),
          exitedAt: Value(data.exitedAt),
          
        ),
      );

      // タグの処理
      if (data.tags != null) {
        for (String tagName in data.tags!) {
          await _insertOrUpdateTag(tagName);
          await _associateTagWithTradeData(insertedId, tagName);
        }
      }

      return insertedId;
    });
  }


  Future<void> _insertOrUpdateTag(String tagName, {String genre = "分類なし"}) async {
    final existingTag = await (select(driftTradeTags)..where((t) => t.tagName.equals(tagName))).getSingleOrNull();
    
    if (existingTag == null) {
      // 新しいタグを挿入
      await into(driftTradeTags).insert(
        DriftTradeTagsCompanion.insert(
          tagName: tagName,
          useCount: const Value(1),
          genre: Value(genre),
        ),
      );
    } else {
      // 既存のタグの使用回数を増やす
      await (update(driftTradeTags)..where((t) => t.id.equals(existingTag.id)))
        .write(DriftTradeTagsCompanion(useCount: Value(existingTag.useCount + 1)));
    }
  }



  Future<void> _associateTagWithTradeData(int tradeDataId, String tagName) async {
    final tag = await (select(driftTradeTags)..where((t) => t.tagName.equals(tagName))).getSingle();
    
    await into(driftTaggedTradeDatas).insert(
      DriftTaggedTradeDatasCompanion.insert(
        tradeDataId: tradeDataId,
        tagId: tag.id,
      ),
    );
  }



  // タグ属性を追加または更新する関数
  Future<void> addOrUpdateTagAttribute(String tagName, String attributeName, String dataType) async {
    final existingAttribute = await (select(driftTagAttributes)
      ..where((a) => a.name.equals(attributeName)))
      .getSingleOrNull();

    if (existingAttribute == null) {
      await into(driftTagAttributes).insert(
        DriftTagAttributesCompanion.insert(
          name: attributeName,
          dataType: dataType,
        ),
      );
    } else {
      await (update(driftTagAttributes)..where((a) => a.name.equals(attributeName)))
        .write(DriftTagAttributesCompanion(dataType: Value(dataType)));
    }
  }





  // ジャンルでタグを検索する関数
  Future<List<DriftTradeTag>> getTagsByGenre(String genre) async {
    return (select(driftTradeTags)..where((t) => t.genre.equals(genre))).get();
  }


  // すべてのタグとそのジャンルを取得する関数
  Future<List<DriftTradeTag>> getAllTagsWithGenres() async {
    return select(driftTradeTags).get();
  }



  // トレードデータに関連付けられたタグを取得する関数
  Future<List<DriftTradeTag>> getTagsForTradeData(int tradeDataId) async {
    final query = select(driftTradeTags).join([
      innerJoin(driftTaggedTradeDatas, driftTaggedTradeDatas.tagId.equalsExp(driftTradeTags.id)),
    ])..where(driftTaggedTradeDatas.tradeDataId.equals(tradeDataId));

    final results = await query.get();
    return results.map((row) => row.readTable(driftTradeTags)).toList();
  }



}