//テーブルの設定を保存しておく
import 'package:drift/drift.dart';

class Settings extends Table {
  IntColumn get id => integer().unique().clientDefault(() => 0 ) ();
  //IntColumn get id => integer().autoIncrement()();
  IntColumn get themeMode => integer().nullable()();
  TextColumn get databaseName => text().clientDefault(() => "データベース1")();

}
