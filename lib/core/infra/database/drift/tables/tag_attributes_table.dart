// タグ属性を定義するテーブル
import 'package:drift/drift.dart';

class DriftTagAttributes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique()();
  TextColumn get dataType => text()(); // 'string', 'number', 'boolean'などを想定
}
