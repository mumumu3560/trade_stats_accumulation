// トレードデータにタグを追加
import 'package:drift/drift.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/database.dart';

extension TaggedTradeDatasOperations on MyDatabase{

  Future<void> addTagToTradeData(int tradeDataId, int tagId) {
  return into(taggedTradeDatas).insert(
    TaggedTradeDatasCompanion.insert(tradeDataId: tradeDataId, tagId: tagId)
  );
}

// トレードデータからタグを削除
Future<int> removeTagFromTradeData(int tradeDataId, int tagId) {
  return (delete(taggedTradeDatas)
    ..where((ttd) => ttd.tradeDataId.equals(tradeDataId) & ttd.tagId.equals(tagId)))
    .go();
}

// トレードデータに関連するすべてのタグを取得
Future<List<TradeTag>> getTagsForTradeData(int tradeDataId) {
  final query = select(tradeTags).join([
    innerJoin(taggedTradeDatas, taggedTradeDatas.tagId.equalsExp(tradeTags.id))
  ])
  ..where(taggedTradeDatas.tradeDataId.equals(tradeDataId));
  
  return query.map((row) => row.readTable(tradeTags)).get();
}

// 特定のタグを持つすべてのトレードデータを取得
Future<List<TradeData>> getTradeDatasByTag(int tagId) {
  final query = select(tradeDatas).join([
    innerJoin(taggedTradeDatas, taggedTradeDatas.tradeDataId.equalsExp(tradeDatas.id))
  ])
  ..where(taggedTradeDatas.tagId.equals(tagId));
  
  return query.map((row) => row.readTable(tradeDatas)).get();
}

}