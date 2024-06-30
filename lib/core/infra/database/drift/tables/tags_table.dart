import 'package:drift/drift.dart';

class TradeTags extends Table {
  IntColumn get id => integer().autoIncrement()(); 
  //schema 15?
  TextColumn get tagName => text().unique()(); 
  DateTimeColumn get createdAt => dateTime().clientDefault(() => DateTime.now())();
  IntColumn get useCount => integer().withDefault(const Constant(0))();

  //schema 4
  TextColumn get genre => text().clientDefault(() => "分類なし")();
}
