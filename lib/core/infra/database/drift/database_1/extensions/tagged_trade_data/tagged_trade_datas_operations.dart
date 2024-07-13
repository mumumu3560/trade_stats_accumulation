// トレードデータにタグを追加
import 'package:drift/drift.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/database.dart';

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