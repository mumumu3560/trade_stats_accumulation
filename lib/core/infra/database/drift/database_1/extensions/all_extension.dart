// 新しいタグ属性を追加
//all_extension.dart
import 'package:drift/drift.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/database.dart';

extension DriftTradingAssetDatasOperations on MyDatabase{
  
  //TODO: ここに関数を追加していく

  //インサート
  Future<int> insertTradingAssetData(DriftTradingAssetData tradingAssetData) async{
    final insertId = await into(driftTradingAssetDatas).insert(
      DriftTradingAssetDatasCompanion(
        name: Value(tradingAssetData.name),
        type: Value(tradingAssetData.type),
      )
    );
    return insertId;
  }

  //アップデート
  Future<void> updateTradingAssetData(Insertable<DriftTradingAssetData> tradingAssetData) {
    return update(driftTradingAssetDatas).replace(tradingAssetData);
  }

  //すべてのトレード商品データを取得
  Future<List<DriftTradingAssetData>> getAllTradingAssetDatas() {
    return select(driftTradingAssetDatas).get();
  }

  //名前で一部一致するトレード商品データを取得
  Future<List<DriftTradingAssetData>> getTradingAssetDatasByName(String name) {
    return (select(driftTradingAssetDatas)..where((tbl) => tbl.name.like('%$name%'))).get();
  }

  //削除
  Future<void> deleteTradingAssetData(Insertable<DriftTradingAssetData> tradingAssetData) {
    return delete(driftTradingAssetDatas).delete(tradingAssetData);
  }

  //タイプが一致するトレード商品データを取得
  Future<List<DriftTradingAssetData>> getTradingAssetDatasByType(String type) {
    return (select(driftTradingAssetDatas)..where((tbl) => tbl.type.equals(type))).get();
  }

  //名前とタイプが一致するトレード商品データを取得
  Future<List<DriftTradingAssetData>> searchTradingAssetDatas({String? name, String? type}) {
    return (select(driftTradingAssetDatas)
      ..where((tbl) {
        var predicates = <Expression<bool>>[];
        if (name != null) predicates.add(tbl.name.like('%$name%'));
        if (type != null) predicates.add(tbl.type.equals(type));
        return predicates.fold<Expression<bool>>(
          const Constant(true),
          (a, b) => a & b,
        );
      }))
      .get();
  }

  //トレード商品の種類を取得
  Future<List<String>> getDistinctTradingAssetTypes() {
    return (selectOnly(driftTradingAssetDatas)
      ..addColumns([driftTradingAssetDatas.type])
      ..groupBy([driftTradingAssetDatas.type]))
      .map((row) => row.read(driftTradingAssetDatas.type)!)
      .get();
  }

  //トレード商品データをページネーションして取得
  Future<List<DriftTradingAssetData>> getPaginatedTradingAssetDatas(int offset, int limit) {
    return (select(driftTradingAssetDatas)
      ..limit(limit, offset: offset))
      .get();
  }






}


extension DriftTradeDatasOperations on MyDatabase{
  
  //TODO: ここに関数を追加していく
  //この関数ではタグに関する処理も行う必要がある


  Future<int> deleteTradeData(int id) {
    return (delete(driftTradeDatas)..where((tbl) => tbl.id.equals(id))).go();
  }

  /*
  Future<bool> updateTradeData(DriftTradeData data) {
    return update(driftTradeDatas).replace(data);
  }
   */


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

