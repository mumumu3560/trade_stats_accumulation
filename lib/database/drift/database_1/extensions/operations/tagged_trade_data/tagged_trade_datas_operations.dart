// トレードデータにタグを追加
import 'package:drift/drift.dart';
import 'package:trade_stats_accumulation/database/drift/database_1/database.dart';

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
Future<List<Tag>> getTagsForTradeData(int tradeDataId) {
  final query = select(tags).join([
    innerJoin(taggedTradeDatas, taggedTradeDatas.tagId.equalsExp(tags.id))
  ])
  ..where(taggedTradeDatas.tradeDataId.equals(tradeDataId));
  
  return query.map((row) => row.readTable(tags)).get();
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