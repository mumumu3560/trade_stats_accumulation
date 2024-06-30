//tagとtradeDataとの関係のため。
import 'package:drift/drift.dart';

class TaggedTradeDatas extends Table {
  IntColumn get tradeDataId => integer().customConstraint('REFERENCES trade_datas(id) ON DELETE CASCADE')();
  IntColumn get tagId => integer().customConstraint('REFERENCES tags(id) ON DELETE CASCADE')();

  @override
  Set<Column> get primaryKey => {tradeDataId, tagId};
}
