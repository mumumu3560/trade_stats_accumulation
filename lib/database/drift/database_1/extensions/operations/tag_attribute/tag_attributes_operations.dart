// 新しいタグ属性を追加
import 'package:drift/drift.dart';
import 'package:trade_stats_accumulation/database/drift/database_1/database.dart';


extension TagAttributesOperations on MyDatabase{
  
  
Future<int> insertTagAttribute(TagAttributesCompanion attribute) {
  return into(tagAttributes).insert(attribute);
}

// タグ属性を更新
Future<bool> updateTagAttribute(TagAttributesCompanion attribute) {
  return update(tagAttributes).replace(attribute);
}

// タグ属性を削除
Future<int> deleteTagAttribute(int id) {
  return (delete(tagAttributes)..where((ta) => ta.id.equals(id))).go();
}

// タグに属性値を設定
Future<void> setTagAttributeValue(int tagId, int attributeId, String value) {
  return into(tagAttributeValues).insert(
    TagAttributeValuesCompanion.insert(
      tagId: tagId,
      attributeId: attributeId,
      value: value,
    ),
    mode: InsertMode.insertOrReplace,
  );
}

// タグの属性値を取得
Future<List<TagAttributeValue>> getTagAttributeValues(int tagId) {
  return (select(tagAttributeValues)..where((tav) => tav.tagId.equals(tagId))).get();
}
  
}