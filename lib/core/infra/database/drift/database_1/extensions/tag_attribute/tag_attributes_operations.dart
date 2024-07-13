// 新しいタグ属性を追加
import 'package:drift/drift.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/database.dart';


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