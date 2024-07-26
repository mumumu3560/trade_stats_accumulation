

import 'package:trade_stats_accumulation/core/domain/class/data_class/tag_attribute/data_class/tag_attribute_class.dart';
import 'package:trade_stats_accumulation/core/domain/class/data_class/tag_attribute_value/data_class/tag_attribute_value_class.dart';

abstract class TagAttributeRepository {
  // タグ属性を追加
  Future<int> insertTagAttribute(TagAttributeData attribute);

  // タグ属性を更新
  Future<bool> updateTagAttribute(TagAttributeData attribute);

  // タグ属性を削除
  Future<int> deleteTagAttribute(int id);

  // タグに属性値を設定
  Future<void> setTagAttributeValue(int tagId, int attributeId, String value);

  // タグの属性値を取得
  Future<List<TagAttributeValueData>> getTagAttributeValues(int tagId);
}
