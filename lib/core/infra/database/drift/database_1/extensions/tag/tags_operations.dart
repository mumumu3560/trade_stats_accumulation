import 'package:drift/drift.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/database.dart';


extension TagsOperations on MyDatabase{
  
  // 新しいタグを追加
  Future<int> insertTag(DriftTradeTag tag) {
    return into(driftTradeTags).insert(tag);
  }

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