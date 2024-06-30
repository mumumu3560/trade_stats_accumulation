import 'package:drift/drift.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/database.dart';


extension TagsOperations on MyDatabase{
  
  // 新しいタグを追加
  Future<int> insertTag(TradeTag tag) {
    return into(tradeTags).insert(tag);
  }

  // タグを更新
  Future<bool> updateTag(TradeTag tag) {
    return update(tradeTags).replace(tag);
  }

  // タグを削除
  Future<int> deleteTag(int id) {
    return (delete(tradeTags)..where((t) => t.id.equals(id))).go();
  }

  Future<TradeTag?> getTagById(int id) {
    return (select(tradeTags)..where((t) => t.id.equals(id))).getSingleOrNull();
  } 

  // すべてのタグを取得
  Future<List<TradeTag>> getAllTags() {
    return select(tradeTags).get();
  }

  // ジャンルごとにタグを取得
  Future<List<TradeTag>> getTagsByGenre(String genre) {
    return (select(tradeTags)..where((t) => t.genre.equals(genre))).get();
  }

  // 名前でタグを検索
  Future<List<TradeTag>> searchTagsByName(String query) {
    return (select(tradeTags)..where((t) => t.tagName.like('%$query%'))).get();
  }
  
}