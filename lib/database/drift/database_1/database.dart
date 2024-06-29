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

 //TODO 関数についてはextensionsにある。



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