  Future<bool> updateTradeData(int id, DriftTradeData data) async {
  return transaction(() async {
    // TradeDataの更新
    final updatedRows = await (update(driftTradeDatas)..where((t) => t.id.equals(id)))
      .write(
        DriftTradeDatasCompanion(
          currencyPair: Value(data.currencyPair),
          title: Value(data.title),
          premise: Value(data.premise),
          pips: Value(data.pips),
          money: Value(data.money),
          lot: Value(data.lot),
          isBuy: Value(data.isBuy),
          urlText: Value(data.urlText),
          updatedAt: Value(DateTime.now()),
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

    if (updatedRows > 0) {
      // 既存のタグ関連を削除
      await (delete(driftTaggedTradeDatas)..where((t) => t.tradeDataId.equals(id))).go();

      // 新しいタグの処理
      if (data.tags != null) {
        for (String tagName in data.tags!) {
          await _insertOrUpdateTag(tagName);
          await _associateTagWithTradeData(id, tagName);
        }
      }

      return true;
    }

    return false;
  });
}


  //ここではタグに関する処理を行う
  //具体的には、タグが存在しない場合は新しいタグを挿入し、存在する場合は使用回数を増やす
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


  //ここではタグとトレードデータを紐づける
  //具体的には、タグのIDを取得し、それを使ってタグ付きトレードデータを挿入する
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
  Future<int> addOrUpdateTagAttribute(String tagName, String attributeName, String dataType) async {
    final existingAttribute = await (select(driftTagAttributes)
      ..where((a) => a.name.equals(attributeName)))
      .getSingleOrNull();

    if (existingAttribute == null) {
      int attributeId = await into(driftTagAttributes).insert(
        DriftTagAttributesCompanion.insert(
          name: attributeName,
          dataType: dataType,
        ),
      );

      return attributeId;


    } else {
      int attributeId = await (update(driftTagAttributes)..where((a) => a.name.equals(attributeName)))
        .write(DriftTagAttributesCompanion(dataType: Value(dataType)));
      
      return attributeId;
    }
  }

  //ジャンルとタグを紐づける





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


extension TaggedTradeDatasOperations on MyDatabase{

  Future<void> addTagToTradeData(int tradeDataId, int tagId) {
  return into(driftTaggedTradeDatas).insert(
    DriftTaggedTradeDatasCompanion.insert(tradeDataId: tradeDataId, tagId: tagId)
  );
}

// トレードデータからタグを削除
Future<int> removeTagFromTradeData(int tradeDataId, int tagId) {
  return (delete(driftTaggedTradeDatas)
    ..where((ttd) => ttd.tradeDataId.equals(tradeDataId) & ttd.tagId.equals(tagId)))
    .go();
}

// トレードデータに関連するすべてのタグを取得
Future<List<DriftTradeTag>> getTagsForTradeData(int tradeDataId) {
  final query = select(driftTradeTags).join([
    innerJoin(driftTaggedTradeDatas, driftTaggedTradeDatas.tagId.equalsExp(driftTradeTags.id))
  ])
  ..where(driftTaggedTradeDatas.tradeDataId.equals(tradeDataId));
  
  return query.map((row) => row.readTable(driftTradeTags)).get();
}

// 特定のタグを持つすべてのトレードデータを取得
Future<List<DriftTradeData>> getTradeDatasByTag(int tagId) {
  final query = select(driftTradeDatas).join([
    innerJoin(driftTaggedTradeDatas, driftTaggedTradeDatas.tradeDataId.equalsExp(driftTradeDatas.id))
  ])
  ..where(driftTaggedTradeDatas.tagId.equals(tagId));
  
  return query.map((row) => row.readTable(driftTradeDatas)).get();
}

}


extension DriftTagAttributesOperations on MyDatabase{
  
  
Future<int> insertDriftTagAttribute(DriftTagAttribute attribute) {
  return into(driftTagAttributes).insert(attribute);
}

// タグ属性を更新
Future<bool> updateDriftTagAttribute(DriftTagAttribute attribute) {
  return update(driftTagAttributes).replace(attribute);
}

// タグ属性を削除
Future<int> deleteDriftTagAttribute(int id) {
  return (delete(driftTagAttributes)..where((ta) => ta.id.equals(id))).go();
}

// タグに属性値を設定
Future<void> setDriftTagAttributeValue(int tagId, int attributeId, String value) {
  return into(driftTagAttributeValues).insert(
    DriftTagAttributeValuesCompanion.insert(
      tagId: tagId,
      attributeId: attributeId,
      value: value,
    ),
    mode: InsertMode.insertOrReplace,
  );
}

// タグの属性値を取得
Future<List<DriftTagAttributeValue>> getDriftTagAttributeValues(int tagId) {
  return (select(driftTagAttributeValues)..where((tav) => tav.tagId.equals(tagId))).get();
}
  
}

extension TagsOperations on MyDatabase{
  
  // 新しいタグを追加
  Future<int> insertTag(DriftTradeTag tag) async{
    final insertedId = await into(driftTradeTags).insert(
      DriftTradeTagsCompanion.insert(
        tagName: tag.tagName,
        genre: Value(tag.genre),
        createdAt: Value(tag.createdAt),
        useCount: Value(tag.useCount),
      ),
    );

    return insertedId;
  }

  /*
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
          startPrice: Value(data.startPrice),
          endPrice: Value(data.endPrice),
          startPriceResult: Value(data.startPriceResult),
          endPriceResult: Value(data.endPriceResult),
          entriedAt: Value(data.entriedAt),
          exitedAt: Value(data.exitedAt),
          
        ),
      );
   */

  // タグを更新
  Future<bool> updateTag(DriftTradeTag tag) {
    return update(driftTradeTags).replace(tag);
  }

  // タグを削除
  Future<int> deleteTag(int id) {
    return (delete(driftTradeTags)..where((t) => t.id.equals(id))).go();
  }

  Future<DriftTradeTag?> getTagById(int id) {
    return (select(driftTradeTags)..where((t) => t.id.equals(id))).getSingleOrNull();
  } 

  // すべてのタグを取得
  Future<List<DriftTradeTag>> getAllTags() {
    return select(driftTradeTags).get();
  }

  // ジャンルごとにタグを取得
  Future<List<DriftTradeTag>> getTagsByGenre(String genre) {
    return (select(driftTradeTags)..where((t) => t.genre.equals(genre))).get();
  }

  // 名前でタグを検索
  Future<List<DriftTradeTag>> searchTagsByName(String query) {
    return (select(driftTradeTags)..where((t) => t.tagName.like('%$query%'))).get();
  }

  // ユニークなジャンルのリストを取得
  Future<List<String>> getDistinctGenres() {
    return (selectOnly(driftTradeTags)
      ..addColumns([driftTradeTags.genre])
      ..groupBy([driftTradeTags.genre]))
      .map((row) => row.read(driftTradeTags.genre)!)
      .get();
  }
  
  /*
  // タグの使用回数を増やす
  Future<void> incrementTagUseCount(int tagId) {
    return (update(driftTradeTags)..where((t) => t.id.equals(tagId)))
      .write(DriftTradeTagsCompanion(useCount: Variable.increment(1)));
  }
   */

  Future<DriftTradeTag?> getTagByNormalizedName(String normalizedName) {
  return (select(driftTradeTags)
    ..where((t) => t.tagName.lower().equals(normalizedName)))
    .getSingleOrNull();
}
  
}

extension SettingsOperations on MyDatabase{

  Future<int> insertTheme() async{
    return into(driftSettings).insert(
      const DriftSettingsCompanion(
        themeMode: Value(1),
      )
    );
  }

Future<int?> getTheme() async {
  try {
    // settingsテーブルからIDが0のレコードを取得
    final themeMode = await (select(driftSettings)..where((s) => s.id.equals(0))).getSingleOrNull();
    // themeModeがnullの場合、デフォルト値として1を返す
    if (themeMode == null) {

      
      return null;
    }
    // themeModeがnullではない場合、その値を返す
    return themeMode.themeMode ?? 1; // themeModeがnullでなければその値、そうでなければ1を返す
  } catch (e) {
    return 0;
  }
}



  Future<int> updateTheme(int themeMode) async{
    return (update(driftSettings)..where((s) => s.id.equals(0))).write(
      DriftSettingsCompanion(
        themeMode: Value(themeMode),
      ),
    );
  }


}