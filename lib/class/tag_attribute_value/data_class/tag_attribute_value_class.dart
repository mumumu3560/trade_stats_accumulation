import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_attribute_value_class.freezed.dart';

// タグの属性値を定義するテーブル

@freezed
class TagAttributeValue with _$TagAttributeValue {
  const factory TagAttributeValue({
    required int tagId,
    required int attributeId,
    required String value,
  }) = _TagAttributeValue;
}