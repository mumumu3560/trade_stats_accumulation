import 'package:drift/drift.dart';
import 'package:trade_stats_accumulation/database/drift/database_1/database.dart';


extension TagsOperations on MyDatabase{
  
  // 新しいタグを追加
  Future<int> insertTag(TagsCompanion tag) {
    return into(tags).insert(tag);
  }

  // タグを更新
  Future<bool> updateTag(TagsCompanion tag) {
    return update(tags).replace(tag);
  }

  // タグを削除
  Future<int> deleteTag(int id) {
    return (delete(tags)..where((t) => t.id.equals(id))).go();
  }

  // すべてのタグを取得
  Future<List<Tag>> getAllTags() {
    return select(tags).get();
  }

  // ジャンルごとにタグを取得
  Future<List<Tag>> getTagsByGenre(String genre) {
    return (select(tags)..where((t) => t.genre.equals(genre))).get();
  }

  // 名前でタグを検索
  Future<List<Tag>> searchTagsByName(String query) {
    return (select(tags)..where((t) => t.tagName.like('%$query%'))).get();
  }
  
}