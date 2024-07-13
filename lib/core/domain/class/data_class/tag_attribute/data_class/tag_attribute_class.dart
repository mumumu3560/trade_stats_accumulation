import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_attribute_class.freezed.dart';

// タグ属性を定義するテーブル
@freezed
class TagAttributeData with _$TagAttributeData {
  const factory TagAttributeData({
    required int id,
    required String name,
    required String dataType, // 'string', 'number', 'boolean'などを想定
  }) = _TagAttributeData;
}