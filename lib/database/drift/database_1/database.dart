import 'dart:io';
import 'package:trade_stats_accumulation/database/drift/type_converter.dart';
import 'package:trade_stats_accumulation/utils/various.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';


part 'database.g.dart'; 




class TradeDatas extends Table {
  IntColumn get id => integer().autoIncrement()();

  //どの通貨ペアか
  TextColumn get currencyPair => text().nullable()();

  //概要
  TextColumn get title => text().nullable()();

  //前提
  TextColumn get premise => text().nullable()();

  //何pips勝ったかをintで保存する
  IntColumn get pips => integer().nullable()();

  //何円勝ったかをfloatで保存する
  RealColumn get money => real().nullable()();

  //取引数量
  RealColumn get lot => real().nullable()();

  //買いか売りか
  BoolColumn get isBuy => boolean()();
  

  // urlTextカラムに.unique()を追加して、この値がユニークであることを保証する
  //urlは例えばtradingviewのurlを保存するためのもの
  TextColumn get urlText => text().unique()();
  
  DateTimeColumn get createdAt => dateTime().clientDefault(() => DateTime.now())();
  DateTimeColumn get updatedAt => dateTime().clientDefault(() => DateTime.now())();

  // TagListConverterを使用してタグリストを保存する
  TextColumn get tags => text().map(const TagListConverter()).nullable()();

  // 画像のパス用のカラムを追加 
  TextColumn get imagePathBefore => text().nullable()();

  // 画像のパス用のカラムを追加
  TextColumn get imagePathAfter => text().nullable()();

  //予想の開始地点
  RealColumn get startPrice => real().nullable()();

  //予想の終了地点
  RealColumn get endPrice => real().nullable()();

  //結果の開始地点
  RealColumn get startPriceResult => real().nullable()();


  //結果の終了地点
  RealColumn get endPriceResult => real().nullable()();

}









class Tags extends Table {
  IntColumn get id => integer().autoIncrement()(); 
  //schema 15?
  TextColumn get tagName => text().unique()(); 
  DateTimeColumn get createdAt => dateTime().clientDefault(() => DateTime.now())();
  IntColumn get useCount => integer().withDefault(const Constant(0))();

  //schema 4
  TextColumn get genre => text().clientDefault(() => "分類なし")();
}








//tagとtradeDataとの関係のため。
class TaggedTradeDatas extends Table {
  IntColumn get tradeDataId => integer().customConstraint('REFERENCES trade_datas(id) ON DELETE CASCADE')();
  IntColumn get tagId => integer().customConstraint('REFERENCES tags(id) ON DELETE CASCADE')();

  @override
  Set<Column> get primaryKey => {tradeDataId, tagId};
}







// タグ属性を定義するテーブル
class TagAttributes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique()();
  TextColumn get dataType => text()(); // 'string', 'number', 'boolean'などを想定
}

// 各タグの属性値を保存するテーブル
class TagAttributeValues extends Table {
  //IntColumn get id => integer().autoIncrement()();
  IntColumn get tagId => integer().customConstraint('REFERENCES tags(id) ON DELETE CASCADE')();
  IntColumn get attributeId => integer().customConstraint('REFERENCES tag_attributes(id) ON DELETE CASCADE')();
  TextColumn get value => text()(); // すべての値を文字列として保存し、必要に応じて変換

  @override
  Set<Column> get primaryKey => {tagId, attributeId};
}








//テーブルの設定を保存しておく
class Settings extends Table {
  IntColumn get id => integer().unique().clientDefault(() => 0 ) ();
  //IntColumn get id => integer().autoIncrement()();
  IntColumn get themeMode => integer().nullable()();
  TextColumn get databaseName => text().clientDefault(() => "データベース1")();

}



















































// 両方のテーブルを含める
@DriftDatabase(tables: [TradeDatas, Tags, TaggedTradeDatas, TagAttributes, TagAttributeValues,Settings])
class MyDatabase extends _$MyDatabase {
  final String dbName;
  MyDatabase({required this.dbName}) : super(_openConnection(dbName));
  @override
  int get schemaVersion => 1;


  @override
 MigrationStrategy get migration {
   return MigrationStrategy(
     onCreate: (Migrator m) async {
       await m.createAll();
     },


     onUpgrade: (Migrator m, int from, int to) async {
       
     },


   );
 }



  //TODO TradeDatasに関して

