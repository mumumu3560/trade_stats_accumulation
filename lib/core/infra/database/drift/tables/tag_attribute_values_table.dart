// 各タグの属性値を保存するテーブル
import 'package:drift/drift.dart';

class TagAttributeValues extends Table {
  //IntColumn get id => integer().autoIncrement()();
  IntColumn get tagId => integer().customConstraint('REFERENCES tags(id) ON DELETE CASCADE')();
  IntColumn get attributeId => integer().customConstraint('REFERENCES tag_attributes(id) ON DELETE CASCADE')();
  TextColumn get value => text()(); // すべての値を文字列として保存し、必要に応じて変換

  @override
  Set<Column> get primaryKey => {tagId, attributeId};
}