  /*
  Future<int> insertTradeData(TradeDatasCompanion data) {
    return into(tradeDatas).insert(data);
  }

  Future<int> deleteTradeData(int id) {
    return (delete(tradeDatas)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<bool> updateTradeData(TradeDatasCompanion data) {
    return update(tradeDatas).replace(data);
  }


  Future<TradeData?> getTradeDataById(int id) {
    return (select(tradeDatas)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  Stream<List<TradeData>> watchAllTradeDatas() {
    return select(tradeDatas).watch();
  }

  Future<List<TradeData>> getAllTradeDatas() {
    return select(tradeDatas).get();
  }

  Stream<List<TradeData>> watchTradeDatasByCurrencyPair(String currencyPair) {
    return (select(tradeDatas)..where((tbl) => tbl.currencyPair.equals(currencyPair))).watch();
  }

  Future<List<TradeData>> getTradeDatasByCurrencyPair(String currencyPair) {
    return (select(tradeDatas)..where((tbl) => tbl.currencyPair.equals(currencyPair))).get();
  }


  Future<List<TradeData>> getFilteredTradeDatas({
  String? currencyPair,
  List<String>? tags,
  bool useAndForTags = false,
  String? premise,
  bool? isBuy,
  DateTime? startDate,
  DateTime? endDate,
}) {
  return (select(tradeDatas)
    ..where((tbl) {
      var predicates = <Expression<bool>>[];
      
      if (currencyPair != null) {
        predicates.add(tbl.currencyPair.equals(currencyPair));
      }
      
      if (premise != null) {
        predicates.add(tbl.premise.equals(premise));
      }
      
      if (isBuy != null) {
        predicates.add(tbl.isBuy.equals(isBuy));
      }
      
      if (tags != null && tags.isNotEmpty) {
        final tagConditions = tags.map((tag) => 
          tbl.tags.like('%"$tag"%')
        ).toList();
        
        if (useAndForTags) {
          predicates.add(tagConditions.reduce((value, element) => value & element));
        } else {
          predicates.add(tagConditions.reduce((value, element) => value | element));
        }
      }
      
      if (startDate != null) {
        predicates.add(tbl.createdAt.isBiggerOrEqualValue(startDate));
      }
      
      if (endDate != null) {
        predicates.add(tbl.createdAt.isSmallerOrEqualValue(endDate));
      }
      
      return predicates.isEmpty 
        ? const Constant(true) 
        : predicates.reduce((value, element) => value & element);
    }))
    .get();
}




Future<Map<String, dynamic>> getTradeStatsInDateRange(DateTime start, DateTime end) async {
  final query = select(tradeDatas)
    ..where((tbl) => tbl.createdAt.isBetween(start, end));

  final results = await query.get();

  int totalTrades = results.length;
  int winningTrades = results.where((trade) => trade.pips != null && trade.pips! > 0).length;
  int losingTrades = results.where((trade) => trade.pips != null && trade.pips! < 0).length;
  double totalPips = results.fold(0, (sum, trade) => sum + (trade.pips ?? 0));
  double totalMoney = results.fold(0, (sum, trade) => sum + (trade.money ?? 0));

  return {
    'totalTrades': totalTrades,
    'winningTrades': winningTrades,
    'losingTrades': losingTrades,
    'winRate': totalTrades > 0 ? winningTrades / totalTrades : 0,
    'totalPips': totalPips,
    'totalMoney': totalMoney,
    'averagePipsPerTrade': totalTrades > 0 ? totalPips / totalTrades : 0,
    'averageMoneyPerTrade': totalTrades > 0 ? totalMoney / totalTrades : 0,
  };
}
   */














  //TODO Tagsに関して

  



  //TODO TaggedTradeDatasに関して
  /*
  // トレードデータにタグを追加
Future<void> addTagToTradeData(int tradeDataId, int tagId) {
  return into(taggedTradeDatas).insert(
    TaggedTradeDatasCompanion.insert(tradeDataId: tradeDataId, tagId: tagId)
  );
}

// トレードデータからタグを削除
Future<int> removeTagFromTradeData(int tradeDataId, int tagId) {
  return (delete(taggedTradeDatas)
    ..where((ttd) => ttd.tradeDataId.equals(tradeDataId) & ttd.tagId.equals(tagId)))
    .go();
}

// トレードデータに関連するすべてのタグを取得
Future<List<Tag>> getTagsForTradeData(int tradeDataId) {
  final query = select(tags).join([
    innerJoin(taggedTradeDatas, taggedTradeDatas.tagId.equalsExp(tags.id))
  ])
  ..where(taggedTradeDatas.tradeDataId.equals(tradeDataId));
  
  return query.map((row) => row.readTable(tags)).get();
}

// 特定のタグを持つすべてのトレードデータを取得
Future<List<TradeData>> getTradeDatasByTag(int tagId) {
  final query = select(tradeDatas).join([
    innerJoin(taggedTradeDatas, taggedTradeDatas.tradeDataId.equalsExp(tradeDatas.id))
  ])
  ..where(taggedTradeDatas.tagId.equals(tagId));
  
  return query.map((row) => row.readTable(tradeDatas)).get();
}
   */









//TODO TagAttributesに関して

/*
// 新しいタグ属性を追加
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
 */

  





















  


  




  










  






}

LazyDatabase _openConnection(String dbName) {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final fileName = '$dbName.sqlite';
    final file = File(p.join(dbFolder.path, fileName));

    // Also work around limitations on old Android versions
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }


    return NativeDatabase(file, logStatements: true);
  });
}
